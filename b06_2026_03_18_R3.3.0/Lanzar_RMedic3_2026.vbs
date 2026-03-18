' ===========================================================================
' RMedic v.3.3.0 - Official Launcher
' ===========================================================================

Set WshShell = CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")

AppPath = Left(WScript.ScriptFullName, InStrRev(WScript.ScriptFullName, "\"))
TempPS = AppPath & "temp_splash.ps1"

' --- CORRECCION DE RUTA DE IMAGEN ---
' Ajusta el nombre del archivo si es .png o tiene otro nombre
ImagePath = AppPath & "img\logo.jpg" 

' --- PowerShell Splash Screen Code ---
strPS = "Add-Type -AssemblyName System.Windows.Forms, System.Drawing; " & vbCrLf & _
        "$img = [System.Drawing.Image]::FromFile('" & ImagePath & "'); " & vbCrLf & _
        "$f = New-Object Windows.Forms.Form; $f.StartPosition='CenterScreen'; $f.Size='710,280'; " & vbCrLf & _
        "$f.FormBorderStyle='None'; $f.BackColor='Orange'; $f.TopMost=$true; " & vbCrLf & _
        "$main = New-Object Windows.Forms.Panel; $main.Size='700,270'; $main.Location='5,5'; $main.BackColor='#1E1E1E'; $f.Controls.Add($main); " & vbCrLf & _
        "$p = New-Object Windows.Forms.PictureBox; $p.Size='230,230'; $p.Image=$img; $p.SizeMode='Zoom'; $p.Location='20,20'; $main.Controls.Add($p); " & vbCrLf & _
        "$lblTitle = New-Object Windows.Forms.Label; $lblTitle.Size='430,40'; $lblTitle.Location='260,50'; $lblTitle.ForeColor='White'; " & vbCrLf & _
        "$lblTitle.Font=New-Object System.Drawing.Font('Segoe UI',22,[System.Drawing.FontStyle]::Bold); " & vbCrLf & _
        "$lblTitle.TextAlign='MiddleCenter'; $lblTitle.Text='RMedic Software'; $main.Controls.Add($lblTitle); " & vbCrLf & _
        "$lblVer = New-Object Windows.Forms.Label; $lblVer.Size='430,30'; $lblVer.Location='260,95'; $lblVer.ForeColor='Orange'; " & vbCrLf & _
        "$lblVer.Font=New-Object System.Drawing.Font('Segoe UI',12,[System.Drawing.FontStyle]::Bold); " & vbCrLf & _
        "$lblVer.TextAlign='MiddleCenter'; $lblVer.Text='Version 3.3.0'; $main.Controls.Add($lblVer); " & vbCrLf & _
        "$lblD = New-Object Windows.Forms.Label; $lblD.Size='430,30'; $lblD.Location='260,140'; $lblD.ForeColor='#68cbd0'; " & vbCrLf & _
        "$lblD.Font=New-Object System.Drawing.Font('Segoe UI',10,[System.Drawing.FontStyle]::Italic); $lblD.TextAlign='MiddleCenter'; $main.Controls.Add($lblD); " & vbCrLf & _
        "$baseBar = New-Object Windows.Forms.Panel; $baseBar.Size='380,6'; $baseBar.Location='285,190'; $baseBar.BackColor='#333333'; $main.Controls.Add($baseBar); " & vbCrLf & _
        "$progressBar = New-Object Windows.Forms.Panel; $progressBar.Size='10,6'; $progressBar.BackColor='Orange'; $baseBar.Controls.Add($progressBar); " & vbCrLf & _
        "$f.Show(); " & vbCrLf & _
        "$lblD.Text='Scanning system resources...'; for($i=10; $i -le 160; $i+=2){ $progressBar.Width=$i; [System.Windows.Forms.Application]::DoEvents(); Start-Sleep -m 30 }; " & vbCrLf & _
        "$lblD.Text='Starting R Engine & Modules...'; " & vbCrLf & _
        "do { " & vbCrLf & _
        "  if($progressBar.Width -lt 360){ $progressBar.Width += 4 } else { $progressBar.Width = 160 }; " & vbCrLf & _
        "  [System.Windows.Forms.Application]::DoEvents(); " & vbCrLf & _
        "  $check = Get-NetTCPConnection -LocalPort 1410 -ErrorAction SilentlyContinue | Where-Object { $_.State -eq 'Listen' }; " & vbCrLf & _
        "  Start-Sleep -m 150; " & vbCrLf & _
        "} while (!$check); " & vbCrLf & _
        "$progressBar.Width=380; $progressBar.BackColor='Lime'; $lblD.ForeColor='Lime'; $lblD.Text='System Ready!'; [System.Windows.Forms.Application]::DoEvents(); Start-Sleep -m 1200; $f.Close();"

' Guardar el script temporal en ANSI
Set objFile = fso.CreateTextFile(TempPS, True, False)
objFile.Write strPS
objFile.Close

' Lanzar Splash
WshShell.Run "powershell -ExecutionPolicy Bypass -WindowStyle Hidden -File """ & TempPS & """", 0, False

' Delay de 3 segundos para lucir el Splash de RMedic
WScript.Sleep 3000

' Lanzar el BAT (Asegurate que el nombre del BAT sea correcto)
WshShell.Run "cmd /c " & Chr(34) & Chr(34) & AppPath & "Lanzar_RMedic3_2026.bat" & Chr(34) & Chr(34), 0, False

' Cleanup
WScript.Sleep 60000
On Error Resume Next
fso.DeleteFile(TempPS)