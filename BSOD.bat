@echo off
color 0A
cls
mode 1000
start "" "C:\Windows\System32\rundll32.exe" user32.dll,LockWorkStation
echo.
echo *** STOP: 0x0000007B (0xFFFFF880009A9A00, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000)
echo.
echo *** Your PC ran into a problem and needs to restart.
echo.
echo We're just collecting some error info, and then we'll restart for you.
echo.
echo If you’d like to know more, you can search online later for this error: 
echo.
echo STOP 0x0000007B
echo.
echo Please wait while your PC shuts down...
shutdown /s /f /t 5
