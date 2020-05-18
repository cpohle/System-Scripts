@echo off
rem : Batch to start ShrewSoft VPN Client and connect automatically to CISCO ASA

rem : Outfit
      Color 17 

rem : Use Start to close the Batch after calling the VPN
rem : -r VPN target to connect to
rem : -u Username
rem : -p Password
rem : -a Connect automatically
      start /min "" "C:\Program Files\ShrewSoft\VPN Client\ipsecc.exe" -r TARGET -u "USER" -p "PASSWORD" -a
