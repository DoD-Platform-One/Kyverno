#!/bin/bash
set -e

source ./check_cluster_policy.sh

# Colors
RED='\033[0;31m'
GRN='\033[0;32m'
YEL='\033[0;33m'
CYN='\033[0;36m'
NC='\033[0m'

NAMESPACE="kyverno-bbtest"
SECRET_NAME="kyverno-bbtest-secret"
POLICY_NAME="sync-secrets"


#ensure namespace does not already exist
kubectl get namespace $NAMESPACE -n kyverno 2> /dev/null && kubectl delete namespace $NAMESPACE 2> /dev/null

echo "Test: Copy secret to new namespace"
echo "Step 1: Create secret to be copied"

# kubectl create secret generic $SECRET_NAME -n kyverno
kubectl get secret $SECRET_NAME -n kyverno 2> /dev/null || kubectl create secret generic -n kyverno $SECRET_NAME \
    --from-literal=username='username' \
    --from-literal=password='password'

#Double check if secret exists:
kubectl get secret $SECRET_NAME -n kyverno

echo "Step 2: Apply kyverno policy"
kubectl apply -n kyverno -f /yaml/$POLICY_NAME.yaml && sleep 5 #wait for policy to be ready

# if run locally in kyverno/chart/tests/scripts directory run:
# kubectl apply -n kyverno -f ../manifests/sync-secrets.yaml && sleep 5
# for local cleanup: 
# kubectl delete -n kyverno -f ../manifests/sync-secrets.yaml

# Check for ClusterPolicy secret-sync prior to creating the namespace
check_cluster_policy "$POLICY_NAME"
kubectl wait --timeout=30s --for='jsonpath={.status.conditions[?(@.type=="Ready")].status}=True' ClusterPolicy/$POLICY_NAME -n $NAMESPACE
if [ $? -eq 0 ]; then echo "$POLICY_NAME is ready"; fi


echo "Step 3: Check if the secret was created in new namespace"

kubectl create namespace $NAMESPACE && sleep 5 
kubectl wait --timeout=30s --for='jsonpath={.status.phase}="Active"' Namespace/$NAMESPACE

#wait 120s for secret
kubectl wait --timeout=120s --for='jsonpath={.kind}="Secret"' secret/$SECRET_NAME -n $NAMESPACE

# Timeout of 2 minutes in case we fail
timeout 120s /bin/sh -c "until kubectl get secret $SECRET_NAME -n $NAMESPACE; do sleep 5; done"
if [ $? -eq 0 ]; then echo "$SECRET_NAME succesfully created in $NAMESPACE"; fi

echo "Clean Up"
kubectl delete secret $SECRET_NAME -n $NAMESPACE 
kubectl delete -n kyverno -f /yaml/$POLICY_NAME.yaml
kubectl delete secret $SECRET_NAME -n kyverno
kubectl delete namespace $NAMESPACE --wait=false
echo -e "TEST: ${GRN}PASS${NC}"
