# Start vSphere Machine
# Script is called from BatchPatch

param (
    [Parameter(Mandatory=$true)][string]$Computer
    )

connect-viserver -server SERVERNAME -user USERNAME -password PASSWORD | out-null
Start-VM -Server SERVERNAME -VM $Computer* -Confirm:$false
Disconnect-VIServer -Server * -Force -Confirm:$false | out-null
