param allVnets array

resource allVnets_vnets_vnetname 'Microsoft.Network/virtualNetworks@2021-08-01' = [for item in allVnets: {
  name: item.vnetname
  location: item.region
  properties: {
    addressSpace: {
      addressPrefixes: [
        item.addressPrefixes
      ]
    }
    subnets: [for j in range(0, length(item.Subnets)): {
      name: item.Subnets[j].name
      properties: {
        addressPrefix: item.Subnets[j].addressPrefix
      }
    }]
  }
}]