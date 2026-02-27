Set WshShell = CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")
AppPath = Left(WScript.ScriptFullName, InStrRev(WScript.ScriptFullName, "\"))
TempPS = AppPath & "temp_splash.ps1"
ImagePath = AppPath & "img\logo.jpg"

' Código de PowerShell con Barra de Carga Dinámica
strPS = "Add-Type -AssemblyName System.Windows.Forms, System.Drawing; " & vbCrLf & _
        "$img = [System.Drawing.Image]::FromFile('" & ImagePath & "'); " & vbCrLf & _
        "$f = New-Object Windows.Forms.Form; $f.StartPosition='CenterScreen'; $f.Size='710,260'; " & vbCrLf & _
        "$f.FormBorderStyle='None'; $f.BackColor='Orange'; $f.TopMost=$true; " & vbCrLf & _
        "$main = New-Object Windows.Forms.Panel; $main.Size='700,250'; $main.Location='5,5'; $main.BackColor='#1E1E1E'; $f.Controls.Add($main); " & vbCrLf & _
        "$p = New-Object Windows.Forms.PictureBox; $p.Size='250,250'; $p.Image=$img; $p.SizeMode='Zoom'; $main.Controls.Add($p); " & vbCrLf & _
        "$lbl = New-Object Windows.Forms.Label; $lbl.Size='430,60'; $lbl.Location='260,60'; $lbl.ForeColor='White'; " & vbCrLf & _
        "$lbl.Font=New-Object System.Drawing.Font('Segoe UI',18,[System.Drawing.FontStyle]::Bold); " & vbCrLf & _
        "$lbl.TextAlign='MiddleCenter'; $lbl.Text='Data Analysis for Medicine'; $main.Controls.Add($lbl); " & vbCrLf & _
        "$lblD = New-Object Windows.Forms.Label; $lblD.Size='430,30'; $lblD.Location='260,140'; $lblD.ForeColor='#68cbd0'; " & vbCrLf & _
        "$lblD.Font=New-Object System.Drawing.Font('Segoe UI',10,[System.Drawing.FontStyle]::Italic); $lblD.TextAlign='MiddleCenter'; $main.Controls.Add($lblD); " & vbCrLf & _
        "$baseBar = New-Object Windows.Forms.Panel; $baseBar.Size='380,6'; $baseBar.Location='285,180'; $baseBar.BackColor='#333333'; $main.Controls.Add($baseBar); " & vbCrLf & _
        "$progressBar = New-Object Windows.Forms.Panel; $progressBar.Size='10,6'; $progressBar.BackColor='Orange'; $baseBar.Controls.Add($progressBar); " & vbCrLf & _
        "$f.Show(); " & vbCrLf & _
        "$lblD.Text='Loading software...'; for($i=10; $i -le 150; $i+=5){ $progressBar.Width=$i; Start-Sleep -m 50 }; " & vbCrLf & _
        "$lblD.Text='Loading reporting modules...'; for($i=150; $i -le 280; $i+=5){ $progressBar.Width=$i; Start-Sleep -m 50 }; " & vbCrLf & _
        "$lblD.Text='Initializing R Engine...'; " & vbCrLf & _
        "do { " & vbCrLf & _
        "  if($progressBar.Width -lt 380){ $progressBar.Width += 2 } else { $progressBar.Width = 10 }; " & vbCrLf & _
        "  Start-Sleep -m 200; " & vbCrLf & _
        "} while ((Get-Process | Where-Object { $_.MainWindowTitle -like '*Medicina y R*' }).Count -eq 0); " & vbCrLf & _
        "$progressBar.Width=380; $progressBar.BackColor='Lime'; $lblD.ForeColor='Lime'; $lblD.Text='Soft Ready!'; Start-Sleep -s 2; $f.Close();"

' Crear el archivo temporal .ps1
Set objFile = fso.CreateTextFile(TempPS, True)
objFile.Write strPS
objFile.Close

' 1. Ejecutar el Splash
WshShell.Run "powershell -ExecutionPolicy Bypass -WindowStyle Hidden -File """ & TempPS & """", 0, False

' 2. Pequeño delay y lanzar el BAT
WScript.Sleep 1500
WshShell.Run "cmd /c " & Chr(34) & Chr(34) & AppPath & "Lanzar_RMedic3_2026.bat" & Chr(34) & Chr(34), 0, True

' 3. Borrar el temporal al terminar
On Error Resume Next
fso.DeleteFile(TempPS)