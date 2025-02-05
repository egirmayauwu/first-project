@echo off
echo Disabling Wi-Fi...
netsh interface set interface "Wi-Fi" admin=disable
ping 127.0.0.1 -n 5 > nul
rundll32.exe user32.dll,LockWorkStation
pause
