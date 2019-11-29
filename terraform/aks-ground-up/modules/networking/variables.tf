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