# Find invalid Objects in Exchange 

Add-PSSnapin Microsoft.Exchange.Management.PowerShell.SnapIn; 

Get-Mailbox -ResultSize Unlimited | findstr "Warning"
Get-Contact -ResultSize Unlimited | findstr "Warning"
Get-DistributionGroup -ResultSize Unlimited | findstr "Warning"
Get-DynamicDistributionGroup -ResultSize Unlimited | findstr "Warning"
Get-PublicFolder -ResultSize Unlimited -Recurse | findstr "Warning"