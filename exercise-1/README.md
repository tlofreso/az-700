# Design and implement a virtual network in Azure

Tasks:
1. Create the ContosoResourceGroup
2. Create the CoreServicesVnet virtual network and subnets
3. Create the ManufacturingVnet virtual network and subnets
4. Create the ResearchVnet virtual network and subnets
5. Verify the creation of VNets and Subnets

### Virtual Networks
Virtual Network   | Region        | VNet Address Space
------------------|---------------|-------------------:
CoreSerevicesVnet | eastus        | 10.20.0.0/16
ManufacturingVnet | westeurope    | 10.30.0.0/16
ResearchVnet      | southeastasia | 10.40.0.0/16

### Subnets
Parent VNet       | Subnet Name               | Subnet Prefix
------------------|---------------------------|-----------------:
CoreSerevicesVnet | GatewaySubnet             | 10.20.0.0/27
CoreSerevicesVnet | SharedServicesSubnet      | 10.20.10.0/24
CoreSerevicesVnet | DatabaseSubnet            | 10.20.20.0/24
CoreSerevicesVnet | PublicWebServiceSubnet    | 10.20.30.0/24
ManufacturingVnet | ManufacturingSystemSubnet | 10.30.10.0/24
ManufacturingVnet | SensorSubnet1             | 10.30.20.0/24
ManufacturingVnet | SensorSubnet2             | 10.30.21.0/24
ManufacturingVnet | SensorSubnet3             | 10.30.22.0/24
ResearchVnet      | ResearchSystemSubnet      | 10.40.0.0/24

