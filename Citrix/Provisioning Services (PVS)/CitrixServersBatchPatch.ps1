# List all Citrix Farm Devices with Collection Name and Type, ready for txt Import to Batchpatch 

# Load PowerShell SnapIn 
Import-Module “C:\Program Files\Citrix\Provisioning Services Console\Citrix.PVS.SnapIn.dll”

# List all Devices ready for Import to BatchPatch
  $citrixservers = Get-PvsDeviceInfo | select DeviceName,CollectionName,Type

  ForEach ($server in $citrixservers)
     {
#      Store in Variables
       $DeviceName = $server.DeviceName
       $CollectionName = $server.CollectionName
       $Type = $server.Type

#      Write for BatchPatch
       Write “$DeviceName |$CollectionName ||$Type” >> ./CitrixServersBatchPatch.txt
     } 
