###############ResourceGroup##################################
resource "azurerm_resource_group" "rg" {
  provider = azurerm.nonprddevsubscription
  name     = var.rgname
  location = var.rglocation

  tags = var.tags
}


###############StorageAccount ##################################

resource "azurerm_storage_account" "sw" {
  depends_on                      = [azurerm_resource_group.rg]
  name                            = var.storageacc_name
  resource_group_name             = azurerm_resource_group.rg.name
  location                        = var.rglocation
  account_tier                    = "Standard"
  account_replication_type        = "LRS"
  account_kind                    = "StorageV2"
  https_traffic_only_enabled      = "true"
  allow_nested_items_to_be_public = "false"
  public_network_access_enabled   = true
  blob_properties {
    delete_retention_policy {
      days = "90"
    }
    container_delete_retention_policy {
      days = "90"
    }
  }

  tags = var.tags
}

#################Staticweb-app #####################################
resource "azurerm_storage_account_static_website" "sw" {
  storage_account_id = azurerm_storage_account.stw.id
  error_404_document = "R3.8 Gore Prism Data Models Dictionary.html"
  index_document     = "index.html"
}

resource "azurerm_storage_account_network_rules" "sw" {
  storage_account_id = azurerm_storage_account.stw.id
  default_action     = "Deny"
  ip_rules           = ["216.16.250.162", "99.209.20.226", "72.138.121.66"]
  virtual_network_subnet_ids = [
    data.azurerm_subnet.exisitng_subnet.id
  ]
  bypass = ["AzureServices"]
}