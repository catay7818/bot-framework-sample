@description('The location to deploy the resources to.')
param location string = resourceGroup().location

@description('The name of the container registry.')
param acrName string

resource containerRegistry 'Microsoft.ContainerRegistry/registries@2021-06-01-preview' = {
  name: acrName
  location: location
  sku: {
    name: 'Basic'
  }
  properties: {
    adminUserEnabled: true
  }
}
