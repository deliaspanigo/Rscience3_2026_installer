Set WshShell = CreateObject("WScript.Shell")
strPath = WshShell.CurrentDirectory

' Construimos la ruta al ejecutable de R
RScript = Chr(34) & strPath & "\App\R-Portable\bin\Rscript.exe" & Chr(34)

' Construimos el argumento de R (todo el código Shiny)
RCommand = "-e " & Chr(34) & "options(browser = function(url) { chrome <- 'C:/Program Files/Google/Chrome/Application/chrome.exe'; edge <- 'C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe'; if (file.exists(chrome)) { system(paste0(shQuote(chrome), ' --app=', url), wait = FALSE) } else if (file.exists(edge)) { system(paste0(shQuote(edge), ' --app=', url), wait = FALSE) } else { browseURL(url) } }); setwd('RMedic3'); source('.Rprofile'); shiny::runApp(launch.browser=TRUE)" & Chr(34)

' Ejecutamos directamente Rscript con el parámetro 0 (invisible)
WshShell.Run RScript & " " & RCommand, 0, False
Set WshShell = Nothing