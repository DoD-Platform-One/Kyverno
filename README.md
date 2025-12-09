<!-- Warning: Do not manually edit this file. See notes on gluon + helm-docs at the end of this file for more information. -->
# kyverno

![Version: 3.7.0-bb.0](https://img.shields.io/badge/Version-3.7.0--bb.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v1.16.1](https://img.shields.io/badge/AppVersion-v1.16.1-informational?style=flat-square) ![Maintenance Track: bb_integrated](https://img.shields.io/badge/Maintenance_Track-bb_integrated-green?style=flat-square)

Kubernetes Native Policy Management

## Upstream References

- <https://kyverno.io/>
- <https://github.com/kyverno/kyverno>

## Upstream Release Notes

- [Find our upstream chart's CHANGELOG here](https://github.com/kyverno/kyverno/blob/main/CHANGELOG.md)
- [and our upstream application release notes here](https://github.com/kyverno/kyverno/releases)

## Learn More

- [Application Overview](docs/overview.md)
- [Other Documentation](docs/)

## Pre-Requisites

- Kubernetes Cluster deployed
- Kubernetes config installed in `~/.kube/config`
- Helm installed

Kubernetes: `>=1.25.0-0`

Install Helm

https://helm.sh/docs/intro/install/

## Deployment

- Clone down the repository
- cd into directory

```bash
helm install kyverno chart/
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| networkPolicies.enabled | bool | `false` |  |
| networkPolicies.controlPlaneCidr | string | `"0.0.0.0/0"` |  |
| networkPolicies.vpcCidr | string | `"0.0.0.0/0"` |  |
| networkPolicies.externalRegistries.allowEgress | bool | `false` |  |
| networkPolicies.externalRegistries.ports | list | `[]` |  |
| networkPolicies.allowExternalRegistryEgress | bool | `false` |  |
| networkPolicies.additionalPolicies | list | `[]` |  |
| istio.enabled | bool | `false` |  |
| openshift | bool | `false` |  |
| bbtests.enabled | bool | `false` |  |
| bbtests.scripts.image | string | `"registry1.dso.mil/ironbank/opensource/kubernetes/kubectl:v1.34.2"` |  |
| bbtests.scripts.additionalVolumeMounts[0].name | string | `"kyverno-bbtest-manifest"` |  |
| bbtests.scripts.additionalVolumeMounts[0].mountPath | string | `"/yaml"` |  |
| bbtests.scripts.additionalVolumes[0].name | string | `"kyverno-bbtest-manifest"` |  |
| bbtests.scripts.additionalVolumes[0].configMap.name | string | `"kyverno-bbtest-manifest"` |  |
| global.image.registry | string | `"registry1.dso.mil"` | Global value that allows to set a single image registry across all deployments. When set, it will override any values set under `.image.registry` across the chart. |
| global.image.pullPolicy | string | `"IfNotPresent"` |  |
| global.imagePullSecrets[0].name | string | `"private-registry"` |  |
| global.resyncPeriod | string | `"15m"` |  |
| global.templating.enabled | bool | `false` |  |
| global.templating.debug | bool | `false` |  |
| global.templating.version | string | `nil` |  |
| upstream | object | Upstream chart values | Values to pass to [the upstream kyverno chart](https://github.com/kyverno/kyverno/blob/main/charts/kyverno/values.yaml) |
| upstream.upgrade.fromV2 | bool | `true` | Upgrading from v2 to v3 is not allowed by default, set this to true once changes have been reviewed. |
| upstream.apiVersionOverride.podDisruptionBudget | string | `"policy/v1"` | Override api version used to create `PodDisruptionBudget`` resources. When not specified the chart will check if `policy/v1/PodDisruptionBudget` is available to determine the api version automatically. |
| upstream.crds.podSecurityContext | object | `{"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000,"securityContext":{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"privileged":false,"readOnlyRootFilesystem":true,"runAsGroup":65534,"runAsNonRoot":true,"runAsUser":65534,"seccompProfile":{"type":"RuntimeDefault"}}}` | Security context for the pod |
| upstream.existingImagePullSecrets | list | `["private-registry"]` | Existing Image pull secrets for image verification policies, this will define the `--imagePullSecrets` argument |
| upstream.webhooksCleanup.enabled | bool | `true` | Create a helm pre-delete hook to cleanup webhooks. |
| upstream.policyReportsCleanup.resources | object | `{"limits":{"cpu":"1","memory":"512Mi"},"requests":{"cpu":"0.5","memory":"256Mi"}}` | Resource limits for the containers |
| upstream.cleanupJobs.admissionReports.schedule | string | `"*/10 * * * *"` | Cronjob schedule |
| upstream.cleanupJobs.admissionReports.threshold | int | `10000` | Reports threshold, if number of reports are above this value the cronjob will start deleting them |
| upstream.cleanupJobs.admissionReports.history | object | `{"failure":1,"success":1}` | Cronjob history |
| upstream.cleanupJobs.admissionReports.podSecurityContext | object | `{"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000}` | Security context for the pod |
| upstream.cleanupJobs.admissionReports.securityContext | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"privileged":false,"readOnlyRootFilesystem":true,"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000,"seccompProfile":{"type":"RuntimeDefault"}}` | Security context for the containers |
| upstream.cleanupJobs.clusterAdmissionReports.enabled | bool | `true` | Enable cleanup cronjob |
| upstream.cleanupJobs.clusterAdmissionReports.imagePullSecrets | list | `[{"name":"private-registry"}]` | Image pull secrets |
| upstream.cleanupJobs.clusterAdmissionReports.schedule | string | `"*/10 * * * *"` | Cronjob schedule |
| upstream.cleanupJobs.clusterAdmissionReports.threshold | int | `10000` | Reports threshold, if number of reports are above this value the cronjob will start deleting them |
| upstream.cleanupJobs.clusterAdmissionReports.history | object | `{"failure":1,"success":1}` | Cronjob history |
| upstream.cleanupJobs.clusterAdmissionReports.podSecurityContext | object | `{"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000}` | Security context for the pod |
| upstream.cleanupJobs.clusterAdmissionReports.securityContext | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"privileged":false,"readOnlyRootFilesystem":true,"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000,"seccompProfile":{"type":"RuntimeDefault"}}` | Security context for the containers |
| upstream.cleanupJobs.updateRequests.imagePullSecrets | list | `[{"name":"private-registry"}]` | Image pull secrets |
| upstream.cleanupJobs.updateRequests.schedule | string | `"*/10 * * * *"` | Cronjob schedule |
| upstream.cleanupJobs.updateRequests.podSecurityContext | object | `{"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000}` | Security context for the pod |
| upstream.cleanupJobs.updateRequests.securityContext | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"privileged":false,"readOnlyRootFilesystem":true,"runAsNonRoot":true,"seccompProfile":{"type":"RuntimeDefault"}}` | Security context for the containers |
| upstream.cleanupJobs.ephemeralReports.podSecurityContext | object | `{"runAsGroup":1001,"runAsNonRoot":true,"runAsUser":1001}` | Security context for the pod |
| upstream.cleanupJobs.ephemeralReports.securityContext | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"privileged":false,"readOnlyRootFilesystem":true,"runAsNonRoot":true,"seccompProfile":{"type":"RuntimeDefault"}}` | Security context for the containers |
| upstream.cleanupJobs.clusterEphemeralReports.schedule | string | `"*/10 * * * *"` | Cronjob schedule |
| upstream.cleanupJobs.clusterEphemeralReports.threshold | int | `10000` | Reports threshold, if number of reports are above this value the cronjob will start deleting them |
| upstream.cleanupJobs.clusterEphemeralReports.history | object | `{"failure":1,"success":1}` | Cronjob history |
| upstream.cleanupJobs.clusterEphemeralReports.podSecurityContext | object | `{"runAsGroup":1001,"runAsNonRoot":true,"runAsUser":1001}` | Security context for the pod |
| upstream.cleanupJobs.clusterEphemeralReports.securityContext | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"privileged":false,"readOnlyRootFilesystem":true,"runAsNonRoot":true,"seccompProfile":{"type":"RuntimeDefault"}}` | Security context for the containers |
| upstream.admissionController.rbac.clusterRole.extraResources | list | `[{"apiGroups":["*"],"resources":["*"],"verbs":["get","list","watch"]}]` | Extra resource permissions to add in the cluster role |
| upstream.admissionController.createSelfSignedCert | bool | `false` | Create self-signed certificates at deployment time. The certificates won't be automatically renewed if this is set to `true`. |
| upstream.admissionController.replicas | int | `3` | Desired number of pods |
| upstream.admissionController.initContainer.resources.limits | object | `{"cpu":1,"memory":"1Gi"}` | Pod resource limits |
| upstream.admissionController.initContainer.resources.requests | object | `{"cpu":"10m","memory":"64Mi"}` | Pod resource requests |
| upstream.admissionController.initContainer.securityContext | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"privileged":false,"readOnlyRootFilesystem":true,"runAsGroup":10001,"runAsNonRoot":true,"runAsUser":10001,"seccompProfile":{"type":"RuntimeDefault"}}` | Container security context |
| upstream.backgroundController.rbac.clusterRole.extraResources | list | `[{"apiGroups":["*"],"resources":["*"],"verbs":["get","list","watch"]},{"apiGroups":["*"],"resources":["secrets"],"verbs":["create","update","delete"]}]` | Extra resource permissions to add in the cluster role |
| upstream.cleanupController.securityContext | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"privileged":false,"readOnlyRootFilesystem":true,"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000,"seccompProfile":{"type":"RuntimeDefault"}}` | Security context for the containers |
| upstream.reportsController.rbac.clusterRole.extraResources | list | `[{"apiGroups":["*"],"resources":["*"],"verbs":["get","list","watch"]}]` | Extra resource permissions to add in the cluster role |
| upstream.test.sleep | int | `20` | Sleep time before running test |
| upstream.test.resources.limits | object | `{"cpu":"100m","memory":"256Mi"}` | Pod resource limits |
| upstream.test.resources.requests | object | `{"cpu":"10m","memory":"64Mi"}` | Pod resource requests |
| upstream.test.podSecurityContext | object | `{"runAsGroup":65534,"runAsNonRoot":true,"runAsUser":65534}` | Security context for the test pod |
| upstream.test.securityContext | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"privileged":false,"readOnlyRootFilesystem":true,"runAsGroup":65534,"runAsNonRoot":true,"runAsUser":65534,"seccompProfile":{"type":"RuntimeDefault"}}` | Security context for the test containers |

## Contributing

Please see the [contributing guide](./CONTRIBUTING.md) if you are interested in contributing.

---

_This file is programatically generated using `helm-docs` and some BigBang-specific templates. The `gluon` repository has [instructions for regenerating package READMEs](https://repo1.dso.mil/big-bang/product/packages/gluon/-/blob/master/docs/bb-package-readme.md)._

