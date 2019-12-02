variable "name" {
  description = "Name of the kubernetes cluster"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group where the storage account belongs"
  type        = string
}

variable "location" {
  description = "Azure region where the storage account will be located"
  type        = string
}
variable "subnet_id" {
  description = "The subnet id"
  type        = string
}

variable "dns_prefix" {
  description = "The dns prefix"
  type        = string
}

variable "client_id" {
  description = "The service principal client id"
  type        = string
}
variable "client_secret" {
  description = "The service principal client secret"
  type        = string
}
variable "tags" {
  description = "Tags to help identify various services."
  type        = map
  default = {}
}
variable "public_ssh_key_path" {
  description = "The Path at which your Public SSH Key is located. Defaults to ~/.ssh/id_rsa.pub"
  default     = "~/.ssh/id_rsa.pub"
}

 
 