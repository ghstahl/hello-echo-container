# https://clemenssiebler.com/deploying-internal-applications-with-private-ips-on-azure-kubernetes-service-aks/
RESOURCE_GROUP_NAME="privateaks2"
LOCATION="eastus2"
VNET_NAME="aksvnet"
SUBNET_NAME="akscluster"

az aks install-cli

az group create --name $RESOURCE_GROUP_NAME --location $LOCATION
az network vnet create \
--resource-group $RESOURCE_GROUP_NAME \
--name $VNET_NAME \
--address-prefix 10.10.0.0/16 \
--subnet-name $SUBNET_NAME \
--subnet-prefix 10.10.0.0/24

