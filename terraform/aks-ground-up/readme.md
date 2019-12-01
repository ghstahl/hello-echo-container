# Terraform Setup
[azure terraform-backend] (https://docs.microsoft.com/en-us/azure/terraform/terraform-backend)  

Call setup-azure-terraform.sh once to setup a backend storage account for your tstate.
The access_key to the storage account will be put into a key vault which you can then get by calling this;

 
```bash
export ARM_ACCESS_KEY=$(az keyvault secret show --name terraform-backend-key --vault-name kvterraform7335 --query value -o tsv)   
```

You can't call  
```bash
terraform init 
```
until ARM_ACCESS_KEY exists as an ENV variable.


```bash
export TF_VAR_client_secret=***REDACTED***
export TF_VAR_client_id=***REDACTED***
export TF_VAR_tenant_id=***REDACTED***
export TF_VAR_subscription_id=***REDACTED***

```



