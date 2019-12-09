# https://clemenssiebler.com/deploying-internal-applications-with-private-ips-on-azure-kubernetes-service-aks/
RESOURCE_GROUP_NAME="rg-privateaks"
LOCATION="eastus2"
VNET_NAME="vnet-aks"
SUBNET_NAME="snet-aks"

az aks install-cli

az group create --name $RESOURCE_GROUP_NAME --location $LOCATION

az network vnet create \
    --resource-group $RESOURCE_GROUP_NAME \
    --name $VNET_NAME \
    --address-prefix 10.10.0.0/16 \
    --subnet-name $SUBNET_NAME \
    --subnet-prefix 10.10.0.0/23

