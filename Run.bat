@echo off
title Garda CAD - Server
cd /d "%~dp0"
where node >nul 2>nul
if %errorlevel% neq 0 (
  echo Node.js is not installed. Run install.bat first.
  pause
  exit /b 1
)
set PORT=3000
echo Starting Garda CAD...
start "" /min cmd /c "node server.js"
timeout /t 2 /nobreak >nul
set URL=http://localhost:%PORT%
set EDGE=%ProgramFiles(x86)%\Microsoft\Edge\Application\msedge.exe
if not exist "%EDGE%" set EDGE=%ProgramFiles%\Microsoft\Edge\Application\msedge.exe
if exist "%EDGE%" (
  start "" "%EDGE%" --app=%URL% --window-size=1280,800
) else (
  start "" %URL%
)
echo.
echo Garda CAD is running at %URL%
echo The server runs in the minimised "node" window.
echo Close that window (or run Stop.bat) to shut the CAD down.
timeout /t 5 >nul
