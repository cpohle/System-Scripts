# List all User Mailbox Databases

# Load Snap In (when called in PowerShell ISE and not in Exchange Management Shell)
# Snapin for Exchange 2013 and later
  Add-PSSnapin Microsoft.Exchange.Management.PowerShell.SnapIn; 

# Show current Database of Users and Export in a CSV Format that can be easily imported into Microsoft Excel 
  Get-mailbox -ResultSize Unlimited | select SamAccountName, alias, database | export-csv ".\User_Mailbox_Databases.csv" -Append -NoTypeInformation -Encoding UTF8 -Delimiter ";"
