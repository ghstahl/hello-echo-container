# 000 Create Network
```bash
./000.create-rg-vnet.sh
```
```json
{
  "id": "/subscriptions/39ac48fb-fea0-486a-ba84-e0ae9b06c663/resourceGroups/rg-privateaks",
  "location": "eastus2",
  "managedBy": null,
  "name": "rg-privateaks",
  "properties": {
    "provisioningState": "Succeeded"
  },
  "tags": null,
  "type": "Microsoft.Resources/resourceGroups"
}
{
  "newVNet": {
    "addressSpace": {
      "addressPrefixes": [
        "10.10.0.0/16"
      ]
    },
    "bgpCommunities": null,
    "ddosProtectionPlan": null,
    "dhcpOptions": {
      "dnsServers": []
    },
    "enableDdosProtection": false,
    "enableVmProtection": false,
    "etag": "W/\"aa872c76-58f9-426f-a1a0-6db5162c023c\"",
    "id": "/subscriptions/39ac48fb-fea0-486a-ba84-e0ae9b06c663/resourceGroups/rg-privateaks/providers/Microsoft.Network/virtualNetworks/vnet-aks",
    "location": "eastus2",
    "name": "vnet-aks",
    "provisioningState": "Succeeded",
    "resourceGroup": "rg-privateaks",
    "resourceGuid": "ef23391a-2890-4a66-ba08-f9e2fe79b78d",
    "subnets": [
      {
        "addressPrefix": "10.10.0.0/23",
        "addressPrefixes": null,
        "delegations": [],
        "etag": "W/\"aa872c76-58f9-426f-a1a0-6db5162c023c\"",
        "id": "/subscriptions/39ac48fb-fea0-486a-ba84-e0ae9b06c663/resourceGroups/rg-privateaks/providers/Microsoft.Network/virtualNetworks/vnet-aks/subnets/snet-aks",
        "ipConfigurationProfiles": null,
        "ipConfigurations": null,
        "name": "snet-aks",
        "natGateway": null,
        "networkSecurityGroup": null,
        "privateEndpointNetworkPolicies": "Enabled",
        "privateEndpoints": null,
        "privateLinkServiceNetworkPolicies": "Enabled",
        "provisioningState": "Succeeded",
        "purpose": null,
        "resourceGroup": "rg-privateaks",
        "resourceNavigationLinks": null,
        "routeTable": null,
        "serviceAssociationLinks": null,
        "serviceEndpointPolicies": null,
        "serviceEndpoints": null,
        "type": "Microsoft.Network/virtualNetworks/subnets"
      }
    ],
    "tags": {},
    "type": "Microsoft.Network/virtualNetworks",
    "virtualNetworkPeerings": []
  }
}

```

# 001 Create AKS Cluster
```bash
./001.create-aks.sh


```
1. Creates AKS cluster **aks-private-cluster** in the **rg-privateaks** resource group
2. Creates a separate **mc_rg-privateaks_aks-private-cluster_eastus2** resource group for AKS stuff

```json
{
  "aadProfile": null,
  "addonProfiles": null,
  "agentPoolProfiles": [
    {
      "availabilityZones": null,
      "count": 1,
      "enableAutoScaling": null,
      "enableNodePublicIp": null,
      "maxCount": null,
      "maxPods": 110,
      "minCount": null,
      "name": "nodepool1",
      "nodeTaints": null,
      "orchestratorVersion": "1.14.8",
      "osDiskSizeGb": 100,
      "osType": "Linux",
      "provisioningState": "Succeeded",
      "scaleSetEvictionPolicy": null,
      "scaleSetPriority": null,
      "type": "VirtualMachineScaleSets",
      "vmSize": "Standard_DS2_v2",
      "vnetSubnetId": "/subscriptions/39ac48fb-fea0-486a-ba84-e0ae9b06c663/resourceGroups/rg-privateaks/providers/Microsoft.Network/virtualNetworks/vnet-aks/subnets/snet-aks"
    }
  ],
  "apiServerAccessProfile": null,
  "dnsPrefix": "aks-private-cluster",
  "enablePodSecurityPolicy": null,
  "enableRbac": true,
  "fqdn": "aks-private-cluster-a0c269d0.hcp.eastus2.azmk8s.io",
  "id": "/subscriptions/39ac48fb-fea0-486a-ba84-e0ae9b06c663/resourcegroups/rg-privateaks/providers/Microsoft.ContainerService/managedClusters/aks-private-cluster",
  "identity": null,
  "kubernetesVersion": "1.14.8",
  "linuxProfile": {
    "adminUsername": "azureuser",
    "ssh": {
      "publicKeys": [
        {
          "keyData": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDOw40MJyuo/ZvYVg3Nfm5UDSli+/NR1RHLY94EykvblEAoCdyvrVE0fav4Huk9/psLZm9tanlnJHazF/Fe2IOvBJxwjdW0jaOFewI7sODUC2j0rQ5zWOtaqYiIEa6z9KvzmKzjEOY5PMTcNsLK7FP1kpKLe9JrnV864JS8Unj/vFAvg2xWmMIGSONyk/4Z5NFK3LegLJyfRJdI62TyWqxJQTpKGl9SC4ODnrFO17ya15/mnHM82oMDUMdrDENedv76yuyTyywy140vQmy+1jKTJzYGnyE5sVePLyiVqD0nYDBWdDZaRhumr/xmib8UpwLIhIkOAnGX1LEr0sRaAvzb"
        }
      ]
    }
  },
  "location": "eastus2",
  "maxAgentPools": 8,
  "name": "aks-private-cluster",
  "networkProfile": {
    "dnsServiceIp": "10.0.0.10",
    "dockerBridgeCidr": "172.17.0.1/16",
    "loadBalancerProfile": {
      "effectiveOutboundIps": [
        {
          "id": "/subscriptions/39ac48fb-fea0-486a-ba84-e0ae9b06c663/resourceGroups/MC_rg-privateaks_aks-private-cluster_eastus2/providers/Microsoft.Network/publicIPAddresses/814131b2-8aa1-4398-953b-f1e9e67835f5",
          "resourceGroup": "MC_rg-privateaks_aks-private-cluster_eastus2"
        }
      ],
      "managedOutboundIps": {
        "count": 1
      },
      "outboundIpPrefixes": null,
      "outboundIps": null
    },
    "loadBalancerSku": "Standard",
    "networkPlugin": "kubenet",
    "networkPolicy": null,
    "podCidr": "10.244.0.0/16",
    "serviceCidr": "10.0.0.0/16"
  },
  "nodeResourceGroup": "MC_rg-privateaks_aks-private-cluster_eastus2",
  "provisioningState": "Succeeded",
  "resourceGroup": "rg-privateaks",
  "servicePrincipalProfile": {
    "clientId": "f01d863a-8282-4980-be0d-50fd8404bdb0",
    "secret": null
  },
  "tags": null,
  "type": "Microsoft.ContainerService/ManagedClusters",
  "windowsProfile": null
}

```

If you want to see everything that was created.
```bash
az group deployment list --resource-group MC_rg-privateaks_aks-private-cluster_eastus2

1. Public IP Address
2. Network security Group for the agents
3. Route Table, for the agents
4. Virtual machine scale set (VMSS), for the nodes
5. Load Balancer, public of course

```

# 002 KUBECTL Creds
```bash
./002.credentials-aks.sh

```
```
/home/ghstahl/.kube/config has permissions "777".
It should be readable and writable only by its owner.
Merged "aks-private-cluster" as current context in /home/ghstahl/.kube/config
NAME                                STATUS   ROLES   AGE   VERSION
aks-nodepool1-37779045-vmss000000   Ready    agent   12m   v1.14.8
Kubernetes master is running at https://aks-private-cluster-a0c269d0.hcp.eastus2.azmk8s.io:443
CoreDNS is running at https://aks-private-cluster-a0c269d0.hcp.eastus2.azmk8s.io:443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy
kubernetes-dashboard is running at https://aks-private-cluster-a0c269d0.hcp.eastus2.azmk8s.io:443/api/v1/namespaces/kube-system/services/kubernetes-dashboard/proxy
Metrics-server is running at https://aks-private-cluster-a0c269d0.hcp.eastus2.azmk8s.io:443/api/v1/namespaces/kube-system/services/https:metrics-server:/proxy

To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.
```

# 003 Deploy App w/ service
```bash
./003.deploy.sh
```
```
deployment.apps/azure-vote-back created
service/azure-vote-back created
deployment.apps/azure-vote-front created
```

**NOTE**: no new resources were added to azure, just kubernetes

# 004 Get Service
```bash
./004.get-service.sh
```
```
NAME              TYPE        CLUSTER-IP    EXTERNAL-IP   PORT(S)    AGE
azure-vote-back   ClusterIP   10.0.155.15   <none>        6379/TCP   2m4s
kubernetes        ClusterIP   10.0.0.1      <none>        443/TCP    21m
Name:              azure-vote-back
Namespace:         default
Labels:            <none>
Annotations:       kubectl.kubernetes.io/last-applied-configuration:
                     {"apiVersion":"v1","kind":"Service","metadata":{"annotations":{},"name":"azure-vote-back","namespace":"default"},"spec":{"ports":[{"port":...
Selector:          app=azure-vote-back
Type:              ClusterIP
IP:                10.0.155.15
Port:              <unset>  6379/TCP
TargetPort:        6379/TCP
Endpoints:         10.244.0.8:6379
Session Affinity:  None
Events:            <none>


Name:              kubernetes
Namespace:         default
Labels:            component=apiserver
                   provider=kubernetes
Annotations:       <none>
Selector:          <none>
Type:              ClusterIP
IP:                10.0.0.1
Port:              https  443/TCP
TargetPort:        443/TCP
Endpoints:         40.65.235.164:443
Session Affinity:  None
Events:            <none>
NAME              TYPE        CLUSTER-IP    EXTERNAL-IP   PORT(S)    AGE
azure-vote-back   ClusterIP   10.0.155.15   <none>        6379/TCP   2m5s
kubernetes        ClusterIP   10.0.0.1      <none>        443/TCP    21m
```

# 005 Deploy internal load balancer
```bash
./005.deploy-internal-loadbalancer.sh
```
```
service/azure-vote-front created
```
# 004 Get Service
```bash
./004.get-service.sh
```
```
NAME               TYPE           CLUSTER-IP     EXTERNAL-IP   PORT(S)        AGE
azure-vote-back    ClusterIP      10.0.155.15    <none>        6379/TCP       4m5s
azure-vote-front   LoadBalancer   10.0.125.108   10.10.0.5     80:30823/TCP   44s
kubernetes         ClusterIP      10.0.0.1       <none>        443/TCP        23m
Name:              azure-vote-back
Namespace:         default
Labels:            <none>
Annotations:       kubectl.kubernetes.io/last-applied-configuration:
                     {"apiVersion":"v1","kind":"Service","metadata":{"annotations":{},"name":"azure-vote-back","namespace":"default"},"spec":{"ports":[{"port":...
Selector:          app=azure-vote-back
Type:              ClusterIP
IP:                10.0.155.15
Port:              <unset>  6379/TCP
TargetPort:        6379/TCP
Endpoints:         10.244.0.8:6379
Session Affinity:  None
Events:            <none>


Name:                     azure-vote-front
Namespace:                default
Labels:                   <none>
Annotations:              kubectl.kubernetes.io/last-applied-configuration:
                            {"apiVersion":"v1","kind":"Service","metadata":{"annotations":{"service.beta.kubernetes.io/azure-load-balancer-internal":"true"},"name":"a...
                          service.beta.kubernetes.io/azure-load-balancer-internal: true
Selector:                 app=azure-vote-front
Type:                     LoadBalancer
IP:                       10.0.125.108
LoadBalancer Ingress:     10.10.0.5
Port:                     <unset>  80/TCP
TargetPort:               80/TCP
NodePort:                 <unset>  30823/TCP
Endpoints:                10.244.0.9:80
Session Affinity:         None
External Traffic Policy:  Cluster
Events:
  Type    Reason                Age   From                Message
  ----    ------                ----  ----                -------
  Normal  EnsuringLoadBalancer  46s   service-controller  Ensuring load balancer
  Normal  EnsuredLoadBalancer   15s   service-controller  Ensured load balancer


Name:              kubernetes
Namespace:         default
Labels:            component=apiserver
                   provider=kubernetes
Annotations:       <none>
Selector:          <none>
Type:              ClusterIP
IP:                10.0.0.1
Port:              https  443/TCP
TargetPort:        443/TCP
Endpoints:         40.65.235.164:443
Session Affinity:  None
Events:            <none>
NAME               TYPE           CLUSTER-IP     EXTERNAL-IP   PORT(S)        AGE
azure-vote-back    ClusterIP      10.0.155.15    <none>        6379/TCP       4m7s
azure-vote-front   LoadBalancer   10.0.125.108   10.10.0.5     80:30823/TCP   46s
kubernetes         ClusterIP      10.0.0.1       <none>        443/TCP        23m
```
We have exposed the service which can only be reached if you are on the subnet 10.10.*.*
i.e. http://10.10.0.5

**NOTE** a brand new **kubernetes-internal Load Balancer** was created in the **mc_rg-privateaks_aks-private-cluster_eastus2** resource group, which is pointing to the private ip address 10.10.0.5

# 006 Create a public Load Balancer

```bash
 ./006.deploy-public-loadbalancer.sh   
```
```
service/azure-vote-front-external created
```
**NOTE** a brand new **Public IP Address** was created in the **mc_rg-privateaks_aks-private-cluster_eastus2** resource group called **kubernetes-a28eb605116a511ea9760f67924cc1c8**.  It is not the same IP as the one that came with the initial create of AKS.  So now we have 2.

Going to this new one: http://40.65.237.178/, we get to see the voting app.

# 004 Get Service
```bash
./004.get-service.sh
```
```NAME                        TYPE           CLUSTER-IP     EXTERNAL-IP     PORT(S)        AGE
azure-vote-back             ClusterIP      10.0.155.15    <none>          6379/TCP       11m
azure-vote-front            LoadBalancer   10.0.125.108   10.10.0.5       80:30823/TCP   7m51s
azure-vote-front-external   LoadBalancer   10.0.247.26    40.65.237.178   80:30401/TCP   2m27s
kubernetes                  ClusterIP      10.0.0.1       <none>          443/TCP        30m
Name:              azure-vote-back
Namespace:         default
Labels:            <none>
Annotations:       kubectl.kubernetes.io/last-applied-configuration:
                     {"apiVersion":"v1","kind":"Service","metadata":{"annotations":{},"name":"azure-vote-back","namespace":"default"},"spec":{"ports":[{"port":...
Selector:          app=azure-vote-back
Type:              ClusterIP
IP:                10.0.155.15
Port:              <unset>  6379/TCP
TargetPort:        6379/TCP
Endpoints:         10.244.0.8:6379
Session Affinity:  None
Events:            <none>


Name:                     azure-vote-front
Namespace:                default
Labels:                   <none>
Annotations:              kubectl.kubernetes.io/last-applied-configuration:
                            {"apiVersion":"v1","kind":"Service","metadata":{"annotations":{"service.beta.kubernetes.io/azure-load-balancer-internal":"true"},"name":"a...
                          service.beta.kubernetes.io/azure-load-balancer-internal: true
Selector:                 app=azure-vote-front
Type:                     LoadBalancer
IP:                       10.0.125.108
LoadBalancer Ingress:     10.10.0.5
Port:                     <unset>  80/TCP
TargetPort:               80/TCP
NodePort:                 <unset>  30823/TCP
Endpoints:                10.244.0.9:80
Session Affinity:         None
External Traffic Policy:  Cluster
Events:
  Type    Reason                Age    From                Message
  ----    ------                ----   ----                -------
  Normal  EnsuringLoadBalancer  7m53s  service-controller  Ensuring load balancer
  Normal  EnsuredLoadBalancer   7m22s  service-controller  Ensured load balancer


Name:                     azure-vote-front-external
Namespace:                default
Labels:                   <none>
Annotations:              kubectl.kubernetes.io/last-applied-configuration:
                            {"apiVersion":"v1","kind":"Service","metadata":{"annotations":{"service.beta.kubernetes.io/azure-load-balancer-internal":"false"},"name":"...
                          service.beta.kubernetes.io/azure-load-balancer-internal: false
Selector:                 app=azure-vote-front
Type:                     LoadBalancer
IP:                       10.0.247.26
LoadBalancer Ingress:     40.65.237.178
Port:                     <unset>  80/TCP
TargetPort:               80/TCP
NodePort:                 <unset>  30401/TCP
Endpoints:                10.244.0.9:80
Session Affinity:         None
External Traffic Policy:  Cluster
Events:
  Type    Reason                Age    From                Message
  ----    ------                ----   ----                -------
  Normal  EnsuringLoadBalancer  2m29s  service-controller  Ensuring load balancer
  Normal  EnsuredLoadBalancer   2m26s  service-controller  Ensured load balancer


Name:              kubernetes
Namespace:         default
Labels:            component=apiserver
                   provider=kubernetes
Annotations:       <none>
Selector:          <none>
Type:              ClusterIP
IP:                10.0.0.1
Port:              https  443/TCP
TargetPort:        443/TCP
Endpoints:         40.65.235.164:443
Session Affinity:  None
Events:            <none>
NAME                        TYPE           CLUSTER-IP     EXTERNAL-IP     PORT(S)        AGE
azure-vote-back             ClusterIP      10.0.155.15    <none>          6379/TCP       11m
azure-vote-front            LoadBalancer   10.0.125.108   10.10.0.5       80:30823/TCP   7m53s
azure-vote-front-external   LoadBalancer   10.0.247.26    40.65.237.178   80:30401/TCP   2m29s
kubernetes                  ClusterIP      10.0.0.1       <none>          443/TCP        30m

```