# Secrets

export TF_VAR_subscription_id=***Redacted***
export TF_VAR_client_secret=***Redacted***
export TF_VAR_client_id=***Redacted***
export TF_VAR_tenant_id=***Redacted***
export ARM_ACCESS_KEY=$(az keyvault secret show --name terraform-backend-key --vault-name kvterraform7335 --query value -o tsv) 
