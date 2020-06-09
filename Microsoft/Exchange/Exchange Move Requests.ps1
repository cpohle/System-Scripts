# Handle Exchange Move Requests

# New Batch
  New-MoveRequest -Identity ALIAS -TargetDatabase DATABASE -BatchName ALIAS -BadItemLimit 10000

# Get Status
  get-moverequest

# Detailed Statistics
  Get-MoveRequest -resultsize unlimited | Get-MoveRequestStatistics | select DisplayName, StatusDetail, *Size, *Percent* | ft
  Get-MoveRequest -resultsize unlimited | Where-Object {$_.status -like "Completed"} | Get-MoveRequestStatistics | select DisplayName, StatusDetail, *Size, *Percent* | ft
  get-moverequest -movestatus Failed|get-moverequeststatistics|select DisplayName,SyncStage,Failure*,Message,PercentComplete,largeitemsencountered,baditemsencountered|ft -autosize
  get-moverequest|get-moverequeststatistics|select DisplayName,SyncStage,Failure*,Message,PercentComplete,largeitemsencountered,baditemsencountered|ft -autosize
  get-moverequest -movestatus Completed|get-moverequeststatistics|select DisplayName,SyncStage,Failure*,Message,PercentComplete,largeitemsencountered,baditemsencountered|ft -autosize

# Delete Batch
  Remove-MoveRequest -Identity ALIAS
  get-moverequest -movestatus Completed|Remove-MoveRequest
  