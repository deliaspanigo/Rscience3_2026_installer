Set WshShell = CreateObject("WScript.Shell")
' Simplemente ejecuta el archivo .bat que está en la misma carpeta
' El 0 oculta la ventana, el True/False indica si esperar a que termine
WshShell.Run "cmd /c Lanzar_RMedic3.bat", 0, False