
# How to update the Kyverno Package chart

Kyverno within Big Bang is a passthrough chart that wraps the upstream kyverno helm chart. The below details the steps required to update to a new version of the Kyverno package.

1. Review the upstream [changelog](https://github.com/kyverno/kyverno/blob/main/CHANGELOG.md) for potential breaking changes.
1. Navigate to the upstream [kyverno helm chart repo](https://github.com/kyverno/kyverno/tree/main/charts/kyverno) and find the latest chart version that works with the image update. For example, if updating to 1.9.1 I would look at the [Chart.yaml](https://github.com/kyverno/kyverno/blob/main/charts/kyverno/Chart.yaml) `appVersion` field and switch through the latest git tags until I find one that matches 1.9.1. For this example that would be [`v1.9.1`](https://github.com/kyverno/kyverno/blob/v1.9.1/charts/kyverno/Chart.yaml#L5).
1. Check out the existing `renovate/ironbank` branch created by the renovate-runner, an MR for this branch should be linked in the Renovate issue.
1. Update the kyverno dependency version in `chart/Chart.yaml` to match the upstream version found in step 2 if not already updated by renovate-runner.
1. Append `-bb.0` to the `version` in `chart/Chart.yaml`.
1. Check for a new version of gluon prior to running helm dependency update. <https://repo1.dso.mil/big-bang/product/packages/gluon/-/tags>. If found, update the version in Chart.yaml.
1. Run `helm dependency update` from the `./chart` directory to regenerate dependencies.
1. Update `CHANGELOG.md` adding an entry for the new version and noting all changes (at minimum should include `Updated Kyverno to x.x.x`).
1. Generate the `README.md` updates by following the [guide in gluon](https://repo1.dso.mil/platform-one/big-bang/apps/library-charts/gluon/-/blob/master/docs/bb-package-readme.md).
1. Open an MR in "Draft" status ( or the Renovate created MR ) and validate that CI passes. This will perform a number of smoke tests against the package, but it is good to manually deploy to test some things that CI doesn't. Follow the steps below for manual testing. 
1. For major updates or changes that impact istio or network policies, conduct bigbang integration testing by following the steps in [test-package-against-bb](https://repo1.dso.mil/big-bang/bigbang/-/blob/master/docs/community/development/test-package-against-bb.md) and modifying test-values with the following settings:

  ```yaml
  kyverno:
    enabled: true
    sourceType: "git"
    git:
      tag: null
      repo: "https://repo1.dso.mil/big-bang/product/packages/kyverno.git"
      path: "./chart"
      branch: "renovate/ironbank"
  ```

1. Once all manual testing is complete take your MR out of "Draft" status and add the review label.

# Testing New Kyverno Version

NOTE: For these testing steps it is good to do them on both a clean install and an upgrade. For clean install, point kyverno to your branch. For an upgrade do an install with kyverno pointing to the latest tag, then perform a helm upgrade with kyverno pointing to your branch.

You will want to install with the following override:

  ```yaml
  istio:
    enabled: true
  networkPolicies:
    enabled: true
  monitoring:
    enabled: true
  kyvernoPolicies:
    enabled: true
  kyvernoReporter:
    enabled: true
  kyverno:
    enabled: true
    sourceType: "git"
    git:
      tag: null
      repo: "https://repo1.dso.mil/big-bang/product/packages/kyverno.git"
      path: "./chart"
      branch: "renovate/ironbank"
  ```

Below is a sample policy:

```yaml
kyverno:
  enabled: true
  sourceType: "git"
  git:
    tag: null
    repo: "https://repo1.dso.mil/big-bang/product/packages/kyverno.git"
    path: "./chart"
    branch: "renovate/ironbank"
istioOperator:
  enabled: true
istio:
  enabled: true
kyvernoPolicies:
  enabled: true
kyvernoReporter:
  enabled: true
monitoring:
  enabled: true
  ```

Checking Prometheus for Kyverno dashboards

- [Login](https://docs-bigbang.dso.mil/latest/docs/configuration/default-credentials/#packages-with-no-built-in-authentication) to Prometheus, validate under `Status` -> `Targets` that all kyverno controller targets are showing as up
- [Login](https://docs-bigbang.dso.mil/latest/docs/configuration/default-credentials/#packages-with-built-in-authentication) to Grafana, then navigate to the Kyverno daskboard ( Dashboards > Browse > Kyverno Metrics ) and validate that the dashboard displays data

> 📌 __NOTE__: if using MacOS make sure that you have gnu sed installed and add it to your PATH variable [GNU SED Instructions](https://gist.github.com/andre3k1/e3a1a7133fded5de5a9ee99c87c6fa0d)

- [ ] Test secret sync in new namespace

    ```Shell
    # create secret in kyverno NS
    kubectl create secret generic \
      -n kyverno kyverno-bbtest-secret \
      --from-literal=username='username' \
      --from-literal=password='password'

    # Create Kyverno Policy
    kubectl apply -f https://repo1.dso.mil/big-bang/product/packages/kyverno/-/raw/main/chart/tests/manifests/sync-secrets.yaml

    # Wait until the policy shows as ready before proceeding
    kubectl get clusterpolicy sync-secrets

    # Create a namespace with the correct label (essentially we are dry-running a namespace creation to get the yaml, adding the label, then applying)
    kubectl create namespace kyverno-bbtest --dry-run=client -o yaml | sed '/^metadata:/a\ \ labels: {"kubernetes.io/metadata.name": "kyverno-bbtest"}' | kubectl apply -f -

    # Check for the secret that should be synced - if it exists this test is successful
    kubectl get secrets kyverno-bbtest-secret -n kyverno-bbtest
    ```

- [ ] Delete the test resources

    ```shell
    # If above is successful, delete test resources
    kubectl delete -f https://repo1.dso.mil/big-bang/product/packages/kyverno/-/raw/main/chart/tests/manifests/sync-secrets.yaml
    kubectl delete secret kyverno-bbtest-secret -n kyverno
    kubectl delete ns kyverno-bbtest
    ```

# Modifications made to upstream chart

## Main

### chart/Chart.yaml

- Added `-bb` to chart `version`
- Added `bigbang.dev/applicationVersions` and `helm.sh/images` to `annotations`
- Added `gluon` to `dependencies`

### chart/values.yaml

- Set `upgrade.fromV2` to `true`

- Set `apiVersionOverride.podDisruptionBudget` to `policy/v1`

- Set `defaultRegistry` to `registry1.dso.mil`

- Set `existingImagePullSecrets` to `private-registry`

- Set `image` fields to use ironbank images, as follows:

  ```
  image:
    registry: registry1.dso.mil
    repository: ironbank/{repository_path}
    tag: {tag}
  imagePullSecrets:
  - name: private-registry
  ```

  *in the following locations*
  - `test`
  - `webhooksCleanup`
  - `cleanupJobs.admissionReports`
  - `cleanupJobs.clusterAdmissionReports`
  - `admissionController.initContainer`
  - `admissionController.container`
  - `backgroundController`
  - `cleanupController`
  - `reportsController`
  - `policyReportsCleanup`

- Set `podSecurityContext` and `securityContext`, as follows:

  ```
  podSecurityContext:
    runAsUser: {id}
    runAsGroup: {id}
    runAsNonRoot: true
  securityContext:
    runAsUser: {id}
    runAsGroup: {id}
  ```

  *according to the chart below*
  | key | id |
  | --- | -- |
  | `test` | 65534 |
  | `webhooksCleanup` | 1001 |
  | `cleanupJobs.admissionReports` | 1000 |
  | `cleanupJobs.clusterAdmissionReports` | 1000 |
  | `admissionController` | 10001 |
  | `backgroundController` | 1000 |
  | `cleanupController` | 1000 |
  | `reportsController` | 1000 |
  | `policyReportsCleanup` | 1001 |

- Set `features.policyExceptions.namespace` to `kyverno`

- Set `admissionController.replicas` to `3`

- Set `admissionController.container.resources` as follows:

  ```
  resources:
  limits:
    cpu: 500m
    memory: 512Mi
  requests:
    cpu: 500m
    memory: 512Mi
  ```

- Add service accounts rule to `backgroundController.rbac.coreClusterRole.extraResources` as follows:

  ```
  - apiGroups: 
      - ''
    resources: 
      - serviceaccounts
    verbs: 
      - get
      - list 
      - watch
      - update
      - patch
  ```

- Added Big Bang `monitoring`, `networkPolicies`, `istio`, `openshift`, and `bbtests` fields

- `automountServiceAccountToken.enabled` added to:
  - `admissionController.rbac.serviceAccount`
  - `admissionController.rbac.deployment`
  - `backgroundController.rbac.serviceAccount`
  - `backgroundController.rbac.deployment`
  - `cleanupJobs.admissionReports`
  - `cleanupJobs.clusterAdmissionReports`
  - `cleanupJobs.rbac.serviceAccount`
  - `cleanupController.deployment.serviceAccount`
  - `cleanupController.rbac.serviceAccount`
  - `reportsController.deployment.serviceAccount`
  - `reportsController.rbac.serviceAccount`
  - `webhooksCleanup`

### chart/charts

- Generate `gluon` dependency

### chart/tests/

- Add test files `/manifests/sync-secrets.yaml` and `scripts/secrets.sh`

### chart/crds/

- Update `crd-servicemonitors.yaml` with the latest version from the monitoring package

## Templates

### chart/templates/bigbang/network-policy

- Add Big Bang network policy templates

### chart/templates/tests/

- In upstream tests: 
`admission-controller-liveness`, `admission-controller-metrics`, `admission-controller-readiness`, `cleanup-controller-liveness`, `cleanup-controller-metrics`, `cleanup-controller-readiness`, and `reports-controller-metrics`

- Add Big Bang test files `clusterrole`, `clusterrolebinding`, `configmap`, `gluon`, `serviceaccount`, and `test`

- in _helpers.tpl
  - Add `kyverno.test-labels` definition for required helm labels

## `automountServiceAccountToken`

The values.yaml has been updated to manage the auto-mounting of ServiceAccount tokens and can be disabling/enabling per SA and/or deployment

