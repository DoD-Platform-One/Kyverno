#!/bin/bash
set -e

NAMESPACE="kyverno-bbtest"
SECRET_NAME="kyverno-bbtest-secret"

echo "Test: Copy secret to new namespace"
echo "Step 1: Create secret to be copied"
# kubectl create secret generic $SECRET_NAME -n kyverno
kubectl create secret generic -n kyverno $SECRET_NAME \
  --from-literal=username='username' \
  --from-literal=password='password'
kubectl get secret $SECRET_NAME -n kyverno

echo "Step 2: Apply kyverno policy"
kubectl apply -n kyverno -f /yaml/ && sleep 5 #wait for policy to be ready

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
