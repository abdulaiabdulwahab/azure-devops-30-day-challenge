<!--
az login(login to your azure acount from the CLI)

az account list -o table(Lists your subscriptions in a tabular output)

az account show(shows currently active subscription)

az group create \
  --name rg-devops-lab \
  --location canadacentral (This creates a resource group with a name and location)

az group list -o table(This lists the resource groups in a tabular output)

az resource list \
  --resource-group rg-devops-lab \
  -o table (This lists the resources currently existing in the resource group in a tabular output)


az group list \
  --query "[].{Name:rg-devops-lab,Location:canadacentral}
  -o table(queries the resource group list for specific outputs in this case the resource group, location created already)

-->