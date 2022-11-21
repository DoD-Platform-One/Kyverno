# kyverno

![Version: 2.6.1-bb.0](https://img.shields.io/badge/Version-2.6.1--bb.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v1.8.1](https://img.shields.io/badge/AppVersion-v1.8.1-informational?style=flat-square)

Kubernetes Native Policy Management

## Upstream References
* <https://kyverno.io/>

* <https://github.com/kyverno/kyverno>

## Learn More
* [Application Overview](docs/overview.md)
* [Other Documentation](docs/)

## Pre-Requisites

* Kubernetes Cluster deployed
* Kubernetes config installed in `~/.kube/config`
* Helm installed

Kubernetes: `>=1.16.0-0`

Install Helm

https://helm.sh/docs/intro/install/

## Deployment

* Clone down the repository
* cd into directory
```bash
helm install kyverno chart/
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| nameOverride | string | `nil` | Override the name of the chart |
| fullnameOverride | string | `nil` | Override the expanded name of the chart |
| namespace | string | `nil` | Namespace the chart deploys to |
| customLabels | object | `{}` | Additional labels |
| rbac.create | bool | `true` | Create ClusterRoles, ClusterRoleBindings, and ServiceAccount |
| rbac.serviceAccount.create | bool | `true` | Create a ServiceAccount |
| rbac.serviceAccount.name | string | `nil` | The ServiceAccount name |
| rbac.serviceAccount.annotations | object | `{}` | Annotations for the ServiceAccount |
| image.registry | string | `nil` | Image registry |
| image.repository | string | `"registry1.dso.mil/ironbank/nirmata/kyverno"` | Image repository |
| image.tag | string | `nil` | Image tag Defaults to appVersion in Chart.yaml if omitted |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| image.pullSecrets | list | `[]` | Image pull secrets |
| initImage.registry | string | `nil` | Image registry |
| initImage.repository | string | `"registry1.dso.mil/ironbank/nirmata/kyvernopre"` | Image repository |
| initImage.tag | string | `nil` | Image tag If initImage.tag is missing, defaults to image.tag |
| initImage.pullPolicy | string | `nil` | Image pull policy If initImage.pullPolicy is missing, defaults to image.pullPolicy |
| initContainer.extraArgs | list | `["--loggingFormat=text"]` | Extra arguments to give to the kyvernopre binary. |
| testImage.registry | string | `nil` | Image registry |
| testImage.repository | string | `"registry1.dso.mil/ironbank/redhat/ubi/ubi8-minimal"` | Image repository Defaults to `busybox` if omitted |
| testImage.tag | float | `8.7` | Image tag Defaults to `latest` if omitted |
| testImage.pullPolicy | string | `nil` | Image pull policy Defaults to image.pullPolicy if omitted |
| replicaCount | int | `1` | Desired number of pods |
| podLabels | object | `{}` | Additional labels to add to each pod |
| podAnnotations | object | `{}` | Additional annotations to add to each pod |
| podSecurityContext | object | `{}` | Security context for the pod |
| securityContext | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"privileged":false,"readOnlyRootFilesystem":true,"runAsNonRoot":true,"seccompProfile":{"type":"RuntimeDefault"}}` | Security context for the containers |
| testSecurityContext | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"privileged":false,"readOnlyRootFilesystem":true,"runAsGroup":65534,"runAsNonRoot":true,"runAsUser":65534,"seccompProfile":{"type":"RuntimeDefault"}}` | Security context for the test containers |
| priorityClassName | string | `""` | Optional priority class to be used for kyverno pods |
| antiAffinity.enable | bool | `true` | Pod antiAffinities toggle. Enabled by default but can be disabled if you want to schedule pods to the same node. |
| podAntiAffinity | object | See [values.yaml](values.yaml) | Pod anti affinity constraints. |
| podAffinity | object | `{}` | Pod affinity constraints. |
| nodeAffinity | object | `{}` | Node affinity constraints. |
| podDisruptionBudget.minAvailable | int | `1` | Configures the minimum available pods for kyverno disruptions. Cannot be used if `maxUnavailable` is set. |
| podDisruptionBudget.maxUnavailable | string | `nil` | Configures the maximum unavailable pods for kyverno disruptions. Cannot be used if `minAvailable` is set. |
| nodeSelector | object | `{}` | Node labels for pod assignment |
| tolerations | list | `[]` | List of node taints to tolerate |
| hostNetwork | bool | `false` | Change `hostNetwork` to `true` when you want the kyverno's pod to share its host's network namespace. Useful for situations like when you end up dealing with a custom CNI over Amazon EKS. Update the `dnsPolicy` accordingly as well to suit the host network mode. |
| dnsPolicy | string | `"ClusterFirst"` | `dnsPolicy` determines the manner in which DNS resolution happens in the cluster. In case of `hostNetwork: true`, usually, the `dnsPolicy` is suitable to be `ClusterFirstWithHostNet`. For further reference: https://kubernetes.io/docs/concepts/services-networking/dns-pod-service/#pod-s-dns-policy. |
| envVarsInit | object | `{}` | Env variables for initContainers. |
| envVars | object | `{}` | Env variables for containers. |
| extraArgs | list | `["--clientRateLimitQPS=25","--clientRateLimitBurst=50","--autogenInternals=false"]` | Extra arguments to give to the binary. |
| extraInitContainers | list | `[]` | Array of extra init containers |
| extraContainers | list | `[]` | Array of extra containers to run alongside kyverno |
| imagePullSecrets | object | `{}` | Image pull secrets for image verify and imageData policies. This will define the `--imagePullSecrets` Kyverno argument. |
| resources.limits | object | `{"cpu":"500m","memory":"512Mi"}` | Pod resource limits |
| resources.requests | object | `{"cpu":"500m","memory":"512Mi"}` | Pod resource requests |
| initResources.limits | object | `{"cpu":"100m","memory":"256Mi"}` | Pod resource limits |
| initResources.requests | object | `{"cpu":"100m","memory":"256Mi"}` | Pod resource requests |
| testResources.limits | object | `{"cpu":"100m","memory":"256Mi"}` | Pod resource limits |
| testResources.requests | object | `{"cpu":"10m","memory":"64Mi"}` | Pod resource requests |
| startupProbe | object | See [values.yaml](values.yaml) | Startup probe. The block is directly forwarded into the deployment, so you can use whatever startupProbes configuration you want. ref: https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-probes/ |
| livenessProbe | object | See [values.yaml](values.yaml) | Liveness probe. The block is directly forwarded into the deployment, so you can use whatever livenessProbe configuration you want. ref: https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-probes/ |
| readinessProbe | object | See [values.yaml](values.yaml) | Readiness Probe. The block is directly forwarded into the deployment, so you can use whatever readinessProbe configuration you want. ref: https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-probes/ |
| generatecontrollerExtraResources | list | `[]` | Additional resources to be added to controller RBAC permissions. |
| excludeKyvernoNamespace | bool | `true` | Exclude Kyverno namespace Determines if default Kyverno namespace exclusion is enabled for webhooks and resourceFilters |
| resourceFiltersExcludeNamespaces | list | `[]` | resourceFilter namespace exclude Namespaces to exclude from the default resourceFilters |
| config.resourceFilters | list | See [values.yaml](values.yaml) | Resource types to be skipped by the Kyverno policy engine. Make sure to surround each entry in quotes so that it doesn't get parsed as a nested YAML list. These are joined together without spaces, run through `tpl`, and the result is set in the config map. |
| config.existingConfig | string | `""` | Name of an existing config map (ignores default/provided resourceFilters) |
| config.excludeGroupRole | string | `nil` | Exclude group role |
| config.excludeUsername | string | `nil` | Exclude username |
| config.webhooks | string | `nil` | Defines the `namespaceSelector` in the webhook configurations. Note that it takes a list of `namespaceSelector` and/or `objectSelector` in the JSON format, and only the first element will be forwarded to the webhook configurations. The Kyverno namespace is excluded if `excludeKyvernoNamespace` is `true` (default) |
| config.generateSuccessEvents | bool | `false` | Generate success events. |
| config.metricsConfig | object | `{"namespaces":{"exclude":[],"include":[]}}` | Metrics config. |
| updateStrategy | object | See [values.yaml](values.yaml) | Deployment update strategy. Ref: https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#strategy |
| service.port | int | `443` | Service port. |
| service.type | string | `"ClusterIP"` | Service type. |
| service.nodePort | string | `nil` | Service node port. Only used if `service.type` is `NodePort`. |
| service.annotations | object | `{}` | Service annotations. |
| topologySpreadConstraints | list | `[]` | Topology spread constraints. |
| metricsService.create | bool | `true` | Create service. |
| metricsService.port | int | `8000` | Service port. Kyverno's metrics server will be exposed at this port. |
| metricsService.type | string | `"ClusterIP"` | Service type. |
| metricsService.nodePort | string | `nil` | Service node port. Only used if `metricsService.type` is `NodePort`. |
| metricsService.annotations | object | `{}` | Service annotations. |
| serviceMonitor.enabled | bool | `false` | Create a `ServiceMonitor` to collect Prometheus metrics. |
| serviceMonitor.additionalLabels | string | `nil` | Additional labels |
| serviceMonitor.namespace | string | `nil` | Override namespace (default is the same as kyverno) |
| serviceMonitor.interval | string | `"30s"` | Interval to scrape metrics |
| serviceMonitor.scrapeTimeout | string | `"25s"` | Timeout if metrics can't be retrieved in given time interval |
| serviceMonitor.secure | bool | `false` | Is TLS required for endpoint |
| serviceMonitor.tlsConfig | object | `{}` | TLS Configuration for endpoint |
| serviceMonitor.dashboards.namespace | string | `nil` |  |
| serviceMonitor.dashboards.label | string | `"grafana_dashboard"` |  |
| createSelfSignedCert | bool | `false` | Kyverno requires a certificate key pair and corresponding certificate authority to properly register its webhooks. This can be done in one of 3 ways: 1) Use kube-controller-manager to generate a CA-signed certificate (preferred) 2) Provide your own CA and cert.    In this case, you will need to create a certificate with a specific name and data structure.    As long as you follow the naming scheme, it will be automatically picked up.    kyverno-svc.(namespace).svc.kyverno-tls-ca (with data entries named tls.key and tls.crt)    kyverno-svc.kyverno.svc.kyverno-tls-pair (with data entries named tls.key and tls.crt) 3) Let Helm generate a self signed cert, by setting createSelfSignedCert true If letting Kyverno create its own CA or providing your own, make createSelfSignedCert is false |
| installCRDs | bool | `true` | Whether to have Helm install the Kyverno CRDs. If the CRDs are not installed by Helm, they must be added before policies can be created. |
| networkPolicy.enabled | bool | `false` | When true, use a NetworkPolicy to allow ingress to the webhook This is useful on clusters using Calico and/or native k8s network policies in a default-deny setup. |
| networkPolicy.ingressFrom | list | `[]` | A list of valid from selectors according to https://kubernetes.io/docs/concepts/services-networking/network-policies. |
| webhooksCleanup.enable | bool | `false` | Create a helm pre-delete hook to cleanup webhooks. |
| webhooksCleanup.image | string | `"registry1.dso.mil/ironbank/opensource/kubernetes/kubectl:v1.25.4"` | `kubectl` image to run commands for deleting webhooks. |
| tufRootMountPath | string | `"/.sigstore"` | A writable volume to use for the TUF root initialization |
| registries | object | `{"ports":[{"port":443,"protocol":"TCP"}]}` | A list of registry ports to be accepted |
| networkPolicies.enabled | bool | `false` |  |
| networkPolicies.controlPlaneCidr | string | `"0.0.0.0/0"` |  |
| istio.enabled | bool | `false` |  |
| openshift | bool | `false` |  |
| bbtests.enabled | bool | `false` |  |
| bbtests.scripts.image | string | `"registry1.dso.mil/ironbank/opensource/kubernetes/kubectl:v1.25.4"` |  |
| bbtests.scripts.additionalVolumeMounts[0].name | string | `"kyverno-bbtest-manifest"` |  |
| bbtests.scripts.additionalVolumeMounts[0].mountPath | string | `"/yaml"` |  |
| bbtests.scripts.additionalVolumes[0].name | string | `"kyverno-bbtest-manifest"` |  |
| bbtests.scripts.additionalVolumes[0].configMap.name | string | `"kyverno-bbtest-manifest"` |  |

## Contributing

Please see the [contributing guide](./CONTRIBUTING.md) if you are interested in contributing.
