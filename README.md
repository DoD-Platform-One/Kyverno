# kyverno

![Version: 2.1.2-bb.0](https://img.shields.io/badge/Version-2.1.2-bb.0-informational?style=flat-square) ![AppVersion: v1.5.1](https://img.shields.io/badge/AppVersion-v1.5.1-informational?style=flat-square)

Kubernetes Native Policy Management
This repo contains an enhanced version of the [Helm chart for Kyverno](https://github.com/kyverno/kyverno/tree/main/charts/kyverno) that is fully compatible with [Big Bang](https://repo1.dso.mil/platform-one/big-bang/bigbang)

## Upstream References

* <https://kyverno.io/>
* <https://github.com/kyverno/kyverno>
* [Kyverno Documentation](https://kyverno.io/docs/)
* [Kyverno Policy Library](https://kyverno.io/policies/)

## Learn More

* [Other Documentation](docs/)

## Pre-Requisites

* [Helm](https://helm.sh/docs/intro/install/)
* [Kubectl](https://kubernetes.io/docs/tasks/tools/#kubectl)
* A running Kubernetes cluster (Kubernetes: `>=1.10.0-0`)

## Installation

* Clone the git repository
* `cd` into directory
* `helm install kyverno chart/`
* Additional details can be found in the [Kyverno README.md](chart/README.md).

> To deploy on top of Big Bang, read the [instructions in `bigbang/README.md`](./bigbang/README.md).

#### Uninstall

```
helm uninstall kyverno chart/
#clean up webhook
kubectl delete mutatingwebhookconfigurations kyverno-policy-mutating-webhook-cfg kyverno-resource-mutating-webhook-cfg kyverno-verify-mutating-webhook-cfg

kubectl delete validatingwebhookconfigurations kyverno-policy-validating-webhook-cfg kyverno-resource-validating-webhook-cfg

```



## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| nameOverride | string | `nil` |  |
| fullnameOverride | string | `nil` |  |
| namespace | string | `nil` |  |
| customLabels | object | `{}` | Additional labels |
| rbac.create | bool | `true` |  |
| rbac.serviceAccount.create | bool | `true` |  |
| rbac.serviceAccount.name | string | `nil` |  |
| rbac.serviceAccount.annotations | object | `{}` |  |
| image.repository | string | `"registry.dso.mil/platform-one/big-bang/apps/sandbox/kyverno/kyverno"` |  |
| image.tag | string | `nil` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.pullSecrets | list | `[]` |  |
| initImage.repository | string | `"registry.dso.mil/platform-one/big-bang/apps/sandbox/kyverno/kyvernopre"` |  |
| initImage.tag | string | `nil` |  |
| initImage.pullPolicy | string | `nil` |  |
| testImage.repository | string | `"registry.dso.mil/platform-one/big-bang/apps/sandbox/kyverno/busybox"` |  |
| testImage.tag | string | `"1.33.1"` |  |
| testImage.pullPolicy | string | `nil` |  |
| replicaCount | int | `1` |  |
| podLabels | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| antiAffinity.enable | bool | `true` |  |
| antiAffinity.topologyKey | string | `"kubernetes.io/hostname"` |  |
| podDisruptionBudget.enabled | bool | `false` |  |
| nodeSelector | object | `{}` |  |
| tolerations | list | `[]` |  |
| hostNetwork | bool | `false` |  |
| dnsPolicy | string | `"ClusterFirst"` |  |
| envVarsInit | object | `{}` |  |
| envVars | object | `{}` |  |
| extraArgs | list | `[]` |  |
| resources.limits.memory | string | `"256Mi"` |  |
| resources.requests.cpu | string | `"100m"` |  |
| resources.requests.memory | string | `"50Mi"` |  |
| initResources.limits.cpu | string | `"100m"` |  |
| initResources.limits.memory | string | `"256Mi"` |  |
| initResources.requests.cpu | string | `"10m"` |  |
| initResources.requests.memory | string | `"64Mi"` |  |
| livenessProbe.httpGet.path | string | `"/health/liveness"` |  |
| livenessProbe.httpGet.port | int | `9443` |  |
| livenessProbe.httpGet.scheme | string | `"HTTPS"` |  |
| livenessProbe.initialDelaySeconds | int | `15` |  |
| livenessProbe.periodSeconds | int | `30` |  |
| livenessProbe.timeoutSeconds | int | `5` |  |
| livenessProbe.failureThreshold | int | `2` |  |
| livenessProbe.successThreshold | int | `1` |  |
| readinessProbe.httpGet.path | string | `"/health/readiness"` |  |
| readinessProbe.httpGet.port | int | `9443` |  |
| readinessProbe.httpGet.scheme | string | `"HTTPS"` |  |
| readinessProbe.initialDelaySeconds | int | `5` |  |
| readinessProbe.periodSeconds | int | `10` |  |
| readinessProbe.timeoutSeconds | int | `5` |  |
| readinessProbe.failureThreshold | int | `6` |  |
| readinessProbe.successThreshold | int | `1` |  |
| generatecontrollerExtraResources | string | `nil` |  |
| config.resourceFilters[0] | string | `"[Event,*,*]"` |  |
| config.resourceFilters[1] | string | `"[*,kube-system,*]"` |  |
| config.resourceFilters[2] | string | `"[*,kube-public,*]"` |  |
| config.resourceFilters[3] | string | `"[*,kube-node-lease,*]"` |  |
| config.resourceFilters[4] | string | `"[Node,*,*]"` |  |
| config.resourceFilters[5] | string | `"[APIService,*,*]"` |  |
| config.resourceFilters[6] | string | `"[TokenReview,*,*]"` |  |
| config.resourceFilters[7] | string | `"[SubjectAccessReview,*,*]"` |  |
| config.resourceFilters[8] | string | `"[SelfSubjectAccessReview,*,*]"` |  |
| config.resourceFilters[9] | string | `"[*,kyverno,*]"` |  |
| config.resourceFilters[10] | string | `"[Binding,*,*]"` |  |
| config.resourceFilters[11] | string | `"[ReplicaSet,*,*]"` |  |
| config.resourceFilters[12] | string | `"[ReportChangeRequest,*,*]"` |  |
| config.resourceFilters[13] | string | `"[ClusterReportChangeRequest,*,*]"` |  |
| config.existingConfig | string | `""` |  |
| config.excludeGroupRole | string | `nil` |  |
| config.excludeUsername | string | `nil` |  |
| config.webhooks | string | `nil` |  |
| config.generateSuccessEvents | string | `"false"` |  |
| config.metricsConfig.namespaces.include | list | `[]` |  |
| config.metricsConfig.namespaces.exclude | list | `[]` |  |
| updateStrategy.rollingUpdate.maxSurge | int | `1` |  |
| updateStrategy.rollingUpdate.maxUnavailable | string | `"40%"` |  |
| updateStrategy.type | string | `"RollingUpdate"` |  |
| service.port | int | `443` |  |
| service.type | string | `"ClusterIP"` |  |
| service.nodePort | string | `nil` |  |
| service.annotations | object | `{}` |  |
| topologySpreadConstraints | list | `[]` |  |
| metricsService.create | bool | `true` |  |
| metricsService.type | string | `"ClusterIP"` |  |
| metricsService.port | int | `8000` |  |
| metricsService.nodePort | string | `nil` |  |
| metricsService.annotations | object | `{}` |  |
| serviceMonitor.enabled | bool | `false` |  |
| serviceMonitor.additionalLabels | string | `nil` |  |
| serviceMonitor.namespace | string | `nil` |  |
| serviceMonitor.interval | string | `"30s"` |  |
| serviceMonitor.scrapeTimeout | string | `"25s"` |  |
| serviceMonitor.secure | bool | `false` |  |
| serviceMonitor.tlsConfig | object | `{}` |  |
| createSelfSignedCert | bool | `false` |  |
| networkPolicy.enabled | bool | `false` |  |
| networkPolicy.namespaceExpressions[0] | object | `{}` |  |
| networkPolicy.namespaceLabels | object | `{}` |  |
| networkPolicy.podExpressions[0] | object | `{}` |  |
| networkPolicy.podLabels | object | `{}` |  |

## Contributing

Please see the [contributing guide](./CONTRIBUTING.md) if you are interested in contributing.
