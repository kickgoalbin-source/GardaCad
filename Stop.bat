@echo off
echo Stopping Garda CAD server...
for /f "tokens=5" %%p in ('netstat -ano ^| findstr :3000 ^| findstr LISTENING') do taskkill /PID %%p /F >nul 2>nul
echo Done.
timeout /t 2 >nul
