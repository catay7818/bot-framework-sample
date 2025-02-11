@description('The location to deploy the resources to.')
param location string = resourceGroup().location

@description('The name of the container registry.')
param acrName string

@description('The name of the app service.')
param appServiceName string

@description('The name of the bot docker image.')
param botDockerImage string
@description('The name of the python docker image.')
param pythonDockerImage string
module acr 'acr.bicep' = {
  name: '${acrName}-acr'
  params: {
    location: location
    acrName: acrName
  }
}

module appService 'app-service.bicep' = {
  name: '${appServiceName}-app'
  params: {
    location: location
    appServiceName: appServiceName
    botDockerImage: botDockerImage
    pythonDockerImage: pythonDockerImage
  }
}

module roleAssignments 'role-assignments.bicep' = {
  name: '${acrName}-role-assignments'
  params: {
    containerRegistryName: acrName
    appServicePrincipalId: appService.outputs.principalId
  }
}
