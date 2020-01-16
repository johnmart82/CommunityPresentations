## Login to Azure account and set subscription context.
Login-AzAccount
Set-AzContext -SubscriptionId "00000000-0000-0000-0000-000000000000"

## Get storage account context for subsequent actions.
$StorageAccountParams = @{
    ResourceGroupName = "IgniteTourLdn2020RG-01"
    StorageAccountName = "ignitetourldn2020"
}
$StorageAccountContext = (Get-AzStorageAccount @StorageAccountParams).Context

## Get my containers.
$StorageContainers = Get-AzStorageContainer -Context $StorageAccountContext
$StorageContainers

## Get some blobs to play with.
$Blobs = Get-AzStorageBlob -Container $StorageContainers[0].Name -Context $StorageAccountContext

$Blobs | Where-Object {$_.ICloudBlob.Properties.StandardBlobTier -EQ "Hot"}
$Blobs | Where-Object {$_.ICloudBlob.Properties.StandardBlobTier -EQ "Cool"}
$Blobs | Where-Object {$_.ICloudBlob.Properties.StandardBlobTier -EQ "Archive"}

($Blobs | Where-Object {$_.ICloudBlob.Properties.StandardBlobTier -EQ "Cool"}).ICloudBlob.SetStandardBlobTier("Archive")
($Blobs | Where-Object {$_.ICloudBlob.Properties.StandardBlobTier -EQ "Hot"}).ICloudBlob.SetStandardBlobTier("Cool")

Get-AzStorageBlob -Container $StorageContainers[0].Name -Context $StorageAccountContext

## Rehydrate a blob from Archive as High Priority ~ 1 hour rehydration time.
(Get-AzStorageBlob -Container $StorageContainers[0].Name -Context $StorageAccountContext | Where-Object {$_.ICloudBlob.Properties.StandardBlobTier -EQ "Archive"})[0].ICloudBlob.SetStandardBlobTier("Hot","High")

## Rehydrate a blob from Archive as Standard Priority ~ 15 hour rehydration time.
(Get-AzStorageBlob -Container $StorageContainers[0].Name -Context $StorageAccountContext | Where-Object {$_.ICloudBlob.Properties.StandardBlobTier -EQ "Archive"})[1].ICloudBlob.SetStandardBlobTier("Hot","Standard")

## Show Rehydration Status
(Get-AzStorageBlob -Container $StorageContainers[0].Name -Context $StorageAccountContext | Where-Object {$_.ICloudBlob.Properties.StandardBlobTier -EQ "Archive"})[0].ICloudBlob.Properties.RehydrationStatus
(Get-AzStorageBlob -Container $StorageContainers[0].Name -Context $StorageAccountContext | Where-Object {$_.ICloudBlob.Properties.StandardBlobTier -EQ "Archive"})[1].ICloudBlob.Properties.RehydrationStatus
