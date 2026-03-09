output "storage_account_name" {
  value = module.storage_account.storage_account_name
}

output "container_name" {
  value = module.storage_container.container_name
}

output "data_factory_name" {
  value = module.data_factory.data_factory_name
}

output "sql_database_name" {
  value = module.sql_database.sql_database_name
}

output "linked_service_blob_name" {
  value = module.data_factory.linked_service_blob_name
}

output "linked_service_sql_name" {
  value = module.data_factory.linked_service_sql_name
}

output "integration_runtime_name" {
  value = module.data_factory.integration_runtime_name
}