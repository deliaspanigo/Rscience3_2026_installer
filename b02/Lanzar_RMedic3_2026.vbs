Set WshShell = CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")

strPath = fso.GetParentFolderName(WScript.ScriptFullName)
WshShell.CurrentDirectory = strPath

' Lanza el BAT de forma invisible
WshShell.Run "cmd /c Lanzar_RMedic3_2026.bat", 0, False

Set WshShell = Nothing
Set fso = Nothing