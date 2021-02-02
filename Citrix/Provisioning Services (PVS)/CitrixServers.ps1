# List all Citrix Farm Devices with Collection Name and Type, ready for Export to Excel 

# Load PowerShell SnapIn 
Import-Module “C:\Program Files\Citrix\Provisioning Services Console\Citrix.PVS.SnapIn.dll”

# List all Devices ready for Export to Excel 
Get-PvsDeviceInfo | select DeviceName,CollectionName,Type  | export-csv ".\CitrixServers.csv" -Append -NoTypeInformation -Encoding UTF8 -Delimiter ";" 
