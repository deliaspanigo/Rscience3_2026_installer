@echo off
setlocal enabledelayedexpansion

:: 1. Posicionarse en la carpeta
cd /d "%~dp0"

:: 2. Definir ruta al ejecutable de R
set R_PATH="%~dp0App\R-Portable\bin\Rscript.exe"

:: 3. Ejecutar R y forzar el modo ventana (App) con el navegador disponible
%R_PATH% -e "options(browser = function(url) { chrome <- 'C:/Program Files/Google/Chrome/Application/chrome.exe'; edge <- 'C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe'; if (file.exists(chrome)) { system(paste0(shQuote(chrome), ' --app=', url), wait = FALSE) } else if (file.exists(edge)) { system(paste0(shQuote(edge), ' --app=', url), wait = FALSE) } else { browseURL(url) } }); setwd('RMedic3'); source('.Rprofile'); shiny::runApp(launch.browser=TRUE)"

exit