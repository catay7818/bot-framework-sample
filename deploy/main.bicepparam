using 'main.bicep'

param acrName = 'cataybotacr'

param appServiceName = 'catay-app-service'

param botDockerImage = 'cataybotacr.azurecr.io/bot:latest'
param pythonDockerImage = 'cataybotacr.azurecr.io/python:latest'
