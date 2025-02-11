@description('The location to deploy the resources to.')
param location string = resourceGroup().location

@description('The name of the app service.')
param appServiceName string

@description('The name of the docker image.')
param dockerImage string

resource appServicePlan 'Microsoft.Web/serverfarms@2024-04-01' = {
  name: toLower('asp-${appServiceName}')
  location: location
  kind: 'linux'
  sku: {
    name: 'B1'
  }
  properties: { reserved: true }
}

resource appService 'Microsoft.Web/sites@2024-04-01' = {
  name: appServiceName
  location: location
  kind: 'app,linux,container'
  identity: { type: 'SystemAssigned' }
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: true
    siteConfig: {
      linuxFxVersion: 'DOCKER|${dockerImage}'
      acrUseManagedIdentityCreds: true
    }
  }
}

output principalId string = appService.identity.principalId
output appServiceResourceName string = appService.name
