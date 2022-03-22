param location string
param vaultName string
param aksIdentity object

resource vault 'Microsoft.KeyVault/vaults@2021-11-01-preview' = {
  name: vaultName
  location: location

  properties: {
    sku: {
      family: 'A'
      name: 'standard'
    }
    tenantId: subscription().tenantId
    enabledForDeployment: true
    enableRbacAuthorization: false
    enableSoftDelete: true
    enablePurgeProtection: true
    softDeleteRetentionInDays: 7

    accessPolicies: [
      {
        tenantId: subscription().tenantId
        objectId: aksIdentity.principalId
        permissions: {
          certificates: [
            'get'
          ]
          keys: [
            'get'
          ]
          secrets: [
            'get'
          ]
          storage: [
            'get'
          ]
        }
      }
    ]
  }
}
