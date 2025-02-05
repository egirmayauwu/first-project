@echo off
color 0A
cls
echo LanSchool has encountered a critical error.
echo Disabling monitoring tools...
echo Please wait...

:: Simulate a delay
ping 127.0.0.1 -n 10 > nul

echo LanSchool is now disabled.
echo Press any key to exit.

pause >nul
