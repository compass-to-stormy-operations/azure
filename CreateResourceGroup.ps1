# Variable block
$uniqueId="alpha"
$subscription="Free Tier"
$location="brazilsouth"
$resourceGroup="$uniqueId-resource-group"

$ErrorActionPreference = "Stop"
try {
    #create a resource group
    Write-Output "Creating $resourceGroup in $location..."
    az group create `
        --name $resourceGroup `
        --location $location `
        --subscription $subscription
    if ($? -eq $false) {
        throw 'Resource Group create failed.'
    } 
} catch {
    Write-Error $PSItem.Exception.Message
}
$ErrorActionPreference = "Continue"
