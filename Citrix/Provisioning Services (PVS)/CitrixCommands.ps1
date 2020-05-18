# Collection of Commands to manage Citrix Provisioning Services Disc Images
# I use Powershell for this rather than the GUI as the GUI sometimes Times Out

# Load PowerShell SnapIn (do it once per Session)
Import-Module “C:\Program Files\Citrix\Provisioning Services Console\Citrix.PVS.SnapIn.dll”

# Create a new vDisk version
New-PvsDiskMaintenanceVersion -DiskLocatorName "DiscName" -StoreName "StoreName" -SiteName "SiteName"

# Promote Disc
Invoke-PvsPromoteDiskVersion -DiskLocatorName "DiscName" -StoreName "StoreName" -SiteName "SiteName"
