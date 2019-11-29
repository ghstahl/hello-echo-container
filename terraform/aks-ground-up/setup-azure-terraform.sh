#!/bin/bash
# https://docs.microsoft.com/en-us/azure/terraform/terraform-backend 
# https://docs.microsoft.com/en-us/azure/key-vault/quick-create-cli

random_value=$RANDOM
RESOURCE_GROUP_NAME=$1
STORAGE_ACCOUNT_NAME=stterraformtstate$random_value
TERRAFORM_KEYVAULT_NAME=kvterraform$random_value
CONTAINER_NAME=tstate
LOCATION=$2
 
echo "RESOURCE_GROUP_NAME: $RESOURCE_GROUP_NAME"
echo "STORAGE_ACCOUNT_NAME: $STORAGE_ACCOUNT_NAME"
echo "LOCATION: $LOCATION"
echo "TERRAFORM_KEYVAULT_NAME: $TERRAFORM_KEYVAULT_NAME"
 

# Create resource group
az group create --name $RESOURCE_GROUP_NAME --location $LOCATION

# Create a key vault
az keyvault create --name $TERRAFORM_KEYVAULT_NAME --resource-group $RESOURCE_GROUP_NAME --location $LOCATION

# Create storage account
az storage account create --resource-group $RESOURCE_GROUP_NAME --name $STORAGE_ACCOUNT_NAME --sku Standard_LRS --encryption-services blob

# Get storage account key
ACCOUNT_KEY=$(az storage account keys list --resource-group $RESOURCE_GROUP_NAME --account-name $STORAGE_ACCOUNT_NAME --query [0].value -o tsv)
# add access key to vault
az keyvault secret set --vault-name $TERRAFORM_KEYVAULT_NAME --name "terraform-backend-key" --value $ACCOUNT_KEY

# Create blob container
az storage container create --name $CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME --account-key $ACCOUNT_KEY



echo "storage_account_name: $STORAGE_ACCOUNT_NAME"
echo "container_name: $CONTAINER_NAME"
echo "access_key: $ACCOUNT_KEY"

export ARM_ACCESS_KEY=$(az keyvault secret show --name terraform-backend-key --vault-name $TERRAFORM_KEYVAULT_NAME --query value -o tsv)
echo "ARM_ACCESS_KEY: $ARM_ACCESS_KEY"