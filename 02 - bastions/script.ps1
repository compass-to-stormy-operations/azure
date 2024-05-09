# Create bastions in vnet

# Variable block
$randomIdentifier = (New-Guid).ToString().Substring(0,8)
$location="brazilsouth"
$resourceGroup="alpha-resource-group"
$vnetName="alpha-vnet"
$subnetName="AzureBastionSubnet"
$subnetAddressPrefix="10.1.1.0/26"
$bastionName="alpha-vnet-bastion"
$publicIpName="alpha-vnet-ip"

$ErrorActionPreference = "Stop"
try {
    # Create a bastion subnet
    echo "Creating bastion snet"
    az network vnet subnet create `
        --name $subnetName `
        --resource-group $resourceGroup `
        --vnet-name $vnetName ` 
        --address-prefix $subnetAddressPrefix
    if ($? -eq $false) {
        throw 'bastion subnet create failed.'
    }  

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
