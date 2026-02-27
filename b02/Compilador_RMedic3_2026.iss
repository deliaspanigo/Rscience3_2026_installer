[Setup]
AppId={{A1B2C3D4-E5F6-7890-ABCD-EF1234567890}
AppName=RMedic3
AppVersion=0.0.2
DefaultDirName={localappdata}\RMedic3
DisableDirPage=no
AppendDefaultDirName=yes
DefaultGroupName=RMedic3
UninstallDisplayIcon={app}\img\logo.ico
Compression=lzma2
SolidCompression=yes
OutputDir=Output
OutputBaseFilename=RMedic3_2026_v0.0.2
PrivilegesRequired=lowest
SetupIconFile=img\logo.ico

; --- CONFIGURACIÓN DE LOGOS ---
WizardImageFile=img\logo_big.bmp
WizardSmallImageFile=img\logo_small.bmp
WizardImageStretch=yes
WizardImageBackColor=clWhite

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
Source: "Lanzar_RMedic3_2026.vbs"; DestDir: "{app}"; Flags: ignoreversion
Source: "Lanzar_RMedic3_2026.bat"; DestDir: "{app}"; Flags: ignoreversion
Source: "App\*"; DestDir: "{app}\App"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "img\*"; DestDir: "{app}\img"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "RMedic3_2026\*"; DestDir: "{app}\RMedic3_2026"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{group}\RMedic3"; Filename: "{app}\Lanzar_RMedic3_2026.vbs"; WorkingDir: "{app}"; IconFilename: "{app}\img\logo.ico"
Name: "{userdesktop}\RMedic3"; Filename: "{app}\Lanzar_RMedic3_2026.vbs"; WorkingDir: "{app}"; IconFilename: "{app}\img\logo.ico"

[Run]
Filename: "{app}\Lanzar_RMedic3_2026.vbs"; Description: "Launch RMedic3 now"; Flags: postinstall shellexec nowait

[UninstallDelete]
Type: filesandordirs; Name: "{app}\App"
Type: filesandordirs; Name: "{app}\RMedic3_2026"
Type: filesandordirs; Name: "{app}"

[Code]
// 1. Ocultar la imagen lateral en la última página para evitar distorsión
procedure CurPageChanged(CurPageID: Integer);
begin
  if CurPageID = wpFinished then
  begin
    WizardForm.WizardBitmapImage.Visible := False;
  end;
end;

// 2. Limpieza agresiva de R-Portable al desinstalar
procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep);
var
  AppDir: String;
begin
  if CurUninstallStep = usPostUninstall then
  begin
    AppDir := ExpandConstant('{app}');
    if DirExists(AppDir) then
    begin
      DelTree(AppDir, True, True, True);
    end;
  end;
end;