#!/bin/bash
# declare STRING variable
STRING="== Create Namespace =="
#print variable on a screen
echo $STRING

kubectl apply -f ./create-namespaces.yaml
kubectl apply -f ./hello-echo-namespace.yaml
# Look at namespaces
kubectl get ns

# Create namespace quotas
kubectl apply -f ./namespace-limitranges.yaml

# Get list of namespaces and drill into one
kubectl get ns
kubectl describe ns ns-dev

# Create namespace quotas
kubectl apply -f ./namespace-quotas.yaml

# Get list of namespaces and drill into one
kubectl get ns
kubectl describe ns ns-dev

# Test Limits - Forbidden due to assignment of CPU too low
kubectl run nginx-limittest --image=nginx --restart=Never --replicas=1 --port=80 --requests='cpu=100m,memory=256Mi' -n ns-dev

# Test Limits - Pass due to automatic assignment within limits via defaults
kubectl run nginx-limittest --image=nginx --restart=Never --replicas=1 --port=80 -n ns-dev

# Check running pod and dev Namespace Allocations
kubectl get po -n ns-dev
kubectl describe ns ns-dev

# Test Quotas - Forbidden due to memory quota exceeded
kubectl run nginx-quotatest --image=nginx --restart=Never --replicas=1 --port=80 --requests='cpu=500m,memory=1Gi' -n ns-dev

# Test Quotas - Pass due to memory within quota
kubectl run nginx-quotatest --image=nginx --restart=Never --replicas=1 --port=80 --requests='cpu=500m,memory=512Mi' -n ns-dev

# Check running pod and dev Namespace Allocations
kubectl get pods -n ns-dev
kubectl describe ns ns-dev

# Clean up limits, quotas, pods

kubectl delete -f ./namespace-limitranges.yaml
kubectl delete -f ./namespace-quotas.yaml
kubectl delete pods nginx-limittest nginx-quotatest -n ns-dev

# Check running pod and dev Namespace Allocations
kubectl get pods -n ns-dev
kubectl describe ns ns-dev


