variable "resource_group_name" {
  description = "Name of the resource group where the resources will be deployed"
  type        = string
}

variable "location" {
  description = "Azure region where resources will be located"
  type        = string
}

variable "storage_account_name" {
  description = "Name of the storage account"
  type        = string
  default     = ""
}

variable "storage_account_tier" {
  description = "Tier to use for this storage account. Valid values are : 'Standard' and 'Premium'."
  default     = "Standard"
}
 
variable "registry_name" {
  description = "Name of the container registry."
  type        = string
  default     = ""
}
 
 variable "public_ip_dns_label" {
  description = "Label for the DNS Name. Will be used to make up the FQDN of the public IP."
  type        = string
}

variable "network_tags" {
  description = "network tags to help identify various services."
  type        = map
  default = {
    AppName        = "app-ground-up"
    BusinessUnit   = "Plant Department"
    Classification = "confidential"
    CostCenter     = "000-00000-0000"
    DeployedBy     = "terraform"
    Environment    = "global"
    OwnerEmail     = "DL-P7-OPS@groundup.com"
    Platform       = "na" # does not apply to us.
  }
}

variable "tags" {
  description = "Tags to help identify various services."
  type        = map
  default = {
    AppName        = "app-ground-up"
    BusinessUnit   = "Plant Department"
    Classification = "confidential"
    CostCenter     = "000-00000-0000"
    DeployedBy     = "terraform"
    Environment    = "prod"
    OwnerEmail     = "DL-P7-OPS@groundup.com"
    Platform       = "na" # does not apply to us.
  }
}