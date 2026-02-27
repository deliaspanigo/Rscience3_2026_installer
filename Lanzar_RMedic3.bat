@echo off
setlocal enabledelayedexpansion

:: 1. Posicionarse en la carpeta donde está el script
cd /d "%~dp0"

:: 2. Definir ruta absoluta al ejecutable de R
:: Usamos %~dp0 para asegurar que la ruta sea completa desde la raíz C:
set "R_PATH=%~dp0App\R-Portable\bin\Rscript.exe"

:: 3. Ejecutar R usando la ruta entre comillas para evitar errores de espacios
:: Si el error persiste, es probable que la carpeta 'App' no esté al mismo nivel que este .bat
start /b "" "%R_PATH%" -e "options(browser = function(url) { chrome <- 'C:/Program Files/Google/Chrome/Application/chrome.exe'; edge <- 'C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe'; if (file.exists(chrome)) { system(paste0(shQuote(chrome), ' --app=', url), wait = FALSE) } else if (file.exists(edge)) { system(paste0(shQuote(edge), ' --app=', url), wait = FALSE) } else { browseURL(url) } }); setwd('RMedic3'); source('.Rprofile'); shiny::runApp(launch.browser=TRUE)"

exit