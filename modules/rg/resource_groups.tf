locals {
  rg_settings = var.all_rg_settings != null ? {
    for rg_key, rg_value in var.all_rg_settings : 
    rg_key => {
      name     = rg_value.name
      location = rg_value.location
    }
  } : {}
}


resource "azurerm_resource_group" "rg" {
  for_each = local.rg_settings

  name     = each.value.name
  location = each.value.location
}
