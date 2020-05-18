# List Snapshots of vSphere Machine
# Script is called from BatchPatch

param (
    [Parameter(Mandatory=$true)][string]$Computer
    )

connect-viserver -server SERVERNAME -user USERNAME -password PASSWORD | out-null
Get-Snapshot -Server SERVERNAME -VM $Computer* | ft Name -HideTableHeaders
Disconnect-VIServer -Server * -Force -Confirm:$false | out-null
