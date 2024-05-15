# Variable block
$uniqueId="alpha"
$resourceGroup="$uniqueId-resource-group"
$vnetName="$uniqueId-vnet"
$subnetName = "$uniqueId-subnet"
$vnetAddressPrefix = "10.0.0.0/16"
$subnetAddressPrefix = "10.0.0.0/24"

$ErrorActionPreference = "Stop"
try {
    # Create a virtual network
    Write-Output "Creating $vnetName -> $vnetAddressPrefix"
    az network vnet create `
      --name $vnetName `
      --resource-group $resourceGroup `
      --address-prefixes $vnetAddressPrefix `
    if ($? -eq $false) {
        throw 'virtual network create failed.'
    }
    
    # Create a subnet
    Write-Output "Creating $subnetName -> $subnetAddressPrefix"
    az network vnet subnet create `
        --name $subnetName `
        --resource-group $resourceGroup `
        --vnet-name $vnetName `
        --address-prefixes $subnetAddressPrefixes
    if ($? -eq $false) {
        throw 'subnet create failed.'
    } 
} catch {
    Write-Error $PSItem.Exception.Message
}
$ErrorActionPreference = "Continue"
