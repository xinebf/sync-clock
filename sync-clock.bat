@echo off
rem ZHANG XINZENG
rem 2018-05-12
set PATH=%PATH%;%cd%
setlocal EnableDelayedExpansion

for /f "delims=" %%i in ('curl -s -I httpbin.org') do echo %%i | findstr "Date" && set odate=%%i
cls
set n=0
for %%i in (%odate%) do (
    set vector[!n!]=%%i
    set /a n+=1
)
set otime=!vector[5]!
set omonth=!vector[3]!
set oday=!vector[2]!
set oyear=!vector[4]!

for /f "tokens=1,2,3 delims=:" %%c in ("%otime%") do (
    set ohour=%%c
    set ominute=%%d
    set osecond=%%e
)

set /a ohour=%ohour%+8
set otime=%ohour%:%ominute%:%osecond%
time %otime%

if "%omonth%"=="Jan" set omonth=01
if "%omonth%"=="Feb" set omonth=02
if "%omonth%"=="Mar" set omonth=03
if "%omonth%"=="Apr" set omonth=04
if "%omonth%"=="May" set omonth=05
if "%omonth%"=="Jun" set omonth=06
if "%omonth%"=="Jul" set omonth=07
if "%omonth%"=="Aug" set omonth=08
if "%omonth%"=="Sep" set omonth=09
if "%omonth%"=="Oct" set omonth=10
if "%omonth%"=="Nov" set omonth=11
if "%omonth%"=="Dec" set omonth=12
set odate=%oyear%-%omonth%-%oday%
date %odate%
date /t
time /t
pause
