# Variables
$resourceGroupName = "YourResourceGroupName"
$storageAccountName = "yourstorageaccountname" # Must be globally unique
$location = "East US"
$skuName = "Standard_LRS" # Standard Locally Redundant Storage

# Create a new resource group if it doesn't exist
$resourceGroup = Get-AzResourceGroup -Name $resourceGroupName -ErrorAction SilentlyContinue
if (-not $resourceGroup) {
    $resourceGroup = New-AzResourceGroup -Name $resourceGroupName -Location $location
}

# Create the storage account
$storageAccount = New-AzStorageAccount -ResourceGroupName $resourceGroupName `
                                       -Name $storageAccountName `
                                       -Location $location `
                                       -SkuName $skuName `
                                       -Kind "StorageV2" `
                                       -AccessTier "Hot"

# Output the storage account details
$storageAccount