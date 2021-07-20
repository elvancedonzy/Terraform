#Azure location
variable "location" {
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

#Azure AKS Enviroment Name
variable "enviroment" {
    default = "prod"
    description = "This will be the variable for the Enviroment"
    type = string
}