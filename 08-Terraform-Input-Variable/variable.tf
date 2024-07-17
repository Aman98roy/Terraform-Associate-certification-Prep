# Input Variable
variable "business_unit" {
  description = "Business Unit"
  type        = string
  default     = "HR"
}

variable "environment" {
  description = "environment"
  type        = string
  default     = "dev"

}

variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
  default     = "myrg"

}

variable "resource_group_location" {
  description = "Resource Group Location"
  type        = string
  default     = "EAST US"
}

variable "virtual_network_location" {
  description = "Virtual Network Location"
  type        = string
  default     = "myvnet"
}
