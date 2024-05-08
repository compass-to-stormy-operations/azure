# Create basic resource group

# Variable block
$randomIdentifier = (New-Guid).ToString().Substring(0,8)
$location="brazilsouth"
$subscription="Free Tier"
$resourceGroup="alpha-resource-group"

echo "randomIdentifier=$randomIdentifier"
echo "Using resource group $resourceGroup"

echo "Creating $resourceGroup in $location..."
$ErrorActionPreference = "Stop"
try {
    az group create --name $resourceGroup --location $location --subscription $subscription
    if ($? -eq $false) {
        Write-Output "Ran into an issue: $($PSItem.ToString())"
        throw 'Resource Group create failed.'
    }
}
catch {
    Write-Error $PSItem.Exception.Message
}
$ErrorActionPreference = "Continue"
