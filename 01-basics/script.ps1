# Create basic resource group

# Variable block
$location="brazilsouth"
$resourceGroup="alpha-resource-group"

echo "Using resource group $resourceGroup"

echo "Creating $resourceGroup in $location..."
az group create --name $resourceGroup --location $location
