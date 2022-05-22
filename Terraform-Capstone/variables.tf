variable "resource_group_location" {
    default = "centralus"
    description = "This will be the location where all resources will be created"
    type = string
}

#Azure Resources Group Name
variable "resource_group_name" {
    default = "elvis-sandbox02"
    description = "This will be the variable Resource Group"
    type = string
}


#Azure virtual network name
variable "virtual_network_name" {
    default = "elvis-vnet"
    description = "This provide the name for virtual network"
    type = string
}

#Azure Subnet network name
variable "subnet_name" {
    default = "elvis-subnet"
    description = "This provide the name for subnet"
    type = string
}

#Azure Public_ip network name
variable "public_ip_name" {
    default = "elvis-public-ip"
    description = "This provide the name for public IP"
    type = string
}

#Azure Network Security Group name
variable "network_security_group_name" {
    default = "elvis-public-ip"
    description = "This provide the name for public IP"
    type = string
}

#Azure Network Interface name
variable "network_interface_name" {
    default = "elvis-ni"
    description = "This provide the name for Network Interface name"
    type = string
}

#Azure Linux Virtual machine name
variable "linux_virtual_machine" {
    default = "elvis-linuxvm"
    description = "This provide the name for Linux VM"
    type = string
}

#Azure account username
variable "username" {
    description = "Provide the Username for VM"
    type = string
}

#Azure account password
variable "password" {
    description = "Provide the password for VM"
    type = string
}