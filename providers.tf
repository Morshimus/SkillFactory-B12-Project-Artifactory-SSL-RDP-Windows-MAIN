provider "azurerm" {
  features {}

  client_id       =  local.azure_auth.appId
  client_secret   =  local.azure_auth.password
  tenant_id       =  local.azure_auth.tenantId
  subscription_id =  local.azure_auth.subscriptionId
}

provider "ansiblevault" {
  vault_path  = "${local.loc_path}.vault_pass_B12"
  root_folder = local.loc_path
}