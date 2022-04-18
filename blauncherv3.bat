@echo off
@setlocal enableextensions
@cd /d "%~dp0"
echo %cd%
color E
echo APP HAS TO BE RAN AS ADMIN TO FUNCTION! IF YOU GET AN ERROR, TRY RELAUNCHING WITH ADMIN PRIVILEDGES. IF YOU ALREADY HAVE GIVEN IT ADMIN, CREATE AN ISSUE ON THE GITHUB. (github.com/imsaku/blauncher)

:errcheck1
if exist enable.reg (
    goto :errcheck2
) else (
    goto :err1
)

:errcheck2
if exist disable.reg (
    goto :start
) else (
    goto :err2
)
 
:err1
    echo The registry file enable.reg is missing from the install directory. Please reinstall or create an issue on the github. (github.com/imsaku/blauncher)
    timeout /t 20
    exit

:err2
    echo The registry file disable.reg is missing from the install directory. Please reinstall or create an issue on the github. (github.com/imsaku/blauncher)
    timeout /t 20
    exit

:start
echo Saku's BLauncher Exploit //V3\\
echo IMPORTANT!! This program can only run properly if it has ADMINISTRATOR PRIVILEDGES.
echo Choice One == Enable Exploit and run Minecraft
echo Choice Two == Enable Exploit by itself (Don't leave this on, you could end up bricking your Win install overtime!) (You also gotta kill RuntimeBroker.exe when your game hits above 40%.)
echo Choice Three == Disable Exploit 
echo Choice Four == Check for Updates (currently doesn't work)
echo Choice Five == Exit out of BLauncher (with exploit disabling)
echo Choice Six == Exit out of BLauncher (without exploit disabling)
echo Choice Seven == Install Minecraft Bedrock (currently doesn't work)
echo Choice Eight == Run Minecraft by itself without enabling/disabling exploit
echo {1,2,3,4,5,6,7,8}

set /p ans="Enter your choice:"
if %ans%==1 (
goto 1
)

if %ans%==2 (
goto 2
)

if %ans%==3 (
goto 3
)

if %ans%==4 (
goto 4
)

if %ans%==5 (
goto 5
)

if %ans%==6 (
goto 6
)

if %ans%==7 (
goto 7
)

if %ans%==8 (
goto 8
)


:1
regedit /s enable.reg
net stop ClipSVC
explorer.exe shell:appsFolder\Microsoft.MinecraftUWP_8wekyb3d8bbwe!App
timeout /t 10
taskkill /f /im RuntimeBroker.exe
cls
goto start

:2
regedit /s enable.reg
net stop ClipSVC
cls
goto start

:3
regedit /s disable.reg
net start ClipSVC
cls
goto start

:4
echo Sadly, this option doesn't work yet. Check for new updates!
timeout /t 10
cls
goto start

:5
regedit /s disable.reg
net start ClipSVC
exit

:6
exit

:7
echo Sadly, this option doesn't work yet. Check for new updates!
timeout /t 10
cls
goto start

:8
explorer.exe shell:appsFolder\Microsoft.MinecraftUWP_8wekyb3d8bbwe!App
timeout /t 10
taskkill /f /im RuntimeBroker.exe
cls
goto start