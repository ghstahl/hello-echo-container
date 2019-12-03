resource "azurerm_role_assignment" "main" {
  scope                = var.resource_group_id
  role_definition_name = "Contributor"
  principal_id         = var.principal_id
}