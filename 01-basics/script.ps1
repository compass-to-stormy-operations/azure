# Create basic resource group

# Variable block
location="brazilsouth"
resource-group="alpha-resource-group"

echo "Using resource group $resource-group"

echo "Creating $resource-group in $location..."
az group create --name $resource-group --location "$location"
