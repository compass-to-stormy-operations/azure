# Create bastions in vnet

# Variable block
$randomIdentifier = (New-Guid).ToString().Substring(0,8)
$subscription="Free Tier"
$location="brazilsouth"
$resourceGroup="alpha-resource-group"
$vnetName="alpha-vnet"
$bastionHost=""alpha-bastion-host"
$publicIpAddress="alpha-public-ip"

$ErrorActionPreference = "Stop"
try {
    # Create a bastion in virtual network
    echo "Creating Bastion Host $bastionHost in $vnetName"
    az network bastion create `
        --location $location `
        --name $bationHost `
        --public-ip-address $publicIpAddress `
        --resource-group resourceGroup `
        --vnet-name $vnetName
    if ($? -eq $false) {
        throw 'virtual network and subnet create failed.'
    }      
} catch {
    Write-Error $PSItem.Exception.Message
}
$ErrorActionPreference = "Continue"
