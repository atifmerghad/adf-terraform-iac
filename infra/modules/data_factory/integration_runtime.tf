# Azure Integration Runtime - used for data movement (blob to SQL)
resource "azurerm_data_factory_integration_runtime_azure" "ir" {
  name            = "AzureIntegrationRuntime"
  data_factory_id = azurerm_data_factory.adf.id
  location        = var.location
}
