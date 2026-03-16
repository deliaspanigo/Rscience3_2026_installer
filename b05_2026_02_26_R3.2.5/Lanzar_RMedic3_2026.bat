@echo off
cd /d "%~dp0"

set "R_PATH=%~dp0App\R-Portable\bin\Rscript.exe"
set "APP_DIR=%~dp0RMedic3_2026"
set "RENV_LIB=%APP_DIR%\renv\library\windows\R-4.5\x86_64-w64-mingw32"

:: 1. Lanzamos el navegador en modo App apuntando al futuro puerto
start msedge --app=http://127.0.0.1:1410 --start-maximized

:: 2. Ejecutamos R y le decimos que use ese puerto fijo
"%R_PATH%" -e ".libPaths('%RENV_LIB:\=\\%'); shiny::runApp(appDir='%APP_DIR:\=\\%', port=1410, launch.browser=FALSE)"