# kyverno

![Version: 2.1.3-bb.2](https://img.shields.io/badge/Version-2.1.3--bb.2-informational?style=flat-square) ![AppVersion: v1.5.1](https://img.shields.io/badge/AppVersion-v1.5.1-informational?style=flat-square)

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

Kubernetes: `>=1.10.0-0`

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
| nameOverride | string | `nil` |  |
| fullnameOverride | string | `nil` |  |
| namespace | string | `nil` |  |
| customLabels | object | `{}` | Additional labels |
| rbac.create | bool | `true` |  |
| rbac.serviceAccount.create | bool | `true` |  |
| rbac.serviceAccount.name | string | `nil` |  |
| rbac.serviceAccount.annotations | object | `{}` |  |
| image.repository | string | `"registry1.dso.mil/ironbank/nirmata/kyverno"` |  |
| image.tag | string | `"v1.5.1"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.pullSecrets | list | `[]` |  |
| initImage.repository | string | `"registry1.dso.mil/ironbank/nirmata/kyvernopre"` |  |
| initImage.tag | string | `"v1.5.1"` |  |
| initImage.pullPolicy | string | `nil` |  |
| testImage.repository | string | `"registry1.dso.mil/ironbank/redhat/ubi/ubi8-minimal"` |  |
| testImage.tag | float | `8.5` |  |
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
| resources.limits.cpu | string | `"100m"` |  |
| resources.limits.memory | string | `"256Mi"` |  |
| resources.requests.cpu | string | `"100m"` |  |
| resources.requests.memory | string | `"256Mi"` |  |
| initResources.limits.cpu | string | `"100m"` |  |
| initResources.limits.memory | string | `"256Mi"` |  |
| initResources.requests.cpu | string | `"100m"` |  |
| initResources.requests.memory | string | `"256Mi"` |  |
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
| serviceMonitor.dashboards.namespace | string | `nil` |  |
| serviceMonitor.dashboards.label | string | `"grafana_dashboard"` |  |
| createSelfSignedCert | bool | `false` |  |
| installCRDs | bool | `true` |  |
| networkPolicy.enabled | bool | `false` |  |
| networkPolicy.namespaceExpressions[0] | object | `{}` |  |
| networkPolicy.namespaceLabels | object | `{}` |  |
| networkPolicy.podExpressions[0] | object | `{}` |  |
| networkPolicy.podLabels | object | `{}` |  |
| networkPolicies.enabled | bool | `false` |  |
| networkPolicies.controlPlaneCidr | string | `"0.0.0.0/0"` |  |
| istio.enabled | bool | `false` |  |
| openshift | bool | `false` |  |

## Contributing

Please see the [contributing guide](./CONTRIBUTING.md) if you are interested in contributing.
