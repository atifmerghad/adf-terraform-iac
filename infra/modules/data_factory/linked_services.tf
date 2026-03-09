# Linked Service - Azure Blob Storage (source for file data)
resource "azurerm_data_factory_linked_service_azure_blob_storage" "blob" {
  name              = "ls_azure_blob_storage"
  data_factory_id   = azurerm_data_factory.adf.id
  connection_string = var.storage_connection_string
}

# Linked Service - Azure SQL Database (destination for data)
resource "azurerm_data_factory_linked_service_azure_sql_database" "sql" {
  name              = "ls_azure_sql_database"
  data_factory_id   = azurerm_data_factory.adf.id
  connection_string = "Server=tcp:${var.sql_server_fqdn},1433;Database=${var.sql_database_name};User ID=${var.sql_admin_username};Password=${var.sql_admin_password};Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
}
