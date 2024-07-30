#!/bin/bash
set -e

source ./check_cluster_policy.sh

NAMESPACE="kyverno-bbtest"
SECRET_NAME="kyverno-bbtest-secret"
POLICY_NAME="sync-secrets"

echo "Test: Copy secret to new namespace"
echo "Step 1: Create secret to be copied"

# kubectl create secret generic $SECRET_NAME -n kyverno
kubectl get secret $SECRET_NAME -n kyverno 2> /dev/null || kubectl create secret generic -n kyverno $SECRET_NAME \
    --from-literal=username='username' \
    --from-literal=password='password'

#Double check if secret exists:
kubectl get secret $SECRET_NAME -n kyverno

echo "Step 2: Apply kyverno policy"
kubectl apply -n kyverno -f /yaml/ && sleep 5 #wait for policy to be ready
# if run locally in kyverno/chart/tests/scripts directory run:
# kubectl apply -n kyverno -f ../manifests/sync-secrets.yaml && sleep 5
# for local cleanup: 
# kubectl delete -n kyverno -f ../manifests/sync-secrets.yaml

# Check for ClusterPolicy secret-sync prior to creating the namespace
check_cluster_policy "$POLICY_NAME"
if [ $? -ne 0 ]; then
    echo "ClusterPolicy check failed."
    exit 1
else
    echo "ClusterPolicy check succeeded."
    exit 0
fi

echo "Step 3: Check if the secret was created in new namespace"
kubectl create namespace $NAMESPACE
# Timeout of 2 minutes in case we fail
timeout 120s /bin/sh -c "until kubectl get secret $SECRET_NAME -n $NAMESPACE; do sleep 5; done"

echo "Clean Up"
kubectl delete -n kyverno -f /yaml/
kubectl delete secret $SECRET_NAME -n $NAMESPACE
kubectl delete secret $SECRET_NAME -n kyverno
kubectl delete namespace $NAMESPACE

echo "Test: Passed"
