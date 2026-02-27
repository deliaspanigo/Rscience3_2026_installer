@echo off
cd /d "%~dp0"

set "R_PATH=%~dp0App\R-Portable\bin\Rscript.exe"
set "APP_DIR=%~dp0RMedic3_2026"
set "RENV_LIB=%APP_DIR%\renv\library\windows\R-4.5\x86_64-w64-mingw32"

:: Lanzamos Shiny sin puerto fijo y capturamos la URL generada para abrir Edge
"%R_PATH%" -e ".libPaths('%RENV_LIB:\=\\%'); options(shiny.launch.browser = function(url) { shell(paste0('cmd /c start msedge --app=', url, ' --start-maximized'), wait = FALSE) }); shiny::runApp(appDir='%APP_DIR:\=\\%')"