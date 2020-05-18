# Collect and Display all SMTP E-Mail Addresses in Domain 

Add-PSSnapin Microsoft.Exchange.Management.PowerShell.SnapIn
Get-Mailbox | Select Name -ExpandProperty EmailAddresses | Select SmtpAddress | ft -HideTableHeaders
