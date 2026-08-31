#!/bin/bash

RESOURCE_GROUP="rg-devops-lab"
LOCATION="canadacentral"

echo "Creating resource group: $RESOURCE_GROUP"

az group create \
  --name "$RESOURCE_GROUP" \
  --location "$LOCATION"

echo "Resource group created."

az group show \
  --name "$RESOURCE_GROUP" \
  --output table