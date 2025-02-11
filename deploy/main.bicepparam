using 'main.bicep'

param acrName = 'cataybotacr'

param appServiceName = 'catay-app-service'

param botDockerImage = 'cataybotacr.azurecr.io/bot:latest-amd64'
param pythonDockerImage = 'cataybotacr.azurecr.io/python:latest-amd64'
