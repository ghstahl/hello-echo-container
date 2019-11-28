#!/bin/bash
# declare STRING variable
STRING="== AZ LOGIN =="
#print variable on a screen
echo $STRING

az login
# View subscriptions
az account list

# Verify selected subscription
az account show

# Set correct subscription (if needed)
az account set --subscription 39ac48fb-fea0-486a-ba84-e0ae9b06c663

# Verify correct subscription is now set
az account show

az aks list -o table

az aks get-credentials -n private-aksherb6297 -g privateaks

kubectl get nodes

./reg-acr.sh privateaks private-aksherb6297 aks-rg-herb6297 acrhackfestherb6297
