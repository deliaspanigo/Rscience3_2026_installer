[Setup]
AppId={{A1B2C3D4-E5F6-7890-ABCD-EF1234567890}
AppName=RMedic3
AppVersion=3.0
AppPublisher=RMedic Team
DefaultDirName={autopf}\RMedic3
DefaultGroupName=RMedic3
; Icon that the program will have once installed in Control Panel
UninstallDisplayIcon={app}\img\logo.ico
Compression=lzma2
SolidCompression=yes
OutputDir=Output
OutputBaseFilename=RMedic3_Installer_v0.0.1
; Icon of the .exe installer file
SetupIconFile=img\logo.ico
; Allows the installer to request administrator privileges
PrivilegesRequired=admin

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "spanish"; MessagesFile: "compiler:Languages\Spanish.isl"

[Tasks]
Name: "desktopicon"; Description: "Create a &desktop icon"; GroupDescription: "Additional icons:"; Flags: checkedonce

[Files]
; Copy main files
Source: "Lanzar_RMedic3.vbs"; DestDir: "{app}"; Flags: ignoreversion
Source: "Lanzar_RMedic3.bat"; DestDir: "{app}"; Flags: ignoreversion

; Copy complete folders maintaining structure
Source: "App\*"; DestDir: "{app}\App"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "img\*"; DestDir: "{app}\img"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "RMedic3\*"; DestDir: "{app}\RMedic3"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
; The shortcut points to the VBS so the console is not visible
; WorkingDir is essential for the VBS to find the BAT
Name: "{group}\RMedic3"; Filename: "{app}\Lanzar_RMedic3.vbs"; WorkingDir: "{app}"; IconFilename: "{app}\img\logo.ico"
Name: "{commondesktop}\RMedic3"; Filename: "{app}\Lanzar_RMedic3.vbs"; WorkingDir: "{app}"; IconFilename: "{app}\img\logo.ico"; Tasks: desktopicon

[Run]
; Option to launch the app immediately after installation
Filename: "{app}\Lanzar_RMedic3.vbs"; Description: "Launch RMedic3"; Flags: shellexec postinstall skipifsilent