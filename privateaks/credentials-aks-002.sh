# https://clemenssiebler.com/deploying-internal-applications-with-private-ips-on-azure-kubernetes-service-aks/
RESOURCE_GROUP_NAME="privateaks2"
AKS_NAME="private-aks-cluster"

az aks get-credentials --resource-group $RESOURCE_GROUP_NAME --name $AKS_NAME


