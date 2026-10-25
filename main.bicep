param storagePrefix string = 'stg'
param location string = resourceGroup().location

var storageName = '${storagePrefix}${uniqueString(resourceGroup().id)}'

resource storage 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageName
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
}

output storageAccountName string = storage.name
