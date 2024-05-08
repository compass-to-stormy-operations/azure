# Create basic resource group

# Variable block
$randomIdentifier = (New-Guid).ToString().Substring(0,8)
$subscription="Free Tier"
$location="brazilsouth"
$resourceGroup="alpha-resource-group"

echo "randomIdentifier=$randomIdentifier"
echo "Using resource group $resourceGroup"

echo "Creating $resourceGroup in $location..."
#$ErrorActionPreference = "Stop"
try {
    az group create --name $resourceGroup --location $location --subscription $subscription
    if ($? -eq $false) {
        throw 'Resource Group create failed.'
    }
} catch {
    Write-Error $PSItem.Exception.Message
}
#$ErrorActionPreference = "Continue"
