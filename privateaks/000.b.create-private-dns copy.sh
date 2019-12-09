# https://clemenssiebler.com/deploying-internal-applications-with-private-ips-on-azure-kubernetes-service-aks/
RESOURCE_GROUP_NAME="rg-privateaks"
LOCATION="eastus2"
VNET_NAME="vnet-aks"
SUBNET_NAME="snet-aks"
DNS_NAME="privateaks.com"
LINK_NAME="link-vnet-aks"

az network private-dns zone create -g $RESOURCE_GROUP_NAME -n $DNS_NAME
az network private-dns link vnet create -g $RESOURCE_GROUP_NAME -n $LINK_NAME -z $DNS_NAME -v $VNET_NAME --registration-enabled false


