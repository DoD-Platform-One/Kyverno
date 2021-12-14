# Kyverno

[Kyverno](https://kyverno.io) is a policy management tool for Kubernetes.  This repo contains an enhanced Helm chart for deploying Kyverno with [Big Bang](https://repo1.dso.mil/platform-one/big-bang/bigbang).  See the [Helm chart README.md](../chart/README.md) for more information on using the chart.

Big Bang will also deploy the [Kyverno Policies Helm chart](https://repo1.dso.mil/platform-one/big-bang/apps/sandbox/kyverno-policies) to deploy a collection of default policies for Kyverno.

## Notes for Uninstall

To fully cleanup Kyverno, you should delete the webhooks in addition to uninstalling the chart:

```shell
# Uninstall chart
helm uninstall kyverno chart/

# Clean up webhooks
kubectl delete mutatingwebhookconfigurations kyverno-policy-mutating-webhook-cfg kyverno-resource-mutating-webhook-cfg kyverno-verify-mutating-webhook-cfg
kubectl delete validatingwebhookconfigurations kyverno-policy-validating-webhook-cfg kyverno-resource-validating-webhook-cfg
```
