module github.com/signalfx/splunk-otel-collector

go 1.15

require (
	github.com/client9/misspell v0.3.4
	github.com/containerd/containerd v1.4.1 // indirect
	github.com/docker/docker v17.12.0-ce-rc1.0.20200916142827-bd33bbf0497b+incompatible // indirect
	github.com/go-playground/universal-translator v0.17.0 // indirect
	github.com/golangci/golangci-lint v1.31.0
	github.com/google/addlicense v0.0.0-20200906110928-a0294312aa76
	github.com/jstemmer/go-junit-report v0.9.1
	github.com/open-telemetry/opentelemetry-collector-contrib/exporter/sapmexporter v0.20.1-0.20210219213025-5de076e9773b
	github.com/open-telemetry/opentelemetry-collector-contrib/exporter/signalfxexporter v0.20.1-0.20210219213025-5de076e9773b
	github.com/open-telemetry/opentelemetry-collector-contrib/exporter/splunkhecexporter v0.20.1-0.20210219213025-5de076e9773b
	github.com/open-telemetry/opentelemetry-collector-contrib/extension/httpforwarder v0.20.1-0.20210219213025-5de076e9773b
	github.com/open-telemetry/opentelemetry-collector-contrib/extension/observer/hostobserver v0.20.1-0.20210219213025-5de076e9773b
	github.com/open-telemetry/opentelemetry-collector-contrib/extension/observer/k8sobserver v0.20.1-0.20210219213025-5de076e9773b
	github.com/open-telemetry/opentelemetry-collector-contrib/pkg/experimentalmetricmetadata v0.0.0-20210219213025-5de076e9773b
	github.com/open-telemetry/opentelemetry-collector-contrib/processor/k8sprocessor v0.20.1-0.20210219213025-5de076e9773b
	github.com/open-telemetry/opentelemetry-collector-contrib/processor/metricstransformprocessor v0.20.1-0.20210219213025-5de076e9773b
	github.com/open-telemetry/opentelemetry-collector-contrib/processor/resourcedetectionprocessor v0.20.1-0.20210219213025-5de076e9773b
	github.com/open-telemetry/opentelemetry-collector-contrib/receiver/carbonreceiver v0.20.1-0.20210219213025-5de076e9773b
	github.com/open-telemetry/opentelemetry-collector-contrib/receiver/collectdreceiver v0.20.1-0.20210219213025-5de076e9773b
	github.com/open-telemetry/opentelemetry-collector-contrib/receiver/k8sclusterreceiver v0.20.1-0.20210219213025-5de076e9773b
	github.com/open-telemetry/opentelemetry-collector-contrib/receiver/kubeletstatsreceiver v0.20.1-0.20210219213025-5de076e9773b
	github.com/open-telemetry/opentelemetry-collector-contrib/receiver/prometheusexecreceiver v0.20.1-0.20210219213025-5de076e9773b
	github.com/open-telemetry/opentelemetry-collector-contrib/receiver/receivercreator v0.20.1-0.20210219213025-5de076e9773b
	github.com/open-telemetry/opentelemetry-collector-contrib/receiver/redisreceiver v0.20.1-0.20210219213025-5de076e9773b // indirect
	github.com/open-telemetry/opentelemetry-collector-contrib/receiver/sapmreceiver v0.20.1-0.20210219213025-5de076e9773b
	github.com/open-telemetry/opentelemetry-collector-contrib/receiver/signalfxreceiver v0.20.1-0.20210219213025-5de076e9773b
	github.com/open-telemetry/opentelemetry-collector-contrib/receiver/simpleprometheusreceiver v0.20.1-0.20210219213025-5de076e9773b
	github.com/open-telemetry/opentelemetry-collector-contrib/receiver/splunkhecreceiver v0.20.1-0.20210219213025-5de076e9773b
	github.com/open-telemetry/opentelemetry-collector-contrib/receiver/statsdreceiver v0.20.1-0.20210219213025-5de076e9773b
	github.com/ory/go-acc v0.2.6
	github.com/pavius/impi v0.0.3
	github.com/securego/gosec/v2 v2.5.0
	github.com/signalfx/defaults v1.2.2-0.20180531161417-70562fe60657
	github.com/signalfx/golib/v3 v3.3.16
	github.com/signalfx/signalfx-agent v1.0.1-0.20210218155823-9b6186460a32
	github.com/sirupsen/logrus v1.6.0
	github.com/spf13/viper v1.7.1
	github.com/stretchr/testify v1.7.0
	go.opentelemetry.io/collector v0.20.1-0.20210218001603-48151d869607
	go.uber.org/zap v1.16.0
	golang.org/x/sys v0.0.0-20201214210602-f9fddec55a1e
	gopkg.in/yaml.v2 v2.4.0
	honnef.co/go/tools v0.0.1-2020.1.6
)

replace (
	github.com/open-telemetry/opentelemetry-collector-contrib/exporter/alibabacloudlogserviceexporter v0.0.0-00010101000000-000000000000 => github.com/open-telemetry/opentelemetry-collector-contrib/exporter/alibabacloudlogserviceexporter v0.0.0-20210219213025-5de076e9773b
	github.com/open-telemetry/opentelemetry-collector-contrib/exporter/signalfxexporter v0.0.0-00010101000000-000000000000 => github.com/open-telemetry/opentelemetry-collector-contrib/exporter/signalfxexporter v0.20.1-0.20210219213025-5de076e9773b
	github.com/open-telemetry/opentelemetry-collector-contrib/exporter/splunkhecexporter v0.0.0-00010101000000-000000000000 => github.com/open-telemetry/opentelemetry-collector-contrib/exporter/splunkhecexporter v0.20.1-0.20210219213025-5de076e9773b
	github.com/open-telemetry/opentelemetry-collector-contrib/extension/observer v0.0.0-00010101000000-000000000000 => github.com/open-telemetry/opentelemetry-collector-contrib/extension/observer v0.0.0-20210219213025-5de076e9773b
	github.com/open-telemetry/opentelemetry-collector-contrib/internal/common v0.0.0-00010101000000-000000000000 => github.com/open-telemetry/opentelemetry-collector-contrib/internal/common v0.0.0-20210219213025-5de076e9773b
	github.com/open-telemetry/opentelemetry-collector-contrib/internal/k8sconfig v0.0.0-00010101000000-000000000000 => github.com/open-telemetry/opentelemetry-collector-contrib/internal/k8sconfig v0.0.0-20210219213025-5de076e9773b
	github.com/open-telemetry/opentelemetry-collector-contrib/internal/splunk v0.0.0-00010101000000-000000000000 => github.com/open-telemetry/opentelemetry-collector-contrib/internal/splunk v0.0.0-20210219213025-5de076e9773b
	github.com/open-telemetry/opentelemetry-collector-contrib/pkg/batchperresourceattr => github.com/open-telemetry/opentelemetry-collector-contrib/pkg/batchperresourceattr v0.0.0-20210219213025-5de076e9773b
	github.com/open-telemetry/opentelemetry-collector-contrib/pkg/experimentalmetricmetadata v0.0.0-00010101000000-000000000000 => github.com/open-telemetry/opentelemetry-collector-contrib/pkg/experimentalmetricmetadata v0.0.0-20210219213025-5de076e9773b
	github.com/open-telemetry/opentelemetry-collector-contrib/receiver/redisreceiver v0.0.0-00010101000000-000000000000 => github.com/open-telemetry/opentelemetry-collector-contrib/receiver/redisreceiver v0.20.1-0.20210219213025-5de076e9773b
)

// each of these is required for the smartagentreceiver
replace (
	code.cloudfoundry.org/go-loggregator => github.com/signalfx/go-loggregator v1.0.1-0.20200205155641-5ba5ca92118d
	github.com/dancannon/gorethink => gopkg.in/gorethink/gorethink.v4 v4.0.0
	github.com/influxdata/telegraf => github.com/signalfx/telegraf v0.10.2-0.20201211214327-200738592ced
	github.com/prometheus/prometheus => github.com/prometheus/prometheus v1.8.2-0.20201105135750-00f16d1ac3a4
	github.com/signalfx/signalfx-agent/pkg/apm => github.com/signalfx/signalfx-agent/pkg/apm v0.0.0-20210218155823-9b6186460a32
	github.com/soheilhy/cmux => github.com/soheilhy/cmux v0.1.5-0.20210205191134-5ec6847320e5 // required for smartagentreceiver to drop google.golang.org/grpc/examples/helloworld/helloworld test dep
	google.golang.org/grpc => google.golang.org/grpc v1.29.1 // required for smartagentreceiver's go.etcd.io/etcd dep
)
