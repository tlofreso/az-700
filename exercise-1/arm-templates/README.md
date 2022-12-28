# Create VNets using ARM templates

This is an ARM template paired with a parameters file that will deploy to a specified resource group.

```powershell
new-azresourcegroup -name 'ContosoResourceGroup' -location eastus
New-AzResourceGroupDeployment -ResourceGroupName ContosoResourceGroup -TemplateFile ./resource-deploy.json -TemplateParameterFile ./resource-deploy.parameters.json
```