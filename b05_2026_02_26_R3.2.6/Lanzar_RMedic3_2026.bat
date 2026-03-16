@echo off
setlocal enabledelayedexpansion

:: 1. Configuration
cd /d "%~dp0"
set "PORT=1410"
set "R_PATH=%~dp0App\R-Portable\bin\Rscript.exe"
set "APP_DIR=%~dp0RMedic3_2026"
set "RENV_LIB=%APP_DIR%\renv\library\windows\R-4.5\x86_64-w64-mingw32"

echo ---------------------------------------------------
echo  Starting RMedic v.3.2.6
echo ---------------------------------------------------

:: 2. AGGRESSIVE MODE: Free port if occupied
echo Checking port !PORT!...
for /f "tokens=5" %%a in ('netstat -aon ^| findstr :!PORT! ^| findstr LISTENING') do (
    echo Port busy by PID %%a. Killing process...
    taskkill /f /pid %%a >nul 2>&1
)

:: 3. Launch R in BACKGROUND
echo Loading libraries and modules...
start /b "" "%R_PATH%" -e ".libPaths('%RENV_LIB:\=\\%'); shiny::runApp(appDir='%APP_DIR:\=\\%', port=!PORT!, launch.browser=FALSE)"

:: 4. Wait Loop: Monitor Port Status
echo Waiting for server response...
:loop
netstat -ano | findstr :!PORT! | findstr LISTENING >nul 2>&1

if %errorlevel% neq 0 (
    timeout /t 1 /nobreak >nul
    goto loop
)

:: 5. Success
echo.
echo [OK] Server detected on port !PORT!
echo Opening interface in Microsoft Edge...
start msedge --app=http://127.0.0.1:!PORT! --start-maximized

echo ---------------------------------------------------
echo RMedic is active. Close the browser to exit.
echo ---------------------------------------------------
pause >nul