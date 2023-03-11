provider "azurerm" {
  features {}

  client_id       =  var.appId
  client_secret   =  var.password
  tenant_id       =  var.tenantId
  subscription_id =  var.subscriptionId
}