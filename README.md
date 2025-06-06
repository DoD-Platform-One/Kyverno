<!-- Warning: Do not manually edit this file. See notes on gluon + helm-docs at the end of this file for more information. -->
# kyverno

![Version: 3.3.6-bb.5](https://img.shields.io/badge/Version-3.3.6--bb.5-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v1.13.4](https://img.shields.io/badge/AppVersion-v1.13.4-informational?style=flat-square) ![Maintenance Track: bb_integrated](https://img.shields.io/badge/Maintenance_Track-bb_integrated-green?style=flat-square)

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

<https://helm.sh/docs/intro/install/>

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
| upstream.nameOverride | string | `"kyverno"` |  |
| upstream.fullnameOverride | string | `"kyverno"` |  |
| upstream.namespaceOverride | string | `nil` |  |
| upstream.upgrade.fromV2 | bool | `true` | Upgrading from v2 to v3 is not allowed by default, set this to true once changes have been reviewed. |
| upstream.apiVersionOverride.podDisruptionBudget | string | `"policy/v1"` | Override api version used to create `PodDisruptionBudget`` resources. When not specified the chart will check if`policy/v1/PodDisruptionBudget` is available to determine the api version automatically. |
| upstream.crds.install | bool | `true` |  |
| upstream.crds.groups.image.registry | string | `nil` |  |
| upstream.crds.groups.image.defaultRegistry | string | `"registry1.dso.mil"` |  |
| upstream.crds.groups.image.repository | string | `"ironbank/opensource/kyverno/kyvernocli"` |  |
| upstream.crds.groups.image.tag | string | `"v1.13.4"` |  |
| upstream.crds.groups.image.pullPolicy | string | `nil` |  |
| upstream.crds.groups.imagePullSecrets[0].name | string | `"private-registry"` |  |
| upstream.crds.migration.enabled | bool | `true` |  |
| upstream.crds.migration.image.defaultRegistry | string | `"registry1.dso.mil"` |  |
| upstream.crds.migration.image.repository | string | `"ironbank/opensource/kyverno/kyvernocli"` |  |
| upstream.crds.migration.image.tag | string | `"v1.13.4"` |  |
| upstream.crds.migration.imagePullSecrets[0].name | string | `"private-registry"` |  |
| upstream.crds.podSecurityContext | object | `{"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000,"securityContext":{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"privileged":false,"readOnlyRootFilesystem":true,"runAsGroup":65534,"runAsNonRoot":true,"runAsUser":65534,"seccompProfile":{"type":"RuntimeDefault"}}}` | Security context for the pod |
| upstream.config.defaultRegistry | string | `"registry1.dso.mil"` |  |
| upstream.config.resourceFilters[0] | string | `"[Event,*,*]"` |  |
| upstream.config.resourceFilters[1] | string | `"[*/*,kube-system,*]"` |  |
| upstream.config.resourceFilters[2] | string | `"[*/*,kube-public,*]"` |  |
| upstream.config.resourceFilters[3] | string | `"[*/*,kube-node-lease,*]"` |  |
| upstream.config.resourceFilters[4] | string | `"[Node,*,*]"` |  |
| upstream.config.resourceFilters[5] | string | `"[Node/*,*,*]"` |  |
| upstream.config.resourceFilters[6] | string | `"[APIService,*,*]"` |  |
| upstream.config.resourceFilters[7] | string | `"[APIService/*,*,*]"` |  |
| upstream.config.resourceFilters[8] | string | `"[TokenReview,*,*]"` |  |
| upstream.config.resourceFilters[9] | string | `"[SubjectAccessReview,*,*]"` |  |
| upstream.config.resourceFilters[10] | string | `"[SelfSubjectAccessReview,*,*]"` |  |
| upstream.config.resourceFilters[11] | string | `"[Binding,*,*]"` |  |
| upstream.config.resourceFilters[12] | string | `"[Pod/binding,*,*]"` |  |
| upstream.config.resourceFilters[13] | string | `"[ReplicaSet,*,*]"` |  |
| upstream.config.resourceFilters[14] | string | `"[ReplicaSet/*,*,*]"` |  |
| upstream.config.resourceFilters[15] | string | `"[EphemeralReport,*,*]"` |  |
| upstream.config.resourceFilters[16] | string | `"[ClusterEphemeralReport,*,*]"` |  |
| upstream.config.resourceFilters[17] | string | `"[ClusterRole,*,{{ template \"kyverno.admission-controller.roleName\" . }}]"` |  |
| upstream.config.resourceFilters[18] | string | `"[ClusterRole,*,{{ template \"kyverno.admission-controller.roleName\" . }}:core]"` |  |
| upstream.config.resourceFilters[19] | string | `"[ClusterRole,*,{{ template \"kyverno.admission-controller.roleName\" . }}:additional]"` |  |
| upstream.config.resourceFilters[20] | string | `"[ClusterRole,*,{{ template \"kyverno.background-controller.roleName\" . }}]"` |  |
| upstream.config.resourceFilters[21] | string | `"[ClusterRole,*,{{ template \"kyverno.background-controller.roleName\" . }}:core]"` |  |
| upstream.config.resourceFilters[22] | string | `"[ClusterRole,*,{{ template \"kyverno.background-controller.roleName\" . }}:additional]"` |  |
| upstream.config.resourceFilters[23] | string | `"[ClusterRole,*,{{ template \"kyverno.cleanup-controller.roleName\" . }}]"` |  |
| upstream.config.resourceFilters[24] | string | `"[ClusterRole,*,{{ template \"kyverno.cleanup-controller.roleName\" . }}:core]"` |  |
| upstream.config.resourceFilters[25] | string | `"[ClusterRole,*,{{ template \"kyverno.cleanup-controller.roleName\" . }}:additional]"` |  |
| upstream.config.resourceFilters[26] | string | `"[ClusterRole,*,{{ template \"kyverno.reports-controller.roleName\" . }}]"` |  |
| upstream.config.resourceFilters[27] | string | `"[ClusterRole,*,{{ template \"kyverno.reports-controller.roleName\" . }}:core]"` |  |
| upstream.config.resourceFilters[28] | string | `"[ClusterRole,*,{{ template \"kyverno.reports-controller.roleName\" . }}:additional]"` |  |
| upstream.config.resourceFilters[29] | string | `"[ClusterRoleBinding,*,{{ template \"kyverno.admission-controller.roleName\" . }}]"` |  |
| upstream.config.resourceFilters[30] | string | `"[ClusterRoleBinding,*,{{ template \"kyverno.background-controller.roleName\" . }}]"` |  |
| upstream.config.resourceFilters[31] | string | `"[ClusterRoleBinding,*,{{ template \"kyverno.cleanup-controller.roleName\" . }}]"` |  |
| upstream.config.resourceFilters[32] | string | `"[ClusterRoleBinding,*,{{ template \"kyverno.reports-controller.roleName\" . }}]"` |  |
| upstream.config.resourceFilters[33] | string | `"[ServiceAccount,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.admission-controller.serviceAccountName\" . }}]"` |  |
| upstream.config.resourceFilters[34] | string | `"[ServiceAccount/*,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.admission-controller.serviceAccountName\" . }}]"` |  |
| upstream.config.resourceFilters[35] | string | `"[ServiceAccount,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.background-controller.serviceAccountName\" . }}]"` |  |
| upstream.config.resourceFilters[36] | string | `"[ServiceAccount/*,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.background-controller.serviceAccountName\" . }}]"` |  |
| upstream.config.resourceFilters[37] | string | `"[ServiceAccount,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.cleanup-controller.serviceAccountName\" . }}]"` |  |
| upstream.config.resourceFilters[38] | string | `"[ServiceAccount/*,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.cleanup-controller.serviceAccountName\" . }}]"` |  |
| upstream.config.resourceFilters[39] | string | `"[ServiceAccount,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.reports-controller.serviceAccountName\" . }}]"` |  |
| upstream.config.resourceFilters[40] | string | `"[ServiceAccount/*,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.reports-controller.serviceAccountName\" . }}]"` |  |
| upstream.config.resourceFilters[41] | string | `"[Role,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.admission-controller.roleName\" . }}]"` |  |
| upstream.config.resourceFilters[42] | string | `"[Role,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.background-controller.roleName\" . }}]"` |  |
| upstream.config.resourceFilters[43] | string | `"[Role,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.cleanup-controller.roleName\" . }}]"` |  |
| upstream.config.resourceFilters[44] | string | `"[Role,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.reports-controller.roleName\" . }}]"` |  |
| upstream.config.resourceFilters[45] | string | `"[RoleBinding,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.admission-controller.roleName\" . }}]"` |  |
| upstream.config.resourceFilters[46] | string | `"[RoleBinding,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.background-controller.roleName\" . }}]"` |  |
| upstream.config.resourceFilters[47] | string | `"[RoleBinding,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.cleanup-controller.roleName\" . }}]"` |  |
| upstream.config.resourceFilters[48] | string | `"[RoleBinding,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.reports-controller.roleName\" . }}]"` |  |
| upstream.config.resourceFilters[49] | string | `"[ConfigMap,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.config.configMapName\" . }}]"` |  |
| upstream.config.resourceFilters[50] | string | `"[ConfigMap,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.config.metricsConfigMapName\" . }}]"` |  |
| upstream.config.resourceFilters[51] | string | `"[Deployment,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.admission-controller.name\" . }}]"` |  |
| upstream.config.resourceFilters[52] | string | `"[Deployment/*,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.admission-controller.name\" . }}]"` |  |
| upstream.config.resourceFilters[53] | string | `"[Deployment,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.background-controller.name\" . }}]"` |  |
| upstream.config.resourceFilters[54] | string | `"[Deployment/*,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.background-controller.name\" . }}]"` |  |
| upstream.config.resourceFilters[55] | string | `"[Deployment,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.cleanup-controller.name\" . }}]"` |  |
| upstream.config.resourceFilters[56] | string | `"[Deployment/*,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.cleanup-controller.name\" . }}]"` |  |
| upstream.config.resourceFilters[57] | string | `"[Deployment,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.reports-controller.name\" . }}]"` |  |
| upstream.config.resourceFilters[58] | string | `"[Deployment/*,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.reports-controller.name\" . }}]"` |  |
| upstream.config.resourceFilters[59] | string | `"[Pod,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.admission-controller.name\" . }}-*]"` |  |
| upstream.config.resourceFilters[60] | string | `"[Pod/*,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.admission-controller.name\" . }}-*]"` |  |
| upstream.config.resourceFilters[61] | string | `"[Pod,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.background-controller.name\" . }}-*]"` |  |
| upstream.config.resourceFilters[62] | string | `"[Pod/*,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.background-controller.name\" . }}-*]"` |  |
| upstream.config.resourceFilters[63] | string | `"[Pod,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.cleanup-controller.name\" . }}-*]"` |  |
| upstream.config.resourceFilters[64] | string | `"[Pod/*,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.cleanup-controller.name\" . }}-*]"` |  |
| upstream.config.resourceFilters[65] | string | `"[Pod,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.reports-controller.name\" . }}-*]"` |  |
| upstream.config.resourceFilters[66] | string | `"[Pod/*,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.reports-controller.name\" . }}-*]"` |  |
| upstream.config.resourceFilters[67] | string | `"[Job,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.fullname\" . }}-hook-pre-delete]"` |  |
| upstream.config.resourceFilters[68] | string | `"[Job/*,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.fullname\" . }}-hook-pre-delete]"` |  |
| upstream.config.resourceFilters[69] | string | `"[Job,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.fullname\" . }}-clean-reports]"` |  |
| upstream.config.resourceFilters[70] | string | `"[Job/*,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.fullname\" . }}-clean-reports]"` |  |
| upstream.config.resourceFilters[71] | string | `"[NetworkPolicy,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.admission-controller.name\" . }}]"` |  |
| upstream.config.resourceFilters[72] | string | `"[NetworkPolicy/*,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.admission-controller.name\" . }}]"` |  |
| upstream.config.resourceFilters[73] | string | `"[NetworkPolicy,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.background-controller.name\" . }}]"` |  |
| upstream.config.resourceFilters[74] | string | `"[NetworkPolicy/*,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.background-controller.name\" . }}]"` |  |
| upstream.config.resourceFilters[75] | string | `"[NetworkPolicy,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.cleanup-controller.name\" . }}]"` |  |
| upstream.config.resourceFilters[76] | string | `"[NetworkPolicy/*,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.cleanup-controller.name\" . }}]"` |  |
| upstream.config.resourceFilters[77] | string | `"[NetworkPolicy,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.reports-controller.name\" . }}]"` |  |
| upstream.config.resourceFilters[78] | string | `"[NetworkPolicy/*,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.reports-controller.name\" . }}]"` |  |
| upstream.config.resourceFilters[79] | string | `"[PodDisruptionBudget,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.admission-controller.name\" . }}]"` |  |
| upstream.config.resourceFilters[80] | string | `"[PodDisruptionBudget/*,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.admission-controller.name\" . }}]"` |  |
| upstream.config.resourceFilters[81] | string | `"[PodDisruptionBudget,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.background-controller.name\" . }}]"` |  |
| upstream.config.resourceFilters[82] | string | `"[PodDisruptionBudget/*,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.background-controller.name\" . }}]"` |  |
| upstream.config.resourceFilters[83] | string | `"[PodDisruptionBudget,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.cleanup-controller.name\" . }}]"` |  |
| upstream.config.resourceFilters[84] | string | `"[PodDisruptionBudget/*,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.cleanup-controller.name\" . }}]"` |  |
| upstream.config.resourceFilters[85] | string | `"[PodDisruptionBudget,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.reports-controller.name\" . }}]"` |  |
| upstream.config.resourceFilters[86] | string | `"[PodDisruptionBudget/*,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.reports-controller.name\" . }}]"` |  |
| upstream.config.resourceFilters[87] | string | `"[Service,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.admission-controller.serviceName\" . }}]"` |  |
| upstream.config.resourceFilters[88] | string | `"[Service/*,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.admission-controller.serviceName\" . }}]"` |  |
| upstream.config.resourceFilters[89] | string | `"[Service,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.admission-controller.serviceName\" . }}-metrics]"` |  |
| upstream.config.resourceFilters[90] | string | `"[Service/*,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.admission-controller.serviceName\" . }}-metrics]"` |  |
| upstream.config.resourceFilters[91] | string | `"[Service,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.background-controller.name\" . }}-metrics]"` |  |
| upstream.config.resourceFilters[92] | string | `"[Service/*,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.background-controller.name\" . }}-metrics]"` |  |
| upstream.config.resourceFilters[93] | string | `"[Service,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.cleanup-controller.name\" . }}]"` |  |
| upstream.config.resourceFilters[94] | string | `"[Service/*,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.cleanup-controller.name\" . }}]"` |  |
| upstream.config.resourceFilters[95] | string | `"[Service,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.cleanup-controller.name\" . }}-metrics]"` |  |
| upstream.config.resourceFilters[96] | string | `"[Service/*,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.cleanup-controller.name\" . }}-metrics]"` |  |
| upstream.config.resourceFilters[97] | string | `"[Service,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.reports-controller.name\" . }}-metrics]"` |  |
| upstream.config.resourceFilters[98] | string | `"[Service/*,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.reports-controller.name\" . }}-metrics]"` |  |
| upstream.config.resourceFilters[99] | string | `"[ServiceMonitor,{{ if .Values.admissionController.serviceMonitor.namespace }}{{ .Values.admissionController.serviceMonitor.namespace }}{{ else }}{{ template \"kyverno.namespace\" . }}{{ end }},{{ template \"kyverno.admission-controller.name\" . }}]"` |  |
| upstream.config.resourceFilters[100] | string | `"[ServiceMonitor,{{ if .Values.admissionController.serviceMonitor.namespace }}{{ .Values.admissionController.serviceMonitor.namespace }}{{ else }}{{ template \"kyverno.namespace\" . }}{{ end }},{{ template \"kyverno.background-controller.name\" . }}]"` |  |
| upstream.config.resourceFilters[101] | string | `"[ServiceMonitor,{{ if .Values.admissionController.serviceMonitor.namespace }}{{ .Values.admissionController.serviceMonitor.namespace }}{{ else }}{{ template \"kyverno.namespace\" . }}{{ end }},{{ template \"kyverno.cleanup-controller.name\" . }}]"` |  |
| upstream.config.resourceFilters[102] | string | `"[ServiceMonitor,{{ if .Values.admissionController.serviceMonitor.namespace }}{{ .Values.admissionController.serviceMonitor.namespace }}{{ else }}{{ template \"kyverno.namespace\" . }}{{ end }},{{ template \"kyverno.reports-controller.name\" . }}]"` |  |
| upstream.config.resourceFilters[103] | string | `"[Secret,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.admission-controller.serviceName\" . }}.{{ template \"kyverno.namespace\" . }}.svc.*]"` |  |
| upstream.config.resourceFilters[104] | string | `"[Secret,{{ include \"kyverno.namespace\" . }},{{ template \"kyverno.cleanup-controller.name\" . }}.{{ template \"kyverno.namespace\" . }}.svc.*]"` |  |
| upstream.existingImagePullSecrets | list | `["private-registry"]` | Existing Image pull secrets for image verification policies, this will define the `--imagePullSecrets` argument |
| upstream.webhooksCleanup.enabled | bool | `true` | Create a helm pre-delete hook to cleanup webhooks. |
| upstream.webhooksCleanup.image.registry | string | `"registry1.dso.mil"` |  |
| upstream.webhooksCleanup.image.repository | string | `"ironbank/opensource/kubernetes/kubectl"` |  |
| upstream.webhooksCleanup.image.tag | string | `"v1.30.10"` |  |
| upstream.webhooksCleanup.image.pullPolicy | string | `nil` |  |
| upstream.webhooksCleanup.imagePullSecrets[0].name | string | `"private-registry"` |  |
| upstream.webhooksCleanup.automountServiceAccountToken.enabled | bool | `true` |  |
| upstream.webhooksCleanup.podSecurityContext.runAsUser | int | `1001` |  |
| upstream.webhooksCleanup.podSecurityContext.runAsGroup | int | `1001` |  |
| upstream.webhooksCleanup.podSecurityContext.runAsNonRoot | bool | `true` |  |
| upstream.webhooksCleanup.securityContext.runAsUser | int | `1001` |  |
| upstream.webhooksCleanup.securityContext.runAsGroup | int | `1001` |  |
| upstream.webhooksCleanup.securityContext.runAsNonRoot | bool | `true` |  |
| upstream.webhooksCleanup.securityContext.privileged | bool | `false` |  |
| upstream.webhooksCleanup.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| upstream.webhooksCleanup.securityContext.readOnlyRootFilesystem | bool | `true` |  |
| upstream.webhooksCleanup.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| upstream.webhooksCleanup.securityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| upstream.webhooksCleanup.resources.limits.cpu | string | `"0.5"` |  |
| upstream.webhooksCleanup.resources.limits.memory | string | `"256Mi"` |  |
| upstream.webhooksCleanup.resources.requests.cpu | string | `"0.5"` |  |
| upstream.webhooksCleanup.resources.requests.memory | string | `"256Mi"` |  |
| upstream.policyReportsCleanup.enabled | bool | `false` |  |
| upstream.policyReportsCleanup.automountServiceAccountToken.enabled | bool | `true` |  |
| upstream.policyReportsCleanup.image.registry | string | `"registry1.dso.mil"` |  |
| upstream.policyReportsCleanup.image.repository | string | `"ironbank/opensource/kubernetes/kubectl"` |  |
| upstream.policyReportsCleanup.image.tag | string | `"v1.30.10"` |  |
| upstream.policyReportsCleanup.imagePullSecrets[0].name | string | `"private-registry"` |  |
| upstream.policyReportsCleanup.podSecurityContext.runAsUser | int | `1001` |  |
| upstream.policyReportsCleanup.podSecurityContext.runAsGroup | int | `1001` |  |
| upstream.policyReportsCleanup.podSecurityContext.runAsNonRoot | bool | `true` |  |
| upstream.policyReportsCleanup.securityContext.runAsUser | int | `1001` |  |
| upstream.policyReportsCleanup.securityContext.runAsGroup | int | `1001` |  |
| upstream.policyReportsCleanup.securityContext.runAsNonRoot | bool | `true` |  |
| upstream.policyReportsCleanup.securityContext.privileged | bool | `false` |  |
| upstream.policyReportsCleanup.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| upstream.policyReportsCleanup.securityContext.readOnlyRootFilesystem | bool | `true` |  |
| upstream.policyReportsCleanup.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| upstream.policyReportsCleanup.securityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| upstream.policyReportsCleanup.resources | object | `{"limits":{"cpu":"1","memory":"512Mi"},"requests":{"cpu":"0.5","memory":"256Mi"}}` | Resource limits for the containers |
| upstream.grafana.enabled | bool | `false` |  |
| upstream.features.policyExceptions.enabled | bool | `false` |  |
| upstream.features.policyExceptions.namespace | string | `"kyverno"` |  |
| upstream.cleanupJobs.rbac.serviceAccount.automountServiceAccountToken.enabled | bool | `false` |  |
| upstream.cleanupJobs.admissionReports.enabled | bool | `true` |  |
| upstream.cleanupJobs.admissionReports.automountServiceAccountToken.enabled | bool | `true` |  |
| upstream.cleanupJobs.admissionReports.backoffLimit | int | `3` |  |
| upstream.cleanupJobs.admissionReports.image.registry | string | `"registry1.dso.mil"` |  |
| upstream.cleanupJobs.admissionReports.image.repository | string | `"ironbank/opensource/kubernetes/kubectl"` |  |
| upstream.cleanupJobs.admissionReports.image.tag | string | `"v1.30.10"` |  |
| upstream.cleanupJobs.admissionReports.imagePullSecrets[0].name | string | `"private-registry"` |  |
| upstream.cleanupJobs.admissionReports.schedule | string | `"*/10 * * * *"` | Cronjob schedule |
| upstream.cleanupJobs.admissionReports.threshold | int | `10000` | Reports threshold, if number of reports are above this value the cronjob will start deleting them |
| upstream.cleanupJobs.admissionReports.history | object | `{"failure":1,"success":1}` | Cronjob history |
| upstream.cleanupJobs.admissionReports.podSecurityContext | object | `{"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000}` | Security context for the pod |
| upstream.cleanupJobs.admissionReports.securityContext | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"privileged":false,"readOnlyRootFilesystem":true,"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000,"seccompProfile":{"type":"RuntimeDefault"}}` | Security context for the containers |
| upstream.cleanupJobs.clusterAdmissionReports.enabled | bool | `true` | Enable cleanup cronjob |
| upstream.cleanupJobs.clusterAdmissionReports.automountServiceAccountToken.enabled | bool | `true` |  |
| upstream.cleanupJobs.clusterAdmissionReports.backoffLimit | int | `3` |  |
| upstream.cleanupJobs.clusterAdmissionReports.image.registry | string | `"registry1.dso.mil"` |  |
| upstream.cleanupJobs.clusterAdmissionReports.image.repository | string | `"ironbank/opensource/kubernetes/kubectl"` |  |
| upstream.cleanupJobs.clusterAdmissionReports.image.tag | string | `"v1.30.10"` |  |
| upstream.cleanupJobs.clusterAdmissionReports.image.pullPolicy | string | `nil` |  |
| upstream.cleanupJobs.clusterAdmissionReports.imagePullSecrets | list | `[{"name":"private-registry"}]` | Image pull secrets |
| upstream.cleanupJobs.clusterAdmissionReports.schedule | string | `"*/10 * * * *"` | Cronjob schedule |
| upstream.cleanupJobs.clusterAdmissionReports.threshold | int | `10000` | Reports threshold, if number of reports are above this value the cronjob will start deleting them |
| upstream.cleanupJobs.clusterAdmissionReports.history | object | `{"failure":1,"success":1}` | Cronjob history |
| upstream.cleanupJobs.clusterAdmissionReports.podSecurityContext | object | `{"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000}` | Security context for the pod |
| upstream.cleanupJobs.clusterAdmissionReports.securityContext | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"privileged":false,"readOnlyRootFilesystem":true,"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000,"seccompProfile":{"type":"RuntimeDefault"}}` | Security context for the containers |
| upstream.cleanupJobs.updateRequests.enabled | bool | `true` |  |
| upstream.cleanupJobs.updateRequests.automountServiceAccountToken.enabled | bool | `true` |  |
| upstream.cleanupJobs.updateRequests.backoffLimit | int | `3` |  |
| upstream.cleanupJobs.updateRequests.ttlSecondsAfterFinished | string | `""` |  |
| upstream.cleanupJobs.updateRequests.image.registry | string | `"registry1.dso.mil"` |  |
| upstream.cleanupJobs.updateRequests.image.repository | string | `"ironbank/opensource/kubernetes/kubectl"` |  |
| upstream.cleanupJobs.updateRequests.image.tag | string | `"v1.30.10"` |  |
| upstream.cleanupJobs.updateRequests.image.pullPolicy | string | `nil` |  |
| upstream.cleanupJobs.updateRequests.imagePullSecrets | list | `[{"name":"private-registry"}]` | Image pull secrets |
| upstream.cleanupJobs.updateRequests.schedule | string | `"*/10 * * * *"` | Cronjob schedule |
| upstream.cleanupJobs.updateRequests.podSecurityContext | object | `{"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000}` | Security context for the pod |
| upstream.cleanupJobs.updateRequests.securityContext | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"privileged":false,"readOnlyRootFilesystem":true,"runAsNonRoot":true,"seccompProfile":{"type":"RuntimeDefault"}}` | Security context for the containers |
| upstream.cleanupJobs.ephemeralReports.enabled | bool | `true` |  |
| upstream.cleanupJobs.ephemeralReports.automountServiceAccountToken.enabled | bool | `true` |  |
| upstream.cleanupJobs.ephemeralReports.backoffLimit | int | `3` |  |
| upstream.cleanupJobs.ephemeralReports.ttlSecondsAfterFinished | string | `""` |  |
| upstream.cleanupJobs.ephemeralReports.image.registry | string | `"registry1.dso.mil"` |  |
| upstream.cleanupJobs.ephemeralReports.image.repository | string | `"ironbank/opensource/kubernetes/kubectl"` |  |
| upstream.cleanupJobs.ephemeralReports.image.tag | string | `"v1.30.10"` |  |
| upstream.cleanupJobs.ephemeralReports.image.pullPolicy | string | `nil` |  |
| upstream.cleanupJobs.ephemeralReports.imagePullSecrets[0].name | string | `"private-registry"` |  |
| upstream.cleanupJobs.ephemeralReports.schedule | string | `"*/10 * * * *"` |  |
| upstream.cleanupJobs.ephemeralReports.threshold | int | `10000` |  |
| upstream.cleanupJobs.ephemeralReports.podSecurityContext | object | `{"runAsGroup":1001,"runAsNonRoot":true,"runAsUser":1001}` | Security context for the pod |
| upstream.cleanupJobs.ephemeralReports.securityContext | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"privileged":false,"readOnlyRootFilesystem":true,"runAsNonRoot":true,"seccompProfile":{"type":"RuntimeDefault"}}` | Security context for the containers |
| upstream.cleanupJobs.clusterEphemeralReports.enabled | bool | `true` |  |
| upstream.cleanupJobs.clusterEphemeralReports.automountServiceAccountToken.enabled | bool | `true` |  |
| upstream.cleanupJobs.clusterEphemeralReports.backoffLimit | int | `3` |  |
| upstream.cleanupJobs.clusterEphemeralReports.ttlSecondsAfterFinished | string | `""` |  |
| upstream.cleanupJobs.clusterEphemeralReports.image.registry | string | `"registry1.dso.mil"` |  |
| upstream.cleanupJobs.clusterEphemeralReports.image.repository | string | `"ironbank/opensource/kubernetes/kubectl"` |  |
| upstream.cleanupJobs.clusterEphemeralReports.image.tag | string | `"v1.30.10"` |  |
| upstream.cleanupJobs.clusterEphemeralReports.image.pullPolicy | string | `nil` |  |
| upstream.cleanupJobs.clusterEphemeralReports.imagePullSecrets[0].name | string | `"private-registry"` |  |
| upstream.cleanupJobs.clusterEphemeralReports.schedule | string | `"*/10 * * * *"` | Cronjob schedule |
| upstream.cleanupJobs.clusterEphemeralReports.threshold | int | `10000` | Reports threshold, if number of reports are above this value the cronjob will start deleting them |
| upstream.cleanupJobs.clusterEphemeralReports.history | object | `{"failure":1,"success":1}` | Cronjob history |
| upstream.cleanupJobs.clusterEphemeralReports.podSecurityContext | object | `{"runAsGroup":1001,"runAsNonRoot":true,"runAsUser":1001}` | Security context for the pod |
| upstream.cleanupJobs.clusterEphemeralReports.securityContext | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"privileged":false,"readOnlyRootFilesystem":true,"runAsNonRoot":true,"seccompProfile":{"type":"RuntimeDefault"}}` | Security context for the containers |
| upstream.admissionController.rbac.serviceAccount.automountServiceAccountToken.enabled | bool | `false` |  |
| upstream.admissionController.rbac.deployment.automountServiceAccountToken.enabled | bool | `true` |  |
| upstream.admissionController.rbac.coreClusterRole.extraResources[0].apiGroups[0] | string | `"*"` |  |
| upstream.admissionController.rbac.coreClusterRole.extraResources[0].resources[0] | string | `"*"` |  |
| upstream.admissionController.rbac.coreClusterRole.extraResources[0].verbs[0] | string | `"get"` |  |
| upstream.admissionController.rbac.coreClusterRole.extraResources[0].verbs[1] | string | `"list"` |  |
| upstream.admissionController.rbac.coreClusterRole.extraResources[0].verbs[2] | string | `"watch"` |  |
| upstream.admissionController.rbac.clusterRole.extraResources | list | `[{"apiGroups":["*"],"resources":["*"],"verbs":["get","list","watch"]}]` | Extra resource permissions to add in the cluster role |
| upstream.admissionController.createSelfSignedCert | bool | `false` | Create self-signed certificates at deployment time. The certificates won't be automatically renewed if this is set to `true`. |
| upstream.admissionController.replicas | int | `3` | Desired number of pods |
| upstream.admissionController.podSecurityContext.runAsUser | int | `10001` |  |
| upstream.admissionController.podSecurityContext.runAsGroup | int | `10001` |  |
| upstream.admissionController.podSecurityContext.runAsNonRoot | bool | `true` |  |
| upstream.admissionController.podDisruptionBudget.enabled | bool | `false` |  |
| upstream.admissionController.imagePullSecrets[0].name | string | `"private-registry"` |  |
| upstream.admissionController.initContainer.image.registry | string | `nil` |  |
| upstream.admissionController.initContainer.image.defaultRegistry | string | `"registry1.dso.mil"` |  |
| upstream.admissionController.initContainer.image.repository | string | `"ironbank/opensource/kyverno/kyvernopre"` |  |
| upstream.admissionController.initContainer.image.tag | string | `"v1.13.4"` |  |
| upstream.admissionController.initContainer.image.pullPolicy | string | `nil` |  |
| upstream.admissionController.initContainer.resources.limits | object | `{"cpu":1,"memory":"1Gi"}` | Pod resource limits |
| upstream.admissionController.initContainer.resources.requests | object | `{"cpu":"10m","memory":"64Mi"}` | Pod resource requests |
| upstream.admissionController.initContainer.securityContext | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"privileged":false,"readOnlyRootFilesystem":true,"runAsGroup":10001,"runAsNonRoot":true,"runAsUser":10001,"seccompProfile":{"type":"RuntimeDefault"}}` | Container security context |
| upstream.admissionController.container.image.defaultRegistry | string | `"registry1.dso.mil"` |  |
| upstream.admissionController.container.image.repository | string | `"ironbank/opensource/kyverno"` |  |
| upstream.admissionController.container.image.tag | string | `"v1.13.4"` |  |
| upstream.admissionController.container.image.pullPolicy | string | `"IfNotPresent"` |  |
| upstream.admissionController.container.imagePullSecrets[0].name | string | `"private-registry"` |  |
| upstream.admissionController.container.resources.limits.cpu | string | `"500m"` |  |
| upstream.admissionController.container.resources.limits.memory | string | `"512Mi"` |  |
| upstream.admissionController.container.resources.requests.cpu | string | `"500m"` |  |
| upstream.admissionController.container.resources.requests.memory | string | `"512Mi"` |  |
| upstream.admissionController.container.securityContext.runAsNonRoot | bool | `true` |  |
| upstream.admissionController.container.securityContext.runAsUser | int | `10001` |  |
| upstream.admissionController.container.securityContext.runAsGroup | int | `10001` |  |
| upstream.admissionController.container.securityContext.privileged | bool | `false` |  |
| upstream.admissionController.container.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| upstream.admissionController.container.securityContext.readOnlyRootFilesystem | bool | `true` |  |
| upstream.admissionController.container.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| upstream.admissionController.container.securityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| upstream.backgroundController.enabled | bool | `true` |  |
| upstream.backgroundController.rbac.create | bool | `true` |  |
| upstream.backgroundController.rbac.serviceAccount.automountServiceAccountToken.enabled | bool | `false` |  |
| upstream.backgroundController.rbac.deployment.automountServiceAccountToken.enabled | bool | `true` |  |
| upstream.backgroundController.rbac.coreClusterRole.extraResources[0].apiGroups[0] | string | `"networking.k8s.io"` |  |
| upstream.backgroundController.rbac.coreClusterRole.extraResources[0].resources[0] | string | `"ingresses"` |  |
| upstream.backgroundController.rbac.coreClusterRole.extraResources[0].resources[1] | string | `"ingressclasses"` |  |
| upstream.backgroundController.rbac.coreClusterRole.extraResources[0].resources[2] | string | `"networkpolicies"` |  |
| upstream.backgroundController.rbac.coreClusterRole.extraResources[0].verbs[0] | string | `"create"` |  |
| upstream.backgroundController.rbac.coreClusterRole.extraResources[0].verbs[1] | string | `"update"` |  |
| upstream.backgroundController.rbac.coreClusterRole.extraResources[0].verbs[2] | string | `"patch"` |  |
| upstream.backgroundController.rbac.coreClusterRole.extraResources[0].verbs[3] | string | `"delete"` |  |
| upstream.backgroundController.rbac.coreClusterRole.extraResources[1].apiGroups[0] | string | `"rbac.authorization.k8s.io"` |  |
| upstream.backgroundController.rbac.coreClusterRole.extraResources[1].resources[0] | string | `"rolebindings"` |  |
| upstream.backgroundController.rbac.coreClusterRole.extraResources[1].resources[1] | string | `"roles"` |  |
| upstream.backgroundController.rbac.coreClusterRole.extraResources[1].verbs[0] | string | `"create"` |  |
| upstream.backgroundController.rbac.coreClusterRole.extraResources[1].verbs[1] | string | `"update"` |  |
| upstream.backgroundController.rbac.coreClusterRole.extraResources[1].verbs[2] | string | `"patch"` |  |
| upstream.backgroundController.rbac.coreClusterRole.extraResources[1].verbs[3] | string | `"delete"` |  |
| upstream.backgroundController.rbac.coreClusterRole.extraResources[2].apiGroups[0] | string | `"*"` |  |
| upstream.backgroundController.rbac.coreClusterRole.extraResources[2].resources[0] | string | `"configmaps"` |  |
| upstream.backgroundController.rbac.coreClusterRole.extraResources[2].resources[1] | string | `"resourcequotas"` |  |
| upstream.backgroundController.rbac.coreClusterRole.extraResources[2].resources[2] | string | `"limitranges"` |  |
| upstream.backgroundController.rbac.coreClusterRole.extraResources[2].verbs[0] | string | `"create"` |  |
| upstream.backgroundController.rbac.coreClusterRole.extraResources[2].verbs[1] | string | `"update"` |  |
| upstream.backgroundController.rbac.coreClusterRole.extraResources[2].verbs[2] | string | `"patch"` |  |
| upstream.backgroundController.rbac.coreClusterRole.extraResources[2].verbs[3] | string | `"delete"` |  |
| upstream.backgroundController.rbac.coreClusterRole.extraResources[3].apiGroups[0] | string | `"*"` |  |
| upstream.backgroundController.rbac.coreClusterRole.extraResources[3].resources[0] | string | `"serviceaccounts"` |  |
| upstream.backgroundController.rbac.coreClusterRole.extraResources[3].verbs[0] | string | `"get"` |  |
| upstream.backgroundController.rbac.coreClusterRole.extraResources[3].verbs[1] | string | `"list"` |  |
| upstream.backgroundController.rbac.coreClusterRole.extraResources[3].verbs[2] | string | `"watch"` |  |
| upstream.backgroundController.rbac.coreClusterRole.extraResources[3].verbs[3] | string | `"update"` |  |
| upstream.backgroundController.rbac.coreClusterRole.extraResources[3].verbs[4] | string | `"patch"` |  |
| upstream.backgroundController.rbac.clusterRole.extraResources | list | `[{"apiGroups":["*"],"resources":["*"],"verbs":["get","list","watch"]},{"apiGroups":["*"],"resources":["secrets"],"verbs":["create","update","delete"]}]` | Extra resource permissions to add in the cluster role |
| upstream.backgroundController.image.defaultRegistry | string | `"registry1.dso.mil"` |  |
| upstream.backgroundController.image.repository | string | `"ironbank/opensource/kyverno/kyverno/background-controller"` |  |
| upstream.backgroundController.image.tag | string | `"v1.13.4"` |  |
| upstream.backgroundController.imagePullSecrets[0].name | string | `"private-registry"` |  |
| upstream.backgroundController.podSecurityContext.runAsUser | int | `1000` |  |
| upstream.backgroundController.podSecurityContext.runAsGroup | int | `1000` |  |
| upstream.backgroundController.podSecurityContext.runAsNonRoot | bool | `true` |  |
| upstream.backgroundController.securityContext.runAsNonRoot | bool | `true` |  |
| upstream.backgroundController.securityContext.runAsUser | int | `1000` |  |
| upstream.backgroundController.securityContext.runAsGroup | int | `1000` |  |
| upstream.backgroundController.securityContext.privileged | bool | `false` |  |
| upstream.backgroundController.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| upstream.backgroundController.securityContext.readOnlyRootFilesystem | bool | `true` |  |
| upstream.backgroundController.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| upstream.backgroundController.securityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| upstream.cleanupController.enabled | bool | `true` |  |
| upstream.cleanupController.rbac.create | bool | `true` |  |
| upstream.cleanupController.rbac.serviceAccount.automountServiceAccountToken.enabled | bool | `false` |  |
| upstream.cleanupController.rbac.deployment.automountServiceAccountToken.enabled | bool | `true` |  |
| upstream.cleanupController.image.defaultRegistry | string | `"registry1.dso.mil"` |  |
| upstream.cleanupController.image.repository | string | `"ironbank/opensource/kyverno/kyverno/cleanup-controller"` |  |
| upstream.cleanupController.image.tag | string | `"v1.13.4"` |  |
| upstream.cleanupController.image.pullPolicy | string | `"IfNotPresent"` |  |
| upstream.cleanupController.imagePullSecrets[0].name | string | `"private-registry"` |  |
| upstream.cleanupController.podSecurityContext.runAsUser | int | `1000` |  |
| upstream.cleanupController.podSecurityContext.runAsGroup | int | `1000` |  |
| upstream.cleanupController.podSecurityContext.runAsNonRoot | bool | `true` |  |
| upstream.cleanupController.securityContext | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"privileged":false,"readOnlyRootFilesystem":true,"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000,"seccompProfile":{"type":"RuntimeDefault"}}` | Security context for the containers |
| upstream.reportsController.enabled | bool | `true` |  |
| upstream.reportsController.rbac.create | bool | `true` |  |
| upstream.reportsController.rbac.serviceAccount.automountServiceAccountToken.enabled | bool | `false` |  |
| upstream.reportsController.rbac.deployment.automountServiceAccountToken.enabled | bool | `true` |  |
| upstream.reportsController.rbac.coreClusterRole.extraResources[0].apiGroups[0] | string | `"*"` |  |
| upstream.reportsController.rbac.coreClusterRole.extraResources[0].resources[0] | string | `"*"` |  |
| upstream.reportsController.rbac.coreClusterRole.extraResources[0].verbs[0] | string | `"get"` |  |
| upstream.reportsController.rbac.coreClusterRole.extraResources[0].verbs[1] | string | `"list"` |  |
| upstream.reportsController.rbac.coreClusterRole.extraResources[0].verbs[2] | string | `"watch"` |  |
| upstream.reportsController.rbac.clusterRole.extraResources | list | `[{"apiGroups":["*"],"resources":["*"],"verbs":["get","list","watch"]}]` | Extra resource permissions to add in the cluster role |
| upstream.reportsController.image.defaultRegistry | string | `"registry1.dso.mil"` |  |
| upstream.reportsController.image.repository | string | `"ironbank/opensource/kyverno/kyverno/reports-controller"` |  |
| upstream.reportsController.image.tag | string | `"v1.13.4"` |  |
| upstream.reportsController.image.pullPolicy | string | `"IfNotPresent"` |  |
| upstream.reportsController.imagePullSecrets[0].name | string | `"private-registry"` |  |
| upstream.reportsController.podSecurityContext.runAsUser | int | `1000` |  |
| upstream.reportsController.podSecurityContext.runAsGroup | int | `1000` |  |
| upstream.reportsController.podSecurityContext.runAsNonRoot | bool | `true` |  |
| upstream.reportsController.securityContext.runAsNonRoot | bool | `true` |  |
| upstream.reportsController.securityContext.runAsUser | int | `1000` |  |
| upstream.reportsController.securityContext.runAsGroup | int | `1000` |  |
| upstream.reportsController.securityContext.privileged | bool | `false` |  |
| upstream.reportsController.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| upstream.reportsController.securityContext.readOnlyRootFilesystem | bool | `true` |  |
| upstream.reportsController.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| upstream.reportsController.securityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| upstream.test.sleep | int | `20` | Sleep time before running test |
| upstream.test.image.registry | string | `"registry1.dso.mil"` |  |
| upstream.test.image.repository | string | `"ironbank/frontiertechnology/cortex/busybox"` |  |
| upstream.test.image.tag | string | `"v1.37.0"` |  |
| upstream.test.image.pullPolicy | string | `nil` |  |
| upstream.test.imagePullSecrets[0].name | string | `"private-registry"` |  |
| upstream.test.resources.limits | object | `{"cpu":"100m","memory":"256Mi"}` | Pod resource limits |
| upstream.test.resources.requests | object | `{"cpu":"10m","memory":"64Mi"}` | Pod resource requests |
| upstream.test.podSecurityContext | object | `{"runAsGroup":65534,"runAsNonRoot":true,"runAsUser":65534}` | Security context for the test pod |
| upstream.test.securityContext | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"privileged":false,"readOnlyRootFilesystem":true,"runAsGroup":65534,"runAsNonRoot":true,"runAsUser":65534,"seccompProfile":{"type":"RuntimeDefault"}}` | Security context for the test containers |
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
