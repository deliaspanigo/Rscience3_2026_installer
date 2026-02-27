@echo off
:: Ir a la carpeta donde se instaló la app
cd /d "%~dp0"

set "R_PATH=%~dp0App\R-Portable\bin\Rscript.exe"
set "APP_DIR=%~dp0RMedic3_2026"
set "RENV_LIB=%APP_DIR%\renv\library\windows\R-4.5\x86_64-w64-mingw32"

:: Ejecutar Shiny
"%R_PATH%" -e ".libPaths('%RENV_LIB:\=\\%'); shiny::runApp(appDir='%APP_DIR:\=\\%', launch.browser=TRUE)"

:: No ponemos exit para que el proceso no se corte abruptamente