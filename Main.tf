module "resource_group" {
    source = "../../Module/Azurerm_Resource_group"
    resource_group = var.dev_resource_group
  
}

module "virtual_network" {
    source = "../../Module/Azurerm_VNET"
    depends_on = [module.resource_group]
    virtual_network = var.dev_virtual_network
}

module "subnet" {
    source = "../../Module/Azurerm_Subnet"
    depends_on = [module.virtual_network]
    subnet = var.dev_subnet
}

module "public_ip" {
    source = "../../Module/Azurerm_Public_ip"
    depends_on = [module.resource_group]
    public_ip = var.dev_public_ip
}

module "virtual_machine" {
    source = "../../Module/Azurerm_VM"
    depends_on = [module.subnet, module.public_ip ]
    vm_configs = var.dev_vm_configs
   
}


