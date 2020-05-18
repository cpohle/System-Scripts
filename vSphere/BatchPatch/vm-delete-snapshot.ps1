# Delete Snapshot "BeforePatching" of vSphere Machine and display all remaining Snapshots for this machine
# Script is called from BatchPatch, Output from Get-Snapshot is displayed there

param (
    [Parameter(Mandatory=$true)][string]$Computer
    )

connect-viserver -server SERVERNAME -user USERNAME -password PASSWORD | out-null
$MySnap = Get-Snapshot -Server SERVERNAME -VM $Computer* -Name BeforePatching
Remove-Snapshot -Snapshot $MySnap -confirm:$false | out-null
Get-Snapshot -Server SERVERNAME -VM $Computer* | ft Name -HideTableHeaders
Disconnect-VIServer -Server * -Force -Confirm:$false | out-null
