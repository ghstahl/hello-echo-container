# https://clemenssiebler.com/deploying-internal-applications-with-private-ips-on-azure-kubernetes-service-aks/
RESOURCE_GROUP_NAME="rg-privateaks"
LOCATION="eastus2"
VNET_NAME="vnet-aks"
SUBNET_NAME="snet-aks"
K8SVERSION="1.14.8"
CLUSTERNAME="aks-private-cluster"
DNS_NAME_PREFIX="aks-private-cluster"
az aks create   --name $CLUSTERNAME  \
                --resource-group $RESOURCE_GROUP_NAME \
                --kubernetes-version $K8SVERSION \
                --service-principal $TF_VAR_client_id \
                --client-secret $TF_VAR_client_secret \
                --generate-ssh-keys -l $LOCATION \
                --location $LOCATION \
                --node-count 1 \
                --vnet-subnet-id "/subscriptions/39ac48fb-fea0-486a-ba84-e0ae9b06c663/resourceGroups/rg-privateaks/providers/Microsoft.Network/virtualNetworks/vnet-aks/subnets/snet-aks" \
                --dns-name-prefix $DNS_NAME_PREFIX
                --vm-set-type VirtualMachineScaleSets \
                --load-balancer-sku standard \
                --enable-cluster-autoscaler \
                --min-count 1 \
                --max-count 3 \
                --enable-addons monitoring \
                --no-wait
