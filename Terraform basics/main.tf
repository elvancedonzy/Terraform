# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    #Lifecycle management of Microsoft Azure using the Azure Resource Manager APIs. maintained by the Azure team at Microsoft and the Terraform team at HashiCorp
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
    #Configure infrastructure in Azure Active Directory using the Azure Resource Manager APIs
    azuread = {
      source = "hashicorp/azuread"
      version = "~>1.0"
      #or version ="~>1.0" <If you dont know the version>
     }
     #Supports the use of randomness within Terraform configurations. This is a logical provider, which means that it works entirely within Terraform logic, and does not interact with any other services.
    random = {
      source = "hashicorp/random"
      version = "3.1.0"
     }
  }
}
# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}


# Create a Azure Resource Group
resource "azurerm_resource_group" "elvis-sandbox" {
  name     = "${var.resource_group_name}"
  location = var.location
}
