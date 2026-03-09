module "resource_group" {
  source   = "./modules/resource_group"
  name     = var.resource_group_name
  location = var.location
}

module "storage_account" {
  source               = "./modules/storage_account"
  storage_account_name = var.storage_account_name
  location             = var.location
  resource_group_name  = module.resource_group.name
}

module "storage_container" {
  source               = "./modules/storage_container"
  container_name       = var.container_name
  storage_account_name = module.storage_account.storage_account_name
}

module "data_factory" {
  source                    = "./modules/data_factory"
  data_factory_name         = var.data_factory_name
  location                  = var.location
  resource_group_name       = module.resource_group.name
  storage_connection_string = module.storage_account.primary_connection_string
  sql_server_fqdn           = module.sql_database.sql_server_fqdn
  sql_database_name         = module.sql_database.sql_database_name
  sql_admin_username        = var.sql_admin_username
  sql_admin_password        = var.sql_admin_password
}

module "sql_database" {
  source              = "./modules/sql_database"
  sql_server_name     = var.sql_server_name
  sql_database_name   = var.sql_database_name
  resource_group_name = module.resource_group.name
  location            = var.location
  admin_username      = var.sql_admin_username
  admin_password      = var.sql_admin_password
  max_size_gb         = 2
}