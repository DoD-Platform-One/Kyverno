<!-- Warning: Do not manually edit this file. See notes on gluon + helm-docs at the end of this file for more information. -->
# kyverno

![Version: 3.3.6-bb.3](https://img.shields.io/badge/Version-3.3.6--bb.3-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v1.13.4](https://img.shields.io/badge/AppVersion-v1.13.4-informational?style=flat-square) ![Maintenance Track: bb_integrated](https://img.shields.io/badge/Maintenance_Track-bb_integrated-green?style=flat-square)

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
| global.image.registry | string | `"registry1.dso.mil"` | Global value that allows to set a single image registry across all deployments. When set, it will override any values set under `.image.registry` across the chart. |
| global.image.pullPolicy | string | `"IfNotPresent"` |  |
| global.imagePullSecrets[0].name | string | `"private-registry"` |  |
| global.resyncPeriod | string | `"15m"` |  |
| kyverno.nameOverride | string | `nil` |  |
| kyverno.fullnameOverride | string | `nil` |  |
| kyverno.namespaceOverride | string | `nil` |  |
| kyverno.upgrade.fromV2 | bool | `true` | Upgrading from v2 to v3 is not allowed by default, set this to true once changes have been reviewed. |
| kyverno.apiVersionOverride.podDisruptionBudget | string | `"policy/v1"` | Override api version used to create `PodDisruptionBudget`` resources. When not specified the chart will check if`policy/v1/PodDisruptionBudget` is available to determine the api version automatically. |
| kyverno.crds.install | bool | `true` |  |
| kyverno.crds.groups.image.registry | string | `nil` |  |
| kyverno.crds.groups.image.defaultRegistry | string | `"registry1.dso.mil"` |  |
| kyverno.crds.groups.image.repository | string | `"ironbank/opensource/kyverno/kyvernocli"` |  |
| kyverno.crds.groups.image.tag | string | `"v1.13.4"` |  |
| kyverno.crds.groups.image.pullPolicy | string | `nil` |  |
| kyverno.crds.groups.imagePullSecrets[0].name | string | `"private-registry"` |  |
| kyverno.crds.migration.enabled | bool | `true` |  |
| kyverno.crds.migration.image.defaultRegistry | string | `"registry1.dso.mil"` |  |
| kyverno.crds.migration.image.repository | string | `"ironbank/opensource/kyverno/kyvernocli"` |  |
| kyverno.crds.migration.image.tag | string | `"v1.13.4"` |  |
| kyverno.crds.migration.imagePullSecrets[0].name | string | `"private-registry"` |  |
| kyverno.crds.podSecurityContext | object | `{"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000,"securityContext":{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"privileged":false,"readOnlyRootFilesystem":true,"runAsGroup":65534,"runAsNonRoot":true,"runAsUser":65534,"seccompProfile":{"type":"RuntimeDefault"}}}` | Security context for the pod |
| kyverno.config.defaultRegistry | string | `"registry1.dso.mil"` |  |
| kyverno.config.resourceFilters[0] | string | `"[Event,*,*]"` |  |
| kyverno.config.resourceFilters[1] | string | `"[*/*,kube-system,*]"` |  |
| kyverno.config.resourceFilters[2] | string | `"[*/*,kube-public,*]"` |  |
| kyverno.config.resourceFilters[3] | string | `"[*/*,kube-node-lease,*]"` |  |
| kyverno.config.resourceFilters[4] | string | `"[Node,*,*]"` |  |
| kyverno.config.resourceFilters[5] | string | `"[Node/*,*,*]"` |  |
| kyverno.config.resourceFilters[6] | string | `"[APIService,*,*]"` |  |
| kyverno.config.resourceFilters[7] | string | `"[APIService/*,*,*]"` |  |
| kyverno.config.resourceFilters[8] | string | `"[TokenReview,*,*]"` |  |
| kyverno.config.resourceFilters[9] | string | `"[SubjectAccessReview,*,*]"` |  |
| kyverno.config.resourceFilters[10] | string | `"[SelfSubjectAccessReview,*,*]"` |  |
| kyverno.config.resourceFilters[11] | string | `"[Binding,*,*]"` |  |
| kyverno.config.resourceFilters[12] | string | `"[Pod/binding,*,*]"` |  |
| kyverno.config.resourceFilters[13] | string | `"[ReplicaSet,*,*]"` |  |
| kyverno.config.resourceFilters[14] | string | `"[ReplicaSet/*,*,*]"` |  |
| kyverno.config.resourceFilters[15] | string | `"[EphemeralReport,*,*]"` |  |
| kyverno.config.resourceFilters[16] | string | `"[ClusterEphemeralReport,*,*]"` |  |
| kyverno.config.resourceFilters[17] | string | `"[ClusterRole,*,{{ template \"kyverno.admission-controller.roleName\" . }}]"` |  |
| kyverno.config.resourceFilters[18] | string | `"[ClusterRole,*,{{ template \"kyverno.admission-controller.roleName\" . }}:core]"` |  |
| kyverno.config.resourceFilters[19] | string | `"[ClusterRole,*,{{ template \"kyverno.admission-controller.roleName\" . }}:additional]"` |  |
| kyverno.config.resourceFilters[20] | string | `"[ClusterRole,*,{{ template \"kyverno.background-controller.roleName\" . }}]"` |  |
| kyverno.config.resourceFilters[21] | string | `"[ClusterRole,*,{{ template \"kyverno.background-controller.roleName\" . }}:core]"` |  |
| kyverno.config.resourceFilters[22] | string | `"[ClusterRole,*,{{ template \"kyverno.background-controller.roleName\" . }}:additional]"` |  |
| kyverno.config.resourceFilters[23] | string | `"[ClusterRole,*,{{ template \"kyverno.cleanup-controller.roleName\" . }}]"` |  |
| kyverno.config.resourceFilters[24] | string | `"[ClusterRole,*,{{ template \"kyverno.cleanup-controller.roleName\" . }}:core]"` |  |
| kyverno.config.resourceFilters[25] | string | `"[ClusterRole,*,{{ template \"kyverno.cleanup-controller.roleName\" . }}:additional]"` |  |
| kyverno.config.resourceFilters[26] | string | `"[ClusterRole,*,{{ template \"kyverno.reports-controller.roleName\" . }}]"` |  |
| kyverno.config.resourceFilters[27] | string | `"[ClusterRole,*,{{ template \"kyverno.reports-controller.roleName\" . }}:core]"` |  |
| kyverno.config.resourceFilters[28] | string | `"[ClusterRole,*,{{ template \"kyverno.reports-controller.roleName\" . }}:additional]"` |  |
| kyverno.config.resourceFilters[29] | string | `"[ClusterRoleBinding,*,{{ template \"kyverno.admission-controller.roleName\" . }}]"` |  |
| kyverno.config.resourceFilters[30] | string | `"[ClusterRoleBinding,*,{{ template \"kyverno.background-controller.roleName\" . }}]"` |  |
| kyverno.config.resourceFilters[31] | string | `"[ClusterRoleBinding,*,{{ template \"kyverno.cleanup-controller.roleName\" . }}]"` |  |
| kyverno.config.resourceFilters[32] | string | `"[ClusterRoleBinding,*,{{ template \"kyverno.reports-controller.roleName\" . }}]"` |  |
| kyverno.config.resourceFilters[33] | string | `"[ServiceAccount,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.admission-controller.serviceAccountName\" . }}]"` |  |
| kyverno.config.resourceFilters[34] | string | `"[ServiceAccount/*,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.admission-controller.serviceAccountName\" . }}]"` |  |
| kyverno.config.resourceFilters[35] | string | `"[ServiceAccount,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.background-controller.serviceAccountName\" . }}]"` |  |
| kyverno.config.resourceFilters[36] | string | `"[ServiceAccount/*,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.background-controller.serviceAccountName\" . }}]"` |  |
| kyverno.config.resourceFilters[37] | string | `"[ServiceAccount,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.cleanup-controller.serviceAccountName\" . }}]"` |  |
| kyverno.config.resourceFilters[38] | string | `"[ServiceAccount/*,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.cleanup-controller.serviceAccountName\" . }}]"` |  |
| kyverno.config.resourceFilters[39] | string | `"[ServiceAccount,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.reports-controller.serviceAccountName\" . }}]"` |  |
| kyverno.config.resourceFilters[40] | string | `"[ServiceAccount/*,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.reports-controller.serviceAccountName\" . }}]"` |  |
| kyverno.config.resourceFilters[41] | string | `"[Role,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.admission-controller.roleName\" . }}]"` |  |
| kyverno.config.resourceFilters[42] | string | `"[Role,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.background-controller.roleName\" . }}]"` |  |
| kyverno.config.resourceFilters[43] | string | `"[Role,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.cleanup-controller.roleName\" . }}]"` |  |
| kyverno.config.resourceFilters[44] | string | `"[Role,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.reports-controller.roleName\" . }}]"` |  |
| kyverno.config.resourceFilters[45] | string | `"[RoleBinding,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.admission-controller.roleName\" . }}]"` |  |
| kyverno.config.resourceFilters[46] | string | `"[RoleBinding,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.background-controller.roleName\" . }}]"` |  |
| kyverno.config.resourceFilters[47] | string | `"[RoleBinding,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.cleanup-controller.roleName\" . }}]"` |  |
| kyverno.config.resourceFilters[48] | string | `"[RoleBinding,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.reports-controller.roleName\" . }}]"` |  |
| kyverno.config.resourceFilters[49] | string | `"[ConfigMap,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.config.configMapName\" . }}]"` |  |
| kyverno.config.resourceFilters[50] | string | `"[ConfigMap,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.config.metricsConfigMapName\" . }}]"` |  |
| kyverno.config.resourceFilters[51] | string | `"[Deployment,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.admission-controller.name\" . }}]"` |  |
| kyverno.config.resourceFilters[52] | string | `"[Deployment/*,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.admission-controller.name\" . }}]"` |  |
| kyverno.config.resourceFilters[53] | string | `"[Deployment,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.background-controller.name\" . }}]"` |  |
| kyverno.config.resourceFilters[54] | string | `"[Deployment/*,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.background-controller.name\" . }}]"` |  |
| kyverno.config.resourceFilters[55] | string | `"[Deployment,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.cleanup-controller.name\" . }}]"` |  |
| kyverno.config.resourceFilters[56] | string | `"[Deployment/*,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.cleanup-controller.name\" . }}]"` |  |
| kyverno.config.resourceFilters[57] | string | `"[Deployment,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.reports-controller.name\" . }}]"` |  |
| kyverno.config.resourceFilters[58] | string | `"[Deployment/*,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.reports-controller.name\" . }}]"` |  |
| kyverno.config.resourceFilters[59] | string | `"[Pod,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.admission-controller.name\" . }}-*]"` |  |
| kyverno.config.resourceFilters[60] | string | `"[Pod/*,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.admission-controller.name\" . }}-*]"` |  |
| kyverno.config.resourceFilters[61] | string | `"[Pod,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.background-controller.name\" . }}-*]"` |  |
| kyverno.config.resourceFilters[62] | string | `"[Pod/*,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.background-controller.name\" . }}-*]"` |  |
| kyverno.config.resourceFilters[63] | string | `"[Pod,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.cleanup-controller.name\" . }}-*]"` |  |
| kyverno.config.resourceFilters[64] | string | `"[Pod/*,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.cleanup-controller.name\" . }}-*]"` |  |
| kyverno.config.resourceFilters[65] | string | `"[Pod,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.reports-controller.name\" . }}-*]"` |  |
| kyverno.config.resourceFilters[66] | string | `"[Pod/*,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.reports-controller.name\" . }}-*]"` |  |
| kyverno.config.resourceFilters[67] | string | `"[Job,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.fullname\" . }}-hook-pre-delete]"` |  |
| kyverno.config.resourceFilters[68] | string | `"[Job/*,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.fullname\" . }}-hook-pre-delete]"` |  |
| kyverno.config.resourceFilters[69] | string | `"[Job,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.fullname\" . }}-clean-reports]"` |  |
| kyverno.config.resourceFilters[70] | string | `"[Job/*,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.fullname\" . }}-clean-reports]"` |  |
| kyverno.config.resourceFilters[71] | string | `"[NetworkPolicy,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.admission-controller.name\" . }}]"` |  |
| kyverno.config.resourceFilters[72] | string | `"[NetworkPolicy/*,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.admission-controller.name\" . }}]"` |  |
| kyverno.config.resourceFilters[73] | string | `"[NetworkPolicy,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.background-controller.name\" . }}]"` |  |
| kyverno.config.resourceFilters[74] | string | `"[NetworkPolicy/*,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.background-controller.name\" . }}]"` |  |
| kyverno.config.resourceFilters[75] | string | `"[NetworkPolicy,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.cleanup-controller.name\" . }}]"` |  |
| kyverno.config.resourceFilters[76] | string | `"[NetworkPolicy/*,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.cleanup-controller.name\" . }}]"` |  |
| kyverno.config.resourceFilters[77] | string | `"[NetworkPolicy,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.reports-controller.name\" . }}]"` |  |
| kyverno.config.resourceFilters[78] | string | `"[NetworkPolicy/*,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.reports-controller.name\" . }}]"` |  |
| kyverno.config.resourceFilters[79] | string | `"[PodDisruptionBudget,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.admission-controller.name\" . }}]"` |  |
| kyverno.config.resourceFilters[80] | string | `"[PodDisruptionBudget/*,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.admission-controller.name\" . }}]"` |  |
| kyverno.config.resourceFilters[81] | string | `"[PodDisruptionBudget,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.background-controller.name\" . }}]"` |  |
| kyverno.config.resourceFilters[82] | string | `"[PodDisruptionBudget/*,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.background-controller.name\" . }}]"` |  |
| kyverno.config.resourceFilters[83] | string | `"[PodDisruptionBudget,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.cleanup-controller.name\" . }}]"` |  |
| kyverno.config.resourceFilters[84] | string | `"[PodDisruptionBudget/*,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.cleanup-controller.name\" . }}]"` |  |
| kyverno.config.resourceFilters[85] | string | `"[PodDisruptionBudget,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.reports-controller.name\" . }}]"` |  |
| kyverno.config.resourceFilters[86] | string | `"[PodDisruptionBudget/*,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.reports-controller.name\" . }}]"` |  |
| kyverno.config.resourceFilters[87] | string | `"[Service,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.admission-controller.serviceName\" . }}]"` |  |
| kyverno.config.resourceFilters[88] | string | `"[Service/*,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.admission-controller.serviceName\" . }}]"` |  |
| kyverno.config.resourceFilters[89] | string | `"[Service,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.admission-controller.serviceName\" . }}-metrics]"` |  |
| kyverno.config.resourceFilters[90] | string | `"[Service/*,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.admission-controller.serviceName\" . }}-metrics]"` |  |
| kyverno.config.resourceFilters[91] | string | `"[Service,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.background-controller.name\" . }}-metrics]"` |  |
| kyverno.config.resourceFilters[92] | string | `"[Service/*,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.background-controller.name\" . }}-metrics]"` |  |
| kyverno.config.resourceFilters[93] | string | `"[Service,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.cleanup-controller.name\" . }}]"` |  |
| kyverno.config.resourceFilters[94] | string | `"[Service/*,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.cleanup-controller.name\" . }}]"` |  |
| kyverno.config.resourceFilters[95] | string | `"[Service,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.cleanup-controller.name\" . }}-metrics]"` |  |
| kyverno.config.resourceFilters[96] | string | `"[Service/*,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.cleanup-controller.name\" . }}-metrics]"` |  |
| kyverno.config.resourceFilters[97] | string | `"[Service,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.reports-controller.name\" . }}-metrics]"` |  |
| kyverno.config.resourceFilters[98] | string | `"[Service/*,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.reports-controller.name\" . }}-metrics]"` |  |
| kyverno.config.resourceFilters[99] | string | `"[ServiceMonitor,{{ if .Values.admissionController.serviceMonitor.namespace }}{{ .Values.admissionController.serviceMonitor.namespace }}{{ else }}{{ template \"kyverno.namespace\" . }}{{ end }},{{ template \"kyverno.admission-controller.name\" . }}]"` |  |
| kyverno.config.resourceFilters[100] | string | `"[ServiceMonitor,{{ if .Values.admissionController.serviceMonitor.namespace }}{{ .Values.admissionController.serviceMonitor.namespace }}{{ else }}{{ template \"kyverno.namespace\" . }}{{ end }},{{ template \"kyverno.background-controller.name\" . }}]"` |  |
| kyverno.config.resourceFilters[101] | string | `"[ServiceMonitor,{{ if .Values.admissionController.serviceMonitor.namespace }}{{ .Values.admissionController.serviceMonitor.namespace }}{{ else }}{{ template \"kyverno.namespace\" . }}{{ end }},{{ template \"kyverno.cleanup-controller.name\" . }}]"` |  |
| kyverno.config.resourceFilters[102] | string | `"[ServiceMonitor,{{ if .Values.admissionController.serviceMonitor.namespace }}{{ .Values.admissionController.serviceMonitor.namespace }}{{ else }}{{ template \"kyverno.namespace\" . }}{{ end }},{{ template \"kyverno.reports-controller.name\" . }}]"` |  |
| kyverno.config.resourceFilters[103] | string | `"[Secret,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.admission-controller.serviceName\" . }}.{{ template \"kyverno.namespace\" . }}.svc.*]"` |  |
| kyverno.config.resourceFilters[104] | string | `"[Secret,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.cleanup-controller.name\" . }}.{{ template \"kyverno.namespace\" . }}.svc.*]"` |  |
| kyverno.existingImagePullSecrets | list | `["private-registry"]` | Existing Image pull secrets for image verification policies, this will define the `--imagePullSecrets` argument |
| kyverno.webhooksCleanup.enabled | bool | `true` | Create a helm pre-delete hook to cleanup webhooks. |
| kyverno.webhooksCleanup.image.registry | string | `"registry1.dso.mil"` |  |
| kyverno.webhooksCleanup.image.repository | string | `"ironbank/opensource/kubernetes/kubectl"` |  |
| kyverno.webhooksCleanup.image.tag | string | `"v1.30.10"` |  |
| kyverno.webhooksCleanup.image.pullPolicy | string | `nil` |  |
| kyverno.webhooksCleanup.imagePullSecrets[0].name | string | `"private-registry"` |  |
| kyverno.webhooksCleanup.automountServiceAccountToken.enabled | bool | `true` |  |
| kyverno.webhooksCleanup.podSecurityContext.runAsUser | int | `1001` |  |
| kyverno.webhooksCleanup.podSecurityContext.runAsGroup | int | `1001` |  |
| kyverno.webhooksCleanup.podSecurityContext.runAsNonRoot | bool | `true` |  |
| kyverno.webhooksCleanup.securityContext.runAsUser | int | `1001` |  |
| kyverno.webhooksCleanup.securityContext.runAsGroup | int | `1001` |  |
| kyverno.webhooksCleanup.securityContext.runAsNonRoot | bool | `true` |  |
| kyverno.webhooksCleanup.securityContext.privileged | bool | `false` |  |
| kyverno.webhooksCleanup.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| kyverno.webhooksCleanup.securityContext.readOnlyRootFilesystem | bool | `true` |  |
| kyverno.webhooksCleanup.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| kyverno.webhooksCleanup.securityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| kyverno.webhooksCleanup.resources.limits.cpu | string | `"0.5"` |  |
| kyverno.webhooksCleanup.resources.limits.memory | string | `"256Mi"` |  |
| kyverno.webhooksCleanup.resources.requests.cpu | string | `"0.5"` |  |
| kyverno.webhooksCleanup.resources.requests.memory | string | `"256Mi"` |  |
| kyverno.policyReportsCleanup.enabled | bool | `false` |  |
| kyverno.policyReportsCleanup.automountServiceAccountToken.enabled | bool | `true` |  |
| kyverno.policyReportsCleanup.image.registry | string | `"registry1.dso.mil"` |  |
| kyverno.policyReportsCleanup.image.repository | string | `"ironbank/opensource/kubernetes/kubectl"` |  |
| kyverno.policyReportsCleanup.image.tag | string | `"v1.30.10"` |  |
| kyverno.policyReportsCleanup.imagePullSecrets[0].name | string | `"private-registry"` |  |
| kyverno.policyReportsCleanup.podSecurityContext.runAsUser | int | `1001` |  |
| kyverno.policyReportsCleanup.podSecurityContext.runAsGroup | int | `1001` |  |
| kyverno.policyReportsCleanup.podSecurityContext.runAsNonRoot | bool | `true` |  |
| kyverno.policyReportsCleanup.securityContext.runAsUser | int | `1001` |  |
| kyverno.policyReportsCleanup.securityContext.runAsGroup | int | `1001` |  |
| kyverno.policyReportsCleanup.securityContext.runAsNonRoot | bool | `true` |  |
| kyverno.policyReportsCleanup.securityContext.privileged | bool | `false` |  |
| kyverno.policyReportsCleanup.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| kyverno.policyReportsCleanup.securityContext.readOnlyRootFilesystem | bool | `true` |  |
| kyverno.policyReportsCleanup.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| kyverno.policyReportsCleanup.securityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| kyverno.policyReportsCleanup.resources | object | `{"limits":{"cpu":"1","memory":"512Mi"},"requests":{"cpu":"0.5","memory":"256Mi"}}` | Resource limits for the containers |
| kyverno.grafana.enabled | bool | `false` |  |
| kyverno.features.policyExceptions.enabled | bool | `false` |  |
| kyverno.features.policyExceptions.namespace | string | `"kyverno"` |  |
| kyverno.cleanupJobs.rbac.serviceAccount.automountServiceAccountToken.enabled | bool | `false` |  |
| kyverno.cleanupJobs.admissionReports.enabled | bool | `true` |  |
| kyverno.cleanupJobs.admissionReports.automountServiceAccountToken.enabled | bool | `true` |  |
| kyverno.cleanupJobs.admissionReports.backoffLimit | int | `3` |  |
| kyverno.cleanupJobs.admissionReports.image.registry | string | `"registry1.dso.mil"` |  |
| kyverno.cleanupJobs.admissionReports.image.repository | string | `"ironbank/opensource/kubernetes/kubectl"` |  |
| kyverno.cleanupJobs.admissionReports.image.tag | string | `"v1.30.10"` |  |
| kyverno.cleanupJobs.admissionReports.imagePullSecrets[0].name | string | `"private-registry"` |  |
| kyverno.cleanupJobs.admissionReports.schedule | string | `"*/10 * * * *"` | Cronjob schedule |
| kyverno.cleanupJobs.admissionReports.threshold | int | `10000` | Reports threshold, if number of reports are above this value the cronjob will start deleting them |
| kyverno.cleanupJobs.admissionReports.history | object | `{"failure":1,"success":1}` | Cronjob history |
| kyverno.cleanupJobs.admissionReports.podSecurityContext | object | `{"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000}` | Security context for the pod |
| kyverno.cleanupJobs.admissionReports.securityContext | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"privileged":false,"readOnlyRootFilesystem":true,"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000,"seccompProfile":{"type":"RuntimeDefault"}}` | Security context for the containers |
| kyverno.cleanupJobs.clusterAdmissionReports.enabled | bool | `true` | Enable cleanup cronjob |
| kyverno.cleanupJobs.clusterAdmissionReports.automountServiceAccountToken.enabled | bool | `true` |  |
| kyverno.cleanupJobs.clusterAdmissionReports.backoffLimit | int | `3` |  |
| kyverno.cleanupJobs.clusterAdmissionReports.image.registry | string | `"registry1.dso.mil"` |  |
| kyverno.cleanupJobs.clusterAdmissionReports.image.repository | string | `"ironbank/opensource/kubernetes/kubectl"` |  |
| kyverno.cleanupJobs.clusterAdmissionReports.image.tag | string | `"v1.30.10"` |  |
| kyverno.cleanupJobs.clusterAdmissionReports.image.pullPolicy | string | `nil` |  |
| kyverno.cleanupJobs.clusterAdmissionReports.imagePullSecrets | list | `[{"name":"private-registry"}]` | Image pull secrets |
| kyverno.cleanupJobs.clusterAdmissionReports.schedule | string | `"*/10 * * * *"` | Cronjob schedule |
| kyverno.cleanupJobs.clusterAdmissionReports.threshold | int | `10000` | Reports threshold, if number of reports are above this value the cronjob will start deleting them |
| kyverno.cleanupJobs.clusterAdmissionReports.history | object | `{"failure":1,"success":1}` | Cronjob history |
| kyverno.cleanupJobs.clusterAdmissionReports.podSecurityContext | object | `{"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000}` | Security context for the pod |
| kyverno.cleanupJobs.clusterAdmissionReports.securityContext | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"privileged":false,"readOnlyRootFilesystem":true,"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000,"seccompProfile":{"type":"RuntimeDefault"}}` | Security context for the containers |
| kyverno.cleanupJobs.updateRequests.enabled | bool | `true` |  |
| kyverno.cleanupJobs.updateRequests.automountServiceAccountToken.enabled | bool | `true` |  |
| kyverno.cleanupJobs.updateRequests.backoffLimit | int | `3` |  |
| kyverno.cleanupJobs.updateRequests.ttlSecondsAfterFinished | string | `""` |  |
| kyverno.cleanupJobs.updateRequests.image.registry | string | `"registry1.dso.mil"` |  |
| kyverno.cleanupJobs.updateRequests.image.repository | string | `"ironbank/opensource/kubernetes/kubectl"` |  |
| kyverno.cleanupJobs.updateRequests.image.tag | string | `"v1.30.10"` |  |
| kyverno.cleanupJobs.updateRequests.image.pullPolicy | string | `nil` |  |
| kyverno.cleanupJobs.updateRequests.imagePullSecrets | list | `[{"name":"private-registry"}]` | Image pull secrets |
| kyverno.cleanupJobs.updateRequests.schedule | string | `"*/10 * * * *"` | Cronjob schedule |
| kyverno.cleanupJobs.updateRequests.podSecurityContext | object | `{"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000}` | Security context for the pod |
| kyverno.cleanupJobs.updateRequests.securityContext | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"privileged":false,"readOnlyRootFilesystem":true,"runAsNonRoot":true,"seccompProfile":{"type":"RuntimeDefault"}}` | Security context for the containers |
| kyverno.cleanupJobs.ephemeralReports.enabled | bool | `true` |  |
| kyverno.cleanupJobs.ephemeralReports.automountServiceAccountToken.enabled | bool | `true` |  |
| kyverno.cleanupJobs.ephemeralReports.backoffLimit | int | `3` |  |
| kyverno.cleanupJobs.ephemeralReports.ttlSecondsAfterFinished | string | `""` |  |
| kyverno.cleanupJobs.ephemeralReports.image.registry | string | `"registry1.dso.mil"` |  |
| kyverno.cleanupJobs.ephemeralReports.image.repository | string | `"ironbank/opensource/kubernetes/kubectl"` |  |
| kyverno.cleanupJobs.ephemeralReports.image.tag | string | `"v1.30.10"` |  |
| kyverno.cleanupJobs.ephemeralReports.image.pullPolicy | string | `nil` |  |
| kyverno.cleanupJobs.ephemeralReports.imagePullSecrets[0].name | string | `"private-registry"` |  |
| kyverno.cleanupJobs.ephemeralReports.schedule | string | `"*/10 * * * *"` |  |
| kyverno.cleanupJobs.ephemeralReports.threshold | int | `10000` |  |
| kyverno.cleanupJobs.ephemeralReports.podSecurityContext | object | `{"runAsGroup":1001,"runAsNonRoot":true,"runAsUser":1001}` | Security context for the pod |
| kyverno.cleanupJobs.ephemeralReports.securityContext | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"privileged":false,"readOnlyRootFilesystem":true,"runAsNonRoot":true,"seccompProfile":{"type":"RuntimeDefault"}}` | Security context for the containers |
| kyverno.cleanupJobs.clusterEphemeralReports.enabled | bool | `true` |  |
| kyverno.cleanupJobs.clusterEphemeralReports.automountServiceAccountToken.enabled | bool | `true` |  |
| kyverno.cleanupJobs.clusterEphemeralReports.backoffLimit | int | `3` |  |
| kyverno.cleanupJobs.clusterEphemeralReports.ttlSecondsAfterFinished | string | `""` |  |
| kyverno.cleanupJobs.clusterEphemeralReports.image.registry | string | `"registry1.dso.mil"` |  |
| kyverno.cleanupJobs.clusterEphemeralReports.image.repository | string | `"ironbank/opensource/kubernetes/kubectl"` |  |
| kyverno.cleanupJobs.clusterEphemeralReports.image.tag | string | `"v1.30.10"` |  |
| kyverno.cleanupJobs.clusterEphemeralReports.image.pullPolicy | string | `nil` |  |
| kyverno.cleanupJobs.clusterEphemeralReports.imagePullSecrets[0].name | string | `"private-registry"` |  |
| kyverno.cleanupJobs.clusterEphemeralReports.schedule | string | `"*/10 * * * *"` | Cronjob schedule |
| kyverno.cleanupJobs.clusterEphemeralReports.threshold | int | `10000` | Reports threshold, if number of reports are above this value the cronjob will start deleting them |
| kyverno.cleanupJobs.clusterEphemeralReports.history | object | `{"failure":1,"success":1}` | Cronjob history |
| kyverno.cleanupJobs.clusterEphemeralReports.podSecurityContext | object | `{"runAsGroup":1001,"runAsNonRoot":true,"runAsUser":1001}` | Security context for the pod |
| kyverno.cleanupJobs.clusterEphemeralReports.securityContext | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"privileged":false,"readOnlyRootFilesystem":true,"runAsNonRoot":true,"seccompProfile":{"type":"RuntimeDefault"}}` | Security context for the containers |
| kyverno.admissionController.rbac.serviceAccount.automountServiceAccountToken.enabled | bool | `false` |  |
| kyverno.admissionController.rbac.deployment.automountServiceAccountToken.enabled | bool | `true` |  |
| kyverno.admissionController.rbac.coreClusterRole.extraResources[0].apiGroups[0] | string | `"*"` |  |
| kyverno.admissionController.rbac.coreClusterRole.extraResources[0].resources[0] | string | `"*"` |  |
| kyverno.admissionController.rbac.coreClusterRole.extraResources[0].verbs[0] | string | `"get"` |  |
| kyverno.admissionController.rbac.coreClusterRole.extraResources[0].verbs[1] | string | `"list"` |  |
| kyverno.admissionController.rbac.coreClusterRole.extraResources[0].verbs[2] | string | `"watch"` |  |
| kyverno.admissionController.rbac.clusterRole.extraResources | list | `[{"apiGroups":["*"],"resources":["*"],"verbs":["get","list","watch"]}]` | Extra resource permissions to add in the cluster role |
| kyverno.admissionController.createSelfSignedCert | bool | `false` | Create self-signed certificates at deployment time. The certificates won't be automatically renewed if this is set to `true`. |
| kyverno.admissionController.replicas | int | `3` | Desired number of pods |
| kyverno.admissionController.podSecurityContext.runAsUser | int | `10001` |  |
| kyverno.admissionController.podSecurityContext.runAsGroup | int | `10001` |  |
| kyverno.admissionController.podSecurityContext.runAsNonRoot | bool | `true` |  |
| kyverno.admissionController.podDisruptionBudget.enabled | bool | `false` |  |
| kyverno.admissionController.imagePullSecrets[0].name | string | `"private-registry"` |  |
| kyverno.admissionController.initContainer.image.registry | string | `nil` |  |
| kyverno.admissionController.initContainer.image.defaultRegistry | string | `"registry1.dso.mil"` |  |
| kyverno.admissionController.initContainer.image.repository | string | `"ironbank/opensource/kyverno/kyvernopre"` |  |
| kyverno.admissionController.initContainer.image.tag | string | `"v1.13.4"` |  |
| kyverno.admissionController.initContainer.image.pullPolicy | string | `nil` |  |
| kyverno.admissionController.initContainer.resources.limits | object | `{"cpu":1,"memory":"1Gi"}` | Pod resource limits |
| kyverno.admissionController.initContainer.resources.requests | object | `{"cpu":"10m","memory":"64Mi"}` | Pod resource requests |
| kyverno.admissionController.initContainer.securityContext | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"privileged":false,"readOnlyRootFilesystem":true,"runAsGroup":10001,"runAsNonRoot":true,"runAsUser":10001,"seccompProfile":{"type":"RuntimeDefault"}}` | Container security context |
| kyverno.admissionController.container.image.defaultRegistry | string | `"registry1.dso.mil"` |  |
| kyverno.admissionController.container.image.repository | string | `"ironbank/opensource/kyverno"` |  |
| kyverno.admissionController.container.image.tag | string | `"v1.13.4"` |  |
| kyverno.admissionController.container.image.pullPolicy | string | `"IfNotPresent"` |  |
| kyverno.admissionController.container.imagePullSecrets[0].name | string | `"private-registry"` |  |
| kyverno.admissionController.container.resources.limits.cpu | string | `"500m"` |  |
| kyverno.admissionController.container.resources.limits.memory | string | `"512Mi"` |  |
| kyverno.admissionController.container.resources.requests.cpu | string | `"500m"` |  |
| kyverno.admissionController.container.resources.requests.memory | string | `"512Mi"` |  |
| kyverno.admissionController.container.securityContext.runAsNonRoot | bool | `true` |  |
| kyverno.admissionController.container.securityContext.runAsUser | int | `10001` |  |
| kyverno.admissionController.container.securityContext.runAsGroup | int | `10001` |  |
| kyverno.admissionController.container.securityContext.privileged | bool | `false` |  |
| kyverno.admissionController.container.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| kyverno.admissionController.container.securityContext.readOnlyRootFilesystem | bool | `true` |  |
| kyverno.admissionController.container.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| kyverno.admissionController.container.securityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| kyverno.backgroundController.enabled | bool | `true` |  |
| kyverno.backgroundController.rbac.create | bool | `true` |  |
| kyverno.backgroundController.rbac.serviceAccount.automountServiceAccountToken.enabled | bool | `false` |  |
| kyverno.backgroundController.rbac.deployment.automountServiceAccountToken.enabled | bool | `true` |  |
| kyverno.backgroundController.rbac.coreClusterRole.extraResources[0].apiGroups[0] | string | `"networking.k8s.io"` |  |
| kyverno.backgroundController.rbac.coreClusterRole.extraResources[0].resources[0] | string | `"ingresses"` |  |
| kyverno.backgroundController.rbac.coreClusterRole.extraResources[0].resources[1] | string | `"ingressclasses"` |  |
| kyverno.backgroundController.rbac.coreClusterRole.extraResources[0].resources[2] | string | `"networkpolicies"` |  |
| kyverno.backgroundController.rbac.coreClusterRole.extraResources[0].verbs[0] | string | `"create"` |  |
| kyverno.backgroundController.rbac.coreClusterRole.extraResources[0].verbs[1] | string | `"update"` |  |
| kyverno.backgroundController.rbac.coreClusterRole.extraResources[0].verbs[2] | string | `"patch"` |  |
| kyverno.backgroundController.rbac.coreClusterRole.extraResources[0].verbs[3] | string | `"delete"` |  |
| kyverno.backgroundController.rbac.coreClusterRole.extraResources[1].apiGroups[0] | string | `"rbac.authorization.k8s.io"` |  |
| kyverno.backgroundController.rbac.coreClusterRole.extraResources[1].resources[0] | string | `"rolebindings"` |  |
| kyverno.backgroundController.rbac.coreClusterRole.extraResources[1].resources[1] | string | `"roles"` |  |
| kyverno.backgroundController.rbac.coreClusterRole.extraResources[1].verbs[0] | string | `"create"` |  |
| kyverno.backgroundController.rbac.coreClusterRole.extraResources[1].verbs[1] | string | `"update"` |  |
| kyverno.backgroundController.rbac.coreClusterRole.extraResources[1].verbs[2] | string | `"patch"` |  |
| kyverno.backgroundController.rbac.coreClusterRole.extraResources[1].verbs[3] | string | `"delete"` |  |
| kyverno.backgroundController.rbac.coreClusterRole.extraResources[2].apiGroups[0] | string | `"*"` |  |
| kyverno.backgroundController.rbac.coreClusterRole.extraResources[2].resources[0] | string | `"configmaps"` |  |
| kyverno.backgroundController.rbac.coreClusterRole.extraResources[2].resources[1] | string | `"resourcequotas"` |  |
| kyverno.backgroundController.rbac.coreClusterRole.extraResources[2].resources[2] | string | `"limitranges"` |  |
| kyverno.backgroundController.rbac.coreClusterRole.extraResources[2].verbs[0] | string | `"create"` |  |
| kyverno.backgroundController.rbac.coreClusterRole.extraResources[2].verbs[1] | string | `"update"` |  |
| kyverno.backgroundController.rbac.coreClusterRole.extraResources[2].verbs[2] | string | `"patch"` |  |
| kyverno.backgroundController.rbac.coreClusterRole.extraResources[2].verbs[3] | string | `"delete"` |  |
| kyverno.backgroundController.rbac.coreClusterRole.extraResources[3].apiGroups[0] | string | `"*"` |  |
| kyverno.backgroundController.rbac.coreClusterRole.extraResources[3].resources[0] | string | `"serviceaccounts"` |  |
| kyverno.backgroundController.rbac.coreClusterRole.extraResources[3].verbs[0] | string | `"get"` |  |
| kyverno.backgroundController.rbac.coreClusterRole.extraResources[3].verbs[1] | string | `"list"` |  |
| kyverno.backgroundController.rbac.coreClusterRole.extraResources[3].verbs[2] | string | `"watch"` |  |
| kyverno.backgroundController.rbac.coreClusterRole.extraResources[3].verbs[3] | string | `"update"` |  |
| kyverno.backgroundController.rbac.coreClusterRole.extraResources[3].verbs[4] | string | `"patch"` |  |
| kyverno.backgroundController.rbac.clusterRole.extraResources | list | `[{"apiGroups":["*"],"resources":["*"],"verbs":["get","list","watch"]},{"apiGroups":["*"],"resources":["secrets"],"verbs":["create","update","delete"]}]` | Extra resource permissions to add in the cluster role |
| kyverno.backgroundController.image.defaultRegistry | string | `"registry1.dso.mil"` |  |
| kyverno.backgroundController.image.repository | string | `"ironbank/opensource/kyverno/kyverno/background-controller"` |  |
| kyverno.backgroundController.image.tag | string | `"v1.13.4"` |  |
| kyverno.backgroundController.imagePullSecrets[0].name | string | `"private-registry"` |  |
| kyverno.backgroundController.podSecurityContext.runAsUser | int | `1000` |  |
| kyverno.backgroundController.podSecurityContext.runAsGroup | int | `1000` |  |
| kyverno.backgroundController.podSecurityContext.runAsNonRoot | bool | `true` |  |
| kyverno.backgroundController.securityContext.runAsNonRoot | bool | `true` |  |
| kyverno.backgroundController.securityContext.runAsUser | int | `1000` |  |
| kyverno.backgroundController.securityContext.runAsGroup | int | `1000` |  |
| kyverno.backgroundController.securityContext.privileged | bool | `false` |  |
| kyverno.backgroundController.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| kyverno.backgroundController.securityContext.readOnlyRootFilesystem | bool | `true` |  |
| kyverno.backgroundController.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| kyverno.backgroundController.securityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| kyverno.cleanupController.enabled | bool | `true` |  |
| kyverno.cleanupController.rbac.create | bool | `true` |  |
| kyverno.cleanupController.rbac.serviceAccount.automountServiceAccountToken.enabled | bool | `false` |  |
| kyverno.cleanupController.rbac.deployment.automountServiceAccountToken.enabled | bool | `true` |  |
| kyverno.cleanupController.image.defaultRegistry | string | `"registry1.dso.mil"` |  |
| kyverno.cleanupController.image.repository | string | `"ironbank/opensource/kyverno/kyverno/cleanup-controller"` |  |
| kyverno.cleanupController.image.tag | string | `"v1.13.4"` |  |
| kyverno.cleanupController.image.pullPolicy | string | `"IfNotPresent"` |  |
| kyverno.cleanupController.imagePullSecrets[0].name | string | `"private-registry"` |  |
| kyverno.cleanupController.podSecurityContext.runAsUser | int | `1000` |  |
| kyverno.cleanupController.podSecurityContext.runAsGroup | int | `1000` |  |
| kyverno.cleanupController.podSecurityContext.runAsNonRoot | bool | `true` |  |
| kyverno.cleanupController.securityContext | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"privileged":false,"readOnlyRootFilesystem":true,"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000,"seccompProfile":{"type":"RuntimeDefault"}}` | Security context for the containers |
| kyverno.reportsController.enabled | bool | `true` |  |
| kyverno.reportsController.rbac.create | bool | `true` |  |
| kyverno.reportsController.rbac.serviceAccount.automountServiceAccountToken.enabled | bool | `false` |  |
| kyverno.reportsController.rbac.deployment.automountServiceAccountToken.enabled | bool | `true` |  |
| kyverno.reportsController.rbac.coreClusterRole.extraResources[0].apiGroups[0] | string | `"*"` |  |
| kyverno.reportsController.rbac.coreClusterRole.extraResources[0].resources[0] | string | `"*"` |  |
| kyverno.reportsController.rbac.coreClusterRole.extraResources[0].verbs[0] | string | `"get"` |  |
| kyverno.reportsController.rbac.coreClusterRole.extraResources[0].verbs[1] | string | `"list"` |  |
| kyverno.reportsController.rbac.coreClusterRole.extraResources[0].verbs[2] | string | `"watch"` |  |
| kyverno.reportsController.rbac.clusterRole.extraResources | list | `[{"apiGroups":["*"],"resources":["*"],"verbs":["get","list","watch"]}]` | Extra resource permissions to add in the cluster role |
| kyverno.reportsController.image.defaultRegistry | string | `"registry1.dso.mil"` |  |
| kyverno.reportsController.image.repository | string | `"ironbank/opensource/kyverno/kyverno/reports-controller"` |  |
| kyverno.reportsController.image.tag | string | `"v1.13.4"` |  |
| kyverno.reportsController.image.pullPolicy | string | `"IfNotPresent"` |  |
| kyverno.reportsController.imagePullSecrets[0].name | string | `"private-registry"` |  |
| kyverno.reportsController.podSecurityContext.runAsUser | int | `1000` |  |
| kyverno.reportsController.podSecurityContext.runAsGroup | int | `1000` |  |
| kyverno.reportsController.podSecurityContext.runAsNonRoot | bool | `true` |  |
| kyverno.reportsController.securityContext.runAsNonRoot | bool | `true` |  |
| kyverno.reportsController.securityContext.runAsUser | int | `1000` |  |
| kyverno.reportsController.securityContext.runAsGroup | int | `1000` |  |
| kyverno.reportsController.securityContext.privileged | bool | `false` |  |
| kyverno.reportsController.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| kyverno.reportsController.securityContext.readOnlyRootFilesystem | bool | `true` |  |
| kyverno.reportsController.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| kyverno.reportsController.securityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| test.sleep | int | `20` | Sleep time before running test |
| test.image.registry | string | `"registry1.dso.mil"` |  |
| test.image.repository | string | `"ironbank/redhat/ubi/ubi9-minimal"` |  |
| test.image.tag | string | `"9.5"` |  |
| test.image.pullPolicy | string | `nil` |  |
| test.imagePullSecrets[0].name | string | `"private-registry"` |  |
| test.resources.limits | object | `{"cpu":"100m","memory":"256Mi"}` | Pod resource limits |
| test.resources.requests | object | `{"cpu":"10m","memory":"64Mi"}` | Pod resource requests |
| test.podSecurityContext | object | `{"runAsGroup":65534,"runAsNonRoot":true,"runAsUser":65534}` | Security context for the test pod |
| test.securityContext | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"privileged":false,"readOnlyRootFilesystem":true,"runAsGroup":65534,"runAsNonRoot":true,"runAsUser":65534,"seccompProfile":{"type":"RuntimeDefault"}}` | Security context for the test containers |
| networkPolicies.enabled | bool | `false` |  |
| networkPolicies.controlPlaneCidr | string | `"0.0.0.0/0"` |  |
| networkPolicies.externalRegistries.allowEgress | bool | `false` |  |
| networkPolicies.externalRegistries.ports | list | `[]` |  |
| networkPolicies.allowExternalRegistryEgress | bool | `false` |  |
| networkPolicies.additionalPolicies | list | `[]` |  |
| istio.enabled | bool | `false` |  |
| openshift | bool | `false` |  |
| bbtests.enabled | bool | `false` |  |
| bbtests.scripts.image | string | `"registry1.dso.mil/ironbank/opensource/kubernetes/kubectl:v1.30.10"` |  |
| bbtests.scripts.additionalVolumeMounts[0].name | string | `"kyverno-bbtest-manifest"` |  |
| bbtests.scripts.additionalVolumeMounts[0].mountPath | string | `"/yaml"` |  |
| bbtests.scripts.additionalVolumes[0].name | string | `"kyverno-bbtest-manifest"` |  |
| bbtests.scripts.additionalVolumes[0].configMap.name | string | `"kyverno-bbtest-manifest"` |  |

## Contributing

Please see the [contributing guide](./CONTRIBUTING.md) if you are interested in contributing.

---

_This file is programatically generated using `helm-docs` and some BigBang-specific templates. The `gluon` repository has [instructions for regenerating package READMEs](https://repo1.dso.mil/big-bang/product/packages/gluon/-/blob/master/docs/bb-package-readme.md)._

