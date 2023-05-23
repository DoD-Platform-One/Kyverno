
# How to update the Kyverno Package chart
Kyverno within Big Bang is a modified version of an upstream chart. `kpt` is used to handle any automatic updates from upstream. The below details the steps required to update to a new version of the Fluentbit package.

1. Navigate to the upstream [kyverno helm chart repo](https://github.com/kyverno/kyverno/tree/main/charts/kyverno) and find the latest chart version that works with the image update. For example, if updating to 1.9.1 I would look at the [Chart.yaml](https://github.com/kyverno/kyverno/blob/main/charts/kyverno/Chart.yaml) `appVersion` field and switch through the latest git tags until I find one that matches 1.9.1. For this example that would be [`v1.9.1`](https://github.com/kyverno/kyverno/blob/v1.9.1/charts/kyverno/Chart.yaml#L5).

2. Create a development branch and merge request from the Gitlab issue or use the existing `renovate/ironbank` branch and existing MR created by Renovate.
   
3. From the top level of the repo run `kpt pkg update chart@{GIT TAG} --strategy alpha-git-patch` replacing `{GIT TAG}` with the tag you found in step one. You may run into some merge conflicts, resolve these in the way that makes the most sense. In general, if something is a BB addition you will want to keep it, otherwise go with the upstream change.

4. Append `-bb.0` to the `version` in `chart/Chart.yaml`.

5. Update `CHANGELOG.md` adding an entry for the new version and noting all changes (at minimum should include `Updated Kyverno to x.x.x`).

6. Generate the `README.md` updates by following the [guide in gluon](https://repo1.dso.mil/platform-one/big-bang/apps/library-charts/gluon/-/blob/master/docs/bb-package-readme.md).

7. Open an MR in "Draft" status ( or the Renovate created MR ) and validate that CI passes. This will perform a number of smoke tests against the package, but it is good to manually deploy to test some things that CI doesn't. Follow the steps below for manual testing.

8. Once all manual testing is complete take your MR out of "Draft" status and add the review label. 

# Testing New Kyverno Version

NOTE: For these testing steps it is good to do them on both a clean install and an upgrade. For clean install, point kyverno to your branch. For an upgrade do an install with kyverno pointing to the latest tag, then perform a helm upgrade with kyverno pointing to your branch.

You will want to install with:
- Kyverno Kyverno-Policies, and Kyverno-Reporter enabled
- Istio enabled
- Monitoring enabled

Checking Prometheus for Kyverno dashboards
- Login to Prometheus, validate under `Status` -> `Targets` that all kyverno targets are showing as up
- Login to Grafana, then navigate to the Kyverno daskboard ( Dashboards > Browse > Kyverno ) and validate that the dashboard displays data

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

Note that this list is likely incomplete currently.

## chart/Chart.yaml

- Annotations added for versioning, images
- Gluon dependency added for helm tests

## chart/values.yaml

- Changed image to default to Ironbank image
- Added values for `extraArgs`, `dashboards`, `registries`, `istio`, `networkPolicies`, `openshift`, and `bbtests`
- Changed default limits and requests

## chart/charts

- Added directory and `gluon` dependency

## chart/crds

- Added directory and `crd-servicemonitors.yaml`

## chart/dashboards

- Added directory and `dashboard.json`

## chart/templates/_helpers.tpl

- add `kyverno.pullsecretlist` definition (lines 72 to 81)

## chart/templates/bigbang/

- Added `bigbang` directory (`/chart/templates/bigbang`)
- Added `dashboards`
- Added `network-policy` directory and network policies

## chart/templates/tests/

- Added tests for `clusterrole`, `clusterrolebinding`, `configmap`, `gluon`, and `serviceaccount`

## chart/templates/tests/test.yaml

- Added values for `namespace`, `imagePullSecrets`, 
- Changed test container from `wget` to `curl` 



#######################
## chart/templates/configmap.yaml

- Add `fluent-bit.conf:` [OUTPUT]s, lines 11 to 226

## chart/templates/_pod.tpl

- Add `additionalElastic` to `additionalLoki` (lines 50 to 77) with the adjustment in order to `envFrom` in the middle (lines 55-58)
- Add `Values.additionalOutputs` (lines 122 to 137 and lines 162-180)
- Change container name to `name: {{ default .Chart.Name .Values.nameOverride }}`

## chart/values.yaml

- Added values for `elasticsearch`, `istio`, `additionalOutputs`, `storage_buffer`, `networkPolicies`, `openshift`, and `bbtests`
- Changed image to default to Ironbank image
- Set default `securityContext`, `imagePullSecrets`, `extraVolumes`, `extraVolumeMounts`, and `config`
- Added commented out values for `serviceMonitor.scheme` and `serviceMonitor.tlsConfig`
