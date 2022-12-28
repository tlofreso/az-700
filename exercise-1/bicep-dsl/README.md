# Create VNets using bicep

This is an ARM template paired with a parameters file that will deploy to a specified resource group.

### Deploy with PowerShell
_The self-contained instance of the Bicep CLI installed by Azure CLI isn't available to PowerShell commands. Azure PowerShell deployments fail if you haven't manually installed the Bicep CLI. [here](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/install#azure-powershell)_
```powershell
New-AzResourceGroup -Name 'ContosoResourceGroup' -location eastus
New-AzResourceGroupDeployment -ResourceGroupName ContosoResourceGroup -TemplateFile ./resource-deploy.bicep -TemplateParameterFile ./resource-deploy.parameters.json

# Cleanup
Get-AzResourceGroup -Name "ContosoResourceGroup" | Remove-AzResourceGroup -Force  
```

### Deploy with Azure CLI
_The parameter file must be a local file. External parameter files aren't supported with Azure CLI. [here](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/deploy-cli#parameter-files)_
```powershell
# --location, --name
az group create -l eastus -n ContosoResourceGroup
az deployment group create --resource-group ContosoResourceGroup --template-file ./resource-deploy.bicep --parameters ./resource-deploy.parameters.json

# Cleanup | --name, --yes (confirm delete)
az group delete -n ContosoResourceGroup -y
```