# Create basic resource group

# Variable block
$randomIdentifier = (New-Guid).ToString().Substring(0,8)
$subscription="Free Tier"
$location="brazilsouth"
$resourceGroup="alpha-resource-group"
$vnetName="alpha-vnet"
$subnetName = "alpha-snet"
$vnetAddressPrefix = "10.0.0.0/16"
$subnetAddressPrefix = "10.0.0.0/24"

$ErrorActionPreference = "Stop"
try {
    #create a resource group
    echo "Creating $resourceGroup in $location..."
    az group create --name $resourceGroup --location $location --subscription $subscription
    if ($? -eq $false) {
        throw 'Resource Group create failed.'
    }

    # Create a virtual network and subnet
    echo "Creating $vnetName -> $vnetAddressPrefix"
    echo "Creating $subnetName -> $subnetAddressPrefix"
    az network vnet create --name $vnetName `
      --resource-group $resourceGroup `
      --address-prefixes $vnetAddressPrefix `
      --subnet-name $subnetName `
      --subnet-prefixes $subnetAddressPrefix
    if ($? -eq $false) {
        throw 'virtual network and subnet create failed.'
    }      
} catch {
    Write-Error $PSItem.Exception.Message
}
$ErrorActionPreference = "Continue"
