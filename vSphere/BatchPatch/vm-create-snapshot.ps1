# Create Snapshot "BeforePatching" of vSphere Machine and Display all Snapshots for the Machine
# Script is called from BatchPatch, Output of Get-Snapshot is displayed there

param (
    [Parameter(Mandatory=$true)][string]$Computer
    )

connect-viserver -server SERVERNAME -user USERNAME -password PASSWORD | out-null
New-Snapshot -Server SERVERNAME -VM $Computer* -Name BeforePatching -Memory:$true | out-null
Get-Snapshot -Server SERVERNAME -VM $Computer* | ft Name -HideTableHeaders
Disconnect-VIServer -Server * -Force -Confirm:$false | out-null
