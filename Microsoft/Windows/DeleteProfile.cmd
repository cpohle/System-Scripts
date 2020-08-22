@echo off
rem : DeleteProfile.cmd - Löschen eines Benutzerprofils auf einer Windows 10 Station
rem : Christian Pohle, verwendet DelProf2 von Helge Klein https://helgeklein.com/free-tools/delprof2-user-profile-deletion-tool/

rem : v1.0 22.8.2020 - Erste VErsion

rem : Outfit
      title Delete Profile
      color 17 

rem : Change to actual Dir
      cd /d %0\..\

rem : Check Parameters
      IF [%1] == [] GOTO GetParms
      IF [%2] == [] GOTO GetParms
      set PCNAME==%1
      set USERNAME==%2
      goto RunIT

:GetParms
rem : Get Command Line Parameters
 echo.
 echo Aufruf
 echo       DeleteProfile PCNAME USERNAME
 echo.
 echo oder geben Sie die Daten jetzt hier ein:
 echo.
      set /p PCNAME="Name des PC auf dem das Profil geloescht werden soll? "
      set /p USERNAME="Logon Name des Benutzer, dessen Profil geloescht werden soll? "
      goto RunIT

:RunIT
rem : Start Remote Registry Service
      sc \\%PCNAME% config RemoteRegistry start=demand
      sc \\%PCNAME% start RemoteRegistry 

rem : Delete Profile
      DelProf2 /c:%PCNAME% /id:%USERNAME%

rem : Stop Remote Registry Service
      sc \\%PCNAME% stop RemoteRegistry 
      sc \\%PCNAME% config RemoteRegistry start=disabled

      GOTO End

:End
