#!/usr/bin/env sh

az deployment group create \
    --resource-group bot-framework-sample \
    --template-file ./main.bicep \
    --parameters ./main.bicepparam
