targetScope = 'subscription'

param location string = 'westeurope'
param resourcePrefix string = 'akslab'

var resourceGroupName = '${resourcePrefix}-rg'

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resourceGroupName
  location: location
}

module aks './aks.bicep' = {
  name: 'aks'
  scope: rg
  params: {
    location: location
    clusterName: resourcePrefix
  }
}

module vault 'vault.bicep' = {
  name: 'vault'
  scope: rg
  params: {
    location: location
    vaultName: '${resourcePrefix}-vault-one'
    aksIdentity: aks.outputs.identity
  }
  dependsOn: [
    aks
  ]
}
