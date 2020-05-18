# Update VMware Tools on vSphere Machine
# Script is called from BatchPatch

param (
    [Parameter(Mandatory=$true)][string]$Computer
    )

connect-viserver -server SERVERNAME -user USERNAME -password PASSWORD | out-null
Update-Tools -Server SERVERNAME -VM $Computer* -NoReboot
Disconnect-VIServer -Server * -Force -Confirm:$false | out-null
