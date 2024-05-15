# Variable block
$uniqueId="alpha"
$resourceGroup="$uniqueId-resource-group"
$vnetName="$uniqueId-vnet"
$subnetName="AzureBastionSubnet"
$subnetAddressPrefixes="10.0.250.0/26"
$bastionName="$uniqueId-vnet-bastion"
$publicIpName="$uniqueId-vnet-ip"

$ErrorActionPreference = "Stop"
try {
    # Create a bastion subnet
    Write-Output "Creating bastion snet"
    az network vnet subnet create `
        --name $subnetName `
        --resource-group $resourceGroup `
        --vnet-name $vnetName `
        --address-prefixes $subnetAddressPrefixes
    if ($? -eq $false) {
        throw 'bastion subnet create failed.'
    }  

    # Create a public ip
    Write-Output "Creating Public IP $publicIpName"
    az network public-ip create `
        --resource-group $resourceGroup `
        --name $publicIpName
    if ($? -eq $false) {
        throw 'public ip create failed.'
    }  

    # Create a bastion in virtual network
    Write-Output "Creating Bastion Host $bastionHost in $vnetName"
    az network bastion create `
        --name $bastionName `
        --public-ip-address $publicIpName `
        --resource-group $resourceGroup `
        --vnet-name $vnetName
    if ($? -eq $false) {
        throw 'bastion create failed.'
    }      
} catch {
    Write-Error $PSItem.Exception.Message
}
$ErrorActionPreference = "Continue"
