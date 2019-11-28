variable "az_resource_group_name" {
  description = "(Required) The name of the resource group where the VM will be created."
  type        = string
}

variable "az_resource_group_location" {
  description = "(Required) The location where the resource group will reside."
  type        = string
}

variable "tags" {
  description = "Tags to help identify various services. See https://confluence.ges.symantec.com/display/NSROE/NSROE+Cloud+Tagging+Standard for requirements."
  type        = map
  default = {
    AppName        = "p7"
    BusinessUnit   = "Plant Department"
    Classification = "p7-confidential"
    CostCenter     = "100-32555-0000"
    DeployedBy     = "terraform"
    Environment    = "prod"
    OwnerEmail     = "DL-P7-OPS@p7.com"
    Platform       = "na" # does not apply to us.
  }
}