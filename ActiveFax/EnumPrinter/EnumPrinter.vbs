' EnumPrinters.vbs - Enumerate Printers on ActFax Server
' This uses the same Windows Function as the ActFax Server uses, if a printer is missing
' in ActFax, it is also missing here!

' To test the Script, change the Value needed for intPrinter in line 29

' v1.0 - 29.10.2020 - Initial Release

' Variables
  Dim objNetwork, objPrinter, intPrinter, txtBody

' Enumerate the mapped Printers
  Set objNetwork = CreateObject("WScript.Network")
  Set objPrinter = objNetwork.EnumPrinterConnections

' Error when no printer is mapped
  If objPrinter.Count = 0 Then
     txtBody "No Printers mapped on Server"
     fncSendMail
     Wscript.Quit(0)
  End If

' Read Array of Printers
  For intPrinter = 0 To (objPrinter.Count -1) Step 2 ' use Step 2 as M$ stores a Printer in 2 Lines
     txtBody = txtBody & objPrinter.Item(intPrinter) & " = " & objPrinter.Item(intPrinter +1) & " : " & intPrinter & vbCrLf
  Next

' Send Mail when Printer is missing (66 on 29.10.2020)
  If intPrinter < 66 then 
     fncSendMail
     Wscript.Quit(0)
  end if 

' Normal End
  Wscript.Quit(1)

  Function fncSendMail
' Create the objects require for sending email using CDO
  Set objMail = CreateObject("CDO.Message")
  Set objConf = CreateObject("CDO.Configuration")
  Set objFlds = objConf.Fields

' Set Properties of CDO object
  objFlds.Item("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2 'cdoSendUsingPort
  objFlds.Item("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "[NAMEOFMAILSERVER]" 
  objFlds.Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25 'default port for email
  objFlds.Update

' Create Mail
  objMail.Configuration = objConf
  objMail.From = "[ADDRESSOFSENDER]"
  objMail.To = "[ADDRESSOFRECIPIENT]"
  objMail.Subject = "ActFax Printers missing!"
  objMail.TextBody = txtBody
  objMail.Send

' Destroy Objects
  Set objFlds = Nothing
  Set objConf = Nothing
  Set objMail = Nothing

  End Function
