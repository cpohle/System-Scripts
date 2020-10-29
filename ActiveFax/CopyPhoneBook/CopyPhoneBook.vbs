' CopyPhoneBooks.vbs - Copy ActFax PhoneBook Files to Backup Folder
' Run Daily at 5am from Task Scheduler

' v1.0 - 29.10.2020 - Initial Release

' Define Constants for Environment on Server
  Const strPhoneBookFolder = "E:\ActiveFax\Server\Data\PhoneP\"
  Const strBackupFolder = "E:\PhoneBookBackups\"

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
  objFSO.CopyFile strPhoneBookFolder & "*.*", strActualBackupFolder

  Function fncDateString(datDate)
' Format the Date as yyyymmdd
  fncDateString = Year(datDate)& right("0" & Month(datDate),2) & right("0" & Day(datDate),2) 
    End Function
