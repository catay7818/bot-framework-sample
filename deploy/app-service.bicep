@description('The location to deploy the resources to.')
param location string = resourceGroup().location

@description('The name of the app service.')
param appServiceName string

@description('The name of the bot docker image.')
param botDockerImage string
@description('The port the bot is listening on.')
param botTargetPort string = '8080'

@description('The name of the python docker image.')
param pythonDockerImage string
@description('The port the python is listening on.')
param pythonTargetPort string = '8080'

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
  kind: 'app,linux'
  identity: { type: 'SystemAssigned' }
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: true
    siteConfig: {
      linuxFxVersion: 'sitecontainers'
      acrUseManagedIdentityCreds: true
    }
  }
}

resource botContainer 'Microsoft.Web/sites/sitecontainers@2024-04-01' = {
  parent: appService
  name: '${appServiceName}-bot-container'
  properties: {
    image: botDockerImage
    targetPort: botTargetPort
    isMain: true
    authType: 'SystemIdentity'
    userManagedIdentityClientId: 'SystemAssigned'
    volumeMounts: []
    environmentVariables: []
  }
}

resource pythonContainer 'Microsoft.Web/sites/sitecontainers@2024-04-01' = {
  parent: appService
  name: '${appServiceName}-python-container'
  properties: {
    image: pythonDockerImage
    targetPort: pythonTargetPort
    isMain: true
    authType: 'SystemIdentity'
    userManagedIdentityClientId: 'SystemAssigned'
    volumeMounts: []
    environmentVariables: []
  }
}

output principalId string = appService.identity.principalId
output appServiceResourceName string = appService.name
