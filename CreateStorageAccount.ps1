# Variable block
$uniqueId="alpha"
$name="storageaccount"
$random=Get-Random
$storageAccountName=$uniqueId+$name+$random
$resourceGroup="$uniqueId-resource-group"
$sku="Standard_LRS"

$ErrorActionPreference = "Stop"
try {
    # Create a storage account
    Write-Output "Creating bastion snet"
    az storage account create `
      --name $storageAccountName `
      --resource-group $resourceGroup `
      --sku $sku
    if ($? -eq $false) {
        throw 'bastion subnet create failed.'
    }  
} catch {
    Write-Error $PSItem.Exception.Message
}
$ErrorActionPreference = "Continue"
