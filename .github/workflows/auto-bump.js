// Copyright The OpenTelemetry Authors
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

const OWNER_REPO = {
    owner: 'open-telemetry',
    repo: 'opentelemetry-collector-contrib',
}

async function findNewDependencyVersion(core, semver, github, version) {
    let vers = semver.parse(version);

    let main = await github.git.getRef({
        ref: 'heads/main',
        ...OWNER_REPO,
    });
    let mainSha = main.data.object.sha;
    core.info(`main sha is at ${mainSha}`);
    let newVersion = '';

    if (vers.prerelease.length === 2) {
        let rel = vers.prerelease[1].split('-');
        let ref = rel[1];

        core.info(`Current dependency version is ${ref}.`)

        if (mainSha.startsWith(ref)) {
            core.info(`Current dependency version matches latest upstream commit on main.`)
        } else {
            core.info('Will upgrade to later commit found on main.')
            newVersion = mainSha;
        }
    } else {
        // Check this version to see what it points to.
        let vers = await github.git.getRef({
            ref: `tags/${version}`,
            ...OWNER_REPO,
        })
        let versSha = vers.data.object.sha;
        core.info(`Version tag is at sha ${versSha}`)

        if (mainSha !== versSha) {
            newVersion = mainSha;
            core.info('Will upgrade from a versioned dependency to a later commit found on main.');
        } else {
            core.info('The current versioned dependency matches latest commit on main.')
        }
    }

    return newVersion;
}

async function getGoMod(exec) {
    let stdout = '';
    let stderr = '';

    const options = {};
    options.listeners = {
        stdout: (data) => {
            stdout += data.toString();
        },
        stderr: (data) => {
            stderr += data.toString();
        }
    };

    await exec.exec('go', ['mod', 'edit', '-json'], options);
    return JSON.parse(stdout);
}

async function updateRequires(exec) {
    let gomod = await getGoMod(exec)
    let newVersion = '';

    for (let mod of gomod.Require) {
        if (mod.Path.startsWith('github.com/open-telemetry/opentelemetry-collector-contrib')) {
            newVersion = mod.Version;
            break;
        }
    }

    if (newVersion === '') {
        throw 'Unable to determine new package version';
    }

    for (let mod of gomod.Replace) {
        if (!mod.Old.Path.startsWith('github.com/open-telemetry/opentelemetry-collector-contrib')) {
            continue;
        }

        let vers = '';
        if ("Version" in mod.Old) {
            vers = `@${mod.Old.Version}`;
        }
        await exec.exec('go', ['mod', 'edit', '-replace', `${mod.Old.Path}${vers}=${mod.New.Path}@${newVersion}`])
    }
}


module.exports = async ({github, core, context, exec, semver}) => {
    let gomod = await getGoMod(exec)
    let otMods = [];
    let version = '';

    for (let mod of gomod.Require) {
        if (mod.Path.startsWith('github.com/open-telemetry/opentelemetry-collector-contrib')) {
            otMods.push(mod.Path)
            if (version === '') {
                version = mod.Version;
            }
        }
    }

    let newVersion = await findNewDependencyVersion(core, semver, github, version);

    if (newVersion === '') {
        core.info('Current dependency version is latest, not upgrading.')
        return;
    } else {
        core.info(`Current dependency will be updated to new version: ${newVersion}`);
    }

    let pkgs = otMods.map((mod, _) => `${mod}@${newVersion}`)

    await exec.exec('go', ['get'].concat(pkgs))

    await updateRequires(exec)

    await exec.exec('go', ['mod', 'tidy'])
}
