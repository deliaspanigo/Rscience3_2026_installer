[Setup]
AppId={{A1B2C3D4-E5F6-7890-ABCD-EF1234567890}
AppName=RMedic3
AppVersion=0.0.1
; Installing in the local user folder to ensure write permissions for R
DefaultDirName={localappdata}\RMedic3
DefaultGroupName=RMedic3
UninstallDisplayIcon={app}\img\logo.ico
Compression=lzma2
SolidCompression=yes
OutputDir=Output
OutputBaseFilename=RMedic3_2026_UserPath_v0.0.1
; Lower privileges to avoid conflicts with System/Admin folders [cite: 3]
PrivilegesRequired=lowest
SetupIconFile=img\logo.ico

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
; Launcher scripts
Source: "Lanzar_RMedic3_2026.vbs"; DestDir: "{app}"; Flags: ignoreversion
Source: "Lanzar_RMedic3_2026.bat"; DestDir: "{app}"; Flags: ignoreversion
; Application folders
Source: "App\*"; DestDir: "{app}\App"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "img\*"; DestDir: "{app}\img"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "RMedic3_2026\*"; DestDir: "{app}\RMedic3_2026"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
; Main Shortcut with Icon pointing to the img folder
Name: "{group}\RMedic3"; Filename: "{app}\Lanzar_RMedic3_2026.vbs"; WorkingDir: "{app}"; IconFilename: "{app}\img\logo.ico"
; Desktop Shortcut
Name: "{userdesktop}\RMedic3"; Filename: "{app}\Lanzar_RMedic3_2026.vbs"; WorkingDir: "{app}"; IconFilename: "{app}\img\logo.ico"

[Run]
; Launch the app automatically after installation
Filename: "{app}\Lanzar_RMedic3_2026.vbs"; Description: "Launch RMedic3 now"; Flags: postinstall shellexec nowait