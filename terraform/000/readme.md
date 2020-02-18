# Terraform Setup
[azure terraform-backend](https://docs.microsoft.com/en-us/azure/terraform/terraform-backend)  

Call setup-azure-terraform.sh once to setup a backend storage account for your tstate.
The access_key to the storage account will be put into a key vault which you can then get by calling this;

```bash
export ARM_ACCESS_KEY=$(az keyvault secret show --name terraform-backend-key --vault-name kvterraform29701 --query value -o tsv)   
```

You can't call  
```bash
terraform init 
```
until ARM_ACCESS_KEY exists as an ENV variable.






