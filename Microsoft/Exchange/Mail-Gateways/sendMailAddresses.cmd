echo off
rem : sendMailAddresses.cmd - Send valid Mail Addresses from Domain to SPAM Proxy

rem : Change Style
      cd /d %0\..
      title Send valid Mail Addresses
      color 17

rem : Dump Mail Addresses into C:\Service\eMailAddressDump\DOMAIN.com
      Powershell.exe -executionpolicy remotesigned -File C:\Service\eMailAddressDump\eMailAddressDump.ps1 > C:\Service\eMailAddressDump\DOMAIN.txt

rem : Generate the Body
      echo Actual SMTP Addresses of DOMAIN.com > C:\Service\eMailAddressDump\body.txt
      date /t >> C:\Service\eMailAddressDump\body.txt
      time /t >> C:\Service\eMailAddressDump\body.txt

rem : Generate a Message File and MIME encode the File with the Users Addresses
      mpack -s "Actual SMTP Addresses of DOMAIN.com" -d C:\Service\eMailAddressDump\body.txt -o C:\Service\eMailAddressDump\body.msg C:\Service\eMailAddressDump\DOMAIN.txt

rem : Send the encoded File by e-Mail
      bmail -s 127.0.0.1 -t spamproxy@DOMAIN.com -f exchangeadmin@DOMAIN.com -h -m C:\Service\eMailAddressDump\body.msg

rem : Delete temporary Files
      del C:\Service\eMailAddressDump\body.txt
      del C:\Service\eMailAddressDump\body.msg
      del C:\Service\eMailAddressDump\DOMAIN.txt

rem : Remember to include this Servers IP Address as a Relay Host at your Mail Server!
