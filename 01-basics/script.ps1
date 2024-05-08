# Create basic resource group

# Variable block
$location="brazilsouth"
$resourceGroup="alpha-resource-group"

echo "Using resource group $resourceGroup"

echo "Creating $resourceGroup in $location..."
$ErrorActionPreference = "Stop"
try {
    az group create --name $resourceGroup --location $location
    if ($? -eq $false) {
        throw 'Group create failed.'
    }
}
catch {
    Write-Error "Error creating the resource group."
}
$ErrorActionPreference = "Continue"
