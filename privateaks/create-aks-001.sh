# https://clemenssiebler.com/deploying-internal-applications-with-private-ips-on-azure-kubernetes-service-aks/
RESOURCE_GROUP_NAME="privateaks2"
LOCATION="eastus2"
VNET_NAME="aksvnet"
SUBNET_NAME="akscluster"
AKS_NAME="private-aks-cluster"
DNS_NAME_PREFIX="private-aks-cluster-22w34"
az aks create --name $AKS_NAME \
              --resource-group $RESOURCE_GROUP_NAME \
              --location $LOCATION \
              --node-count 1 \
              --vnet-subnet-id "/subscriptions/39ac48fb-fea0-486a-ba84-e0ae9b06c663/resourceGroups/privateaks2/providers/Microsoft.Network/virtualNetworks/aksvnet/subnets/akscluster" \
              --dns-name-prefix $DNS_NAME_PREFIX
