variable "resource_group_name" {
  description = "Name of the resource group where the public IP resource belongs"
  type        = string
}

variable "location" {
  description = "Azure region where the public IP resource will be located"
  type        = string
}

variable "nsg_name" {
  description = "Name of the network security group"
  type        = string
}

variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
}
variable "subnet_name" {
  description = "Name of the virtual network subnet"
  type        = string
}
variable "public_ip_name" {
  description = "Name of the public IP resource"
}
variable "public_ip_allocation_method" {
  description = "Allocation method for public IP address. Valid values are : 'Static' or 'Dynamic'."
  type        = string
  default     = "Dynamic"
}

variable "public_ip_dns_label" {
  description = "Label for the DNS Name. Will be used to make up the FQDN of the public IP."
  type        = string
}

variable "base_address_space_ip" {
  description = "The IP base i.e.  10.0.0.0 to be then carved up into subnets..."
  type        = string
}

variable "tags" {
  description = "Tags to help identify various services."
  type        = map
  default = {}
}
