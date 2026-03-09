variable "location" {
  default     = "East US"
  description = "Azure region (use East US, North Europe, or West US 2 if West Europe has provisioning restrictions)"
}

variable "resource_group_name" {
  default = "rg-adf-demo"
}

variable "storage_account_name" {
  default = "adfdemostorage98765"
}

variable "container_name" {
  default = "adf-container"
}

variable "data_factory_name" {
  default = "adf-demo-terraform"
}

variable "sql_server_name" {
  default = "adf-demo-sql-server-tifo"
}

variable "sql_database_name" {
  default = "adf-demo-sql-db"
}

variable "sql_admin_username" {
  default = "sqladmin"
}

variable "sql_admin_password" {
  description = "SQL admin password"
  type        = string
}