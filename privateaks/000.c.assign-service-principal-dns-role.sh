# https://clemenssiebler.com/deploying-internal-applications-with-private-ips-on-azure-kubernetes-service-aks/
# https://github.com/kubernetes-sigs/external-dns/blob/master/docs/tutorials/azure-private-dns.md

RESOURCE_GROUP_NAME="rg-privateaks"
LOCATION="eastus2"
VNET_NAME="vnet-aks"
SUBNET_NAME="snet-aks"
DNS_NAME="privateaks.com"
LINK_NAME="link-vnet-aks"
 

RG_ID="$(az group show --name $RESOURCE_GROUP_NAME --query id -o tsv)"
DNS_ID="$(az network private-dns zone show --name $DNS_NAME -g $RESOURCE_GROUP_NAME --query id -o tsv)"
echo $RG_ID
echo $DNS_ID

# 1. as a reader to the resource group
az role assignment create --role "Reader" --assignee $TF_VAR_client_id --scope $RG_ID  
# 2. as a contributor to DNS Zone itself
az role assignment create --role "Contributor" --assignee $TF_VAR_client_id --scope $DNS_ID