variable "data_factory_name" {}
variable "location" {}
variable "resource_group_name" {}

# Linked services
variable "storage_connection_string" {
  type      = string
  sensitive = true
}
variable "sql_server_fqdn" { type = string }
variable "sql_database_name" { type = string }
variable "sql_admin_username" { type = string }
variable "sql_admin_password" {
  type      = string
  sensitive = true
}