terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
    #Terraform state storage to Azure storage
    backend "azurerm" {
      resource_group_name ="elvis-sandbox01"
      storage_account_name = "elvistfstorage"
      container_name = "tfstatefile"
      key = "terraform-linux01-vm.tfstate"
      }
}

#Confing the microsoft Provider
provider "azurerm"{
  features {}
}

# Create a Azure Resource Group
resource "azurerm_resource_group" "elvis-sandbox02" {
  name     = var.resource_group_name
  location = var.resource_group_location

  tags = {
    enviroment ="elvis-dev"
  }
}

#Create virtual network
resource "azurerm_virtual_network" "vnet"{
  name = var.virtual_network_name
  address_space = ["10.0.0.0/16"]
  location = azurerm_resource_group.elvis-sandbox02.location
  resource_group_name = azurerm_resource_group.elvis-sandbox02.name

  tags = {
    enviroment = "elvis.dev"
  }
}

#Create subnet
resource "azurerm_subnet" "subnet"{
name = var.subnet_name
resource_group_name = azurerm_resource_group.elvis-sandbox02.name
virtual_network_name = azurerm_virtual_network.vnet.name
address_prefixes = ["10.0.2.0/24"]
}



resource "azurerm_network_interface" "nic" {
  name                = var.network_interface_name
  location            = azurerm_resource_group.elvis-sandbox02.location
  resource_group_name = azurerm_resource_group.elvis-sandbox02.name

  ip_configuration {
    name                          = "elvisipconfig"
    #help
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
  
  }
  tags = {
  enviroment = "elvis-dev"
}
}

#Create Network Security Group and rules
#Maybe optional


resource "azurerm_network_security_group" "nsg"{
name = var.network_security_group_name
location = azurerm_resource_group.elvis-sandbox02.location
resource_group_name = azurerm_resource_group.elvis-sandbox02.name

security_rule {
  name = "SSH"
  priority = "100"
  direction = "Inbound"
  access = "Allow"
  protocol = "TCP"
  source_port_range = "*"
  destination_port_range = "22"
  source_address_prefix = "*"
  destination_address_prefix = "*"
}

security_rule {
  name = "HTTP"
  priority = "101"
  direction = "Inbound"
  access = "Allow"
  protocol = "TCP"
  source_port_range = "*"
  destination_port_range = "443"
  source_address_prefix = "*"
  destination_address_prefix = "*"
}

security_rule {
  name = "RDP"
  priority = "102"
  direction = "Inbound"
  access = "Allow"
  protocol = "TCP"
  source_port_range = "*"
  destination_port_range = "3389"
  source_address_prefix = "*"
  destination_address_prefix = "*"
}

  tags = {
  enviroment = "elvis-dev"
}

}






#Create public IPs
resource "azurerm_public_ip" "public_ip"{
name = var.public_ip_name
location = azurerm_resource_group.elvis-sandbox02.location
resource_group_name = azurerm_resource_group.elvis-sandbox02.name
#what is this?
allocation_method = "Dynamic"

tags = {
  enviroment = "elvis-dev"
}
}



resource "azurerm_linux_virtual_machine" "linuxvm" {
  name                = var.linux_virtual_machine
  location            = azurerm_resource_group.elvis-sandbox02.location
  resource_group_name = azurerm_resource_group.elvis-sandbox02.name
  size                = "Standard_F2"
  computer_name = "hostname"
  admin_username      = "azureuser"
  admin_password      = "AzureUser123!"
  disable_password_authentication = false



  network_interface_ids = [
    #where is the ID
    azurerm_network_interface.nic.id,
  ]


  os_disk {
    name                 = "mylinuxvm"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}
