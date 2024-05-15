# Variable block
$uniqueId="alpha"
$resourceGroup="$uniqueId-resource-group"
$vnetName="$uniqueId-vnet"
$subnetName = "$uniqueId-subnet"
$vnetAddressPrefix = "10.0.0.0/16"
$subnetAddressPrefix = "10.0.0.0/24"

$ErrorActionPreference = "Stop"
try {
    # Create a virtual network and subnet
    Write-Output "Creating $vnetName -> $vnetAddressPrefix"
    Write-Output "Creating $subnetName -> $subnetAddressPrefix"
    az network vnet create `
      --name $vnetName `
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
