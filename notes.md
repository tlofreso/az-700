Exercise: Design and implement a virtual network in Azure

# Design and implement a virtual network in Azure

Task 1: Create the ContosoResourceGroup
Task 2: Create the CoreServicesVnet virtual network and subnets
Task 3: Create the ManufacturingVnet virtual network and subnets
Task 4: Create the ResearchVnet virtual network and subnets
Task 5: Verify the creation of VNets and Subnets

## Using Az PowerShell Module
#### Resource Groups
```powershell

# Build resource group object
$rg = @{
    Name = 'LofresoResourceGroup'
    Location = 'EastUS'
}

# Create resource group
New-AzResourceGroup @rg

# Remove resource group
Remove-AzResourceGroup -Name "LofresoResourceGroup"

# Remove resource group without confirmation
Get-AzResourceGroup -Name "LofresoResourceGroup" | Remove-AzResourceGroup -Force
```

#### Virtual Networks
```powershell

# Build VNet object
$vnet = @{
    Name = 'CoreServicesVnet'
    ResourceGroupName = 'LofresoResourceGroup'
    Location = 'EastUS'
    AddressPrefix = '10.0.0.0/16'
}

# Create VNet
$virtualNetwork = New-AzVirtualNetwork @vnet

# Remove VNet
Remove-AzVirtualNetwork -ResourceGroupName LofresoResourceGroup -Name CoreServicesVnet

# Remove VNet without confirmation
Get-AzVirtualNetwork -Name "CoreServicesVnet" | Remove-AzVirtualNetwork -Force
```

#### Subnets
```powershell

# Build subnet object
$subnet = @{
    Name = 'GatewaySubnet'
    VirtualNetwork = $virtualNetwork
    AddressPrefix = '10.0.0.0/27'
}

# Create subnet
$subnetConfig = Add-AzVirtualNetworkSubnetConfig @subnet

# Associate subnet to VNet
$virtualNetwork | Set-AzVirtualNetwork

# Remove subnet
Remove-AzVirtualNetworkSubnetConfig -Name GatewaySubnet -VirtualNetwork $virtualNetwork
$virtualNetwork | Set-AzVirtualNetwork
```

## ARM Templates

[Structure & Syntax](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/syntax)
[ARM template documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
[ARM template reference](https://learn.microsoft.com/en-us/azure/templates/)

`metadata` may be used to provide further context on a particular object within the template schema. This can be used with [PSDoc](https://azure.github.io/PSDocs.Azure/using-metadata/) to auto-document.

helpful for nested `copy` elements, and mixed-scope deployments: https://www.yobyot.com/cloud/sample-arm-template-virtual-network-example-vnet-multiple-subscriptions/2018/07/11/

good article describing `copy` use: https://borzenin.com/use-copy-function-to-simplify-arm-templates/