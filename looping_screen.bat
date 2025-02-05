echo off
cls

:begin

set /P M=Input text to encode md5, press ENTER to exit: 
if %M%==%M1% goto end

echo.|set /p ="%M%" | openssl md5

set M1=%M%
Goto begin