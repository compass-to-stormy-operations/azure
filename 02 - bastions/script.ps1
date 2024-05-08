# Create bastions in vnet

# Variable block
$randomIdentifier = (New-Guid).ToString().Substring(0,8)
$subscription="Free Tier"
$location="brazilsouth"
$resourceGroup="alpha-resource-group"
$vnetName="alpha-vnet"
$bastionHost="alpha-bastion-host"
$publicIpName="alpha-public-ip"

$ErrorActionPreference = "Stop"
try {
    # Create a public ip
    echo "Creating Public IP $publicIpName"
    az network public-ip create `
        --resource-group $resourceGroup `
        --name $publicIpName
    if ($? -eq $false) {
        throw 'public ip create failed.'
    }  

    # Create a bastion in virtual network
    echo "Creating Bastion Host $bastionHost in $vnetName"
    az network bastion create `
        --location $location `
        --name $bastionHost `
        --public-ip-address $publicIpAddress `
        --resource-group $resourceGroup `
        --vnet-name $vnetName
    if ($? -eq $false) {
        throw 'bastion create failed.'
    }      
} catch {
    Write-Error $PSItem.Exception.Message
}
$ErrorActionPreference = "Continue"
