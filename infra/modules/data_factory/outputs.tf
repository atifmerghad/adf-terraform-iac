output "data_factory_id" {
  value = azurerm_data_factory.adf.id
}

output "data_factory_name" {
  value = azurerm_data_factory.adf.name
}

output "linked_service_blob_name" {
  value = azurerm_data_factory_linked_service_azure_blob_storage.blob.name
}

output "linked_service_sql_name" {
  value = azurerm_data_factory_linked_service_azure_sql_database.sql.name
}

output "integration_runtime_name" {
  value = azurerm_data_factory_integration_runtime_azure.ir.name
}
