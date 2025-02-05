@echo off
:: This script attempts to stop LanSchool by killing its processes and stopping its service.

:: Check and terminate LanSchool process
echo Checking for LanSchool process...
tasklist /FI "IMAGENAME eq LSSchSvc.exe" 2>NUL | find /I "LSSchSvc.exe" > NUL
if %ERRORLEVEL% == 0 (
    echo LanSchool process found. Terminating process...
    taskkill /F /IM LSSchSvc.exe
    echo LanSchool process terminated.
) else (
    echo LanSchool process not found.
)

:: Check and terminate any LanSchool helper processes
tasklist /FI "IMAGENAME eq LSClient.exe" 2>NUL | find /I "LSClient.exe" > NUL
if %ERRORLEVEL% == 0 (
    echo LanSchool helper process found. Terminating process...
    taskkill /F /IM LSClient.exe
    echo LanSchool helper process terminated.
) else (
    echo LanSchool helper process not found.
)

:: Attempt to stop the LanSchool service (if running)
echo Checking for LanSchool service...
sc query "LSSchSvc" | findstr /I "RUNNING" > NUL
if %ERRORLEVEL% == 0 (
    echo LanSchool service found. Stopping service...
    sc stop "LSSchSvc"
    echo LanSchool service stopped.
) else (
    echo LanSchool service not running.
)

:: Block LanSchool from running at startup (if the script is executed with admin rights)
echo Disabling LanSchool startup...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "LanSchool" /t REG_SZ /d "C:\Program Files\LanSchool\LSClient.exe" /f

:: End script
echo Anti-LanSchool script completed.
pause
