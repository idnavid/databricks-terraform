# Create the Resource Group
resource "azurerm_resource_group" "this" {
  name     = "dbx-dev-au-rg"
  location = var.location

  tags = {
    application = var.app_name
    environment = var.environment
  }
}

# Create the Databricks Workspace
resource "azurerm_databricks_workspace" "this" {
  name                        = "dbx-dev-au-workspace"
  resource_group_name         = azurerm_resource_group.this.name
  location                    = azurerm_resource_group.this.location
  sku                         = "trial"
  managed_resource_group_name = "dbx-dev-au-workspace-rg"

  tags = {
    application = var.app_name
    environment = var.environment
  }
}

