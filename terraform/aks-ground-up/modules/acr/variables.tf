variable "registry_name" {
  description = "Name of the container registry."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group where the container registry belongs"
  type        = string
}

variable "location" {
  description = "Azure region where the container registry will be located"
  type        = string
}

variable "registry_sku" {
  description = "SKU name of the container registry. Valid values are : 'Standard' and 'Premium'."
  default     = "Standard"
}

variable "admin_user_enabled" {
  description = " Whether the admin user should be enabled."
  default     = false
}
 
variable "tags" {
  description = "Tags to help identify various services."
  type        = map
  default = {}
}
