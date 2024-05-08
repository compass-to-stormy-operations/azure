# Create bastions in vnet

# Variable block
$randomIdentifier = (New-Guid).ToString().Substring(0,8)
$subscription="Free Tier"
$location="brazilsouth"
$resourceGroup="alpha-resource-group"
$vnetName="alpha-vnet"
$bastionHost=""alpha-bastion-host"

$ErrorActionPreference = "Stop"
try {
    #create bastions

    az network bastion create --location westus2 --name MyBastionHost --public-ip-address MyPublicIpAddress --resource-group MyResourceGroup --vnet-name MyVnet

    if ($? -eq $false) {
        throw 'virtual network and subnet create failed.'
    }      
} catch {
    Write-Error $PSItem.Exception.Message
}
$ErrorActionPreference = "Continue"
