' MoveQuarantine.vbs - Move Mails in Quarantine Queue to Backup Folder
' Run Daily at 5am from Task Scheduler

' v1.0 - 08.06.2020 - Initial Release

' Define Constants for Environment on Server
  Const strQuarantineFolder = "d:\MDaemon\CFilter\QUARANT\"
  Const strBackupFolder = "d:\TEMP\Quarantine\"

' File System Object
  Dim objFSO
  Set objFSO = CreateObject("Scripting.FileSystemObject")

' Define actual Backup Folder
  strActualBackupFolder = strBackupFolder & fncDateString(now())

' Check, whether Target Folder exists
  If Not objFSO.FolderExists(strActualBackupFolder) Then
     objFSO.CreateFolder strActualBackupFolder
  End If
' Move Files  
  objFSO.MoveFile strQuarantineFolder & "*.*", strActualBackupFolder

  Function fncDateString(datDate)
' Format the Date as yyyymmdd
  fncDateString = Year(datDate)& right("0" & Month(datDate),2) & right("0" & Day(datDate),2) 
  End Function
