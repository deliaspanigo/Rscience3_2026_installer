[Setup]
AppId={{A1B2C3D4-E5F6-7890-ABCD-EF1234567890}
AppName=RMedic3
AppVersion=0.0.3
DefaultDirName={localappdata}\RMedic3
DisableDirPage=no
AppendDefaultDirName=yes
DefaultGroupName=RMedic3
UninstallDisplayIcon={app}\img\logo.ico
Compression=lzma2
SolidCompression=yes
OutputDir=Output
OutputBaseFilename=RMedic3_2026_v0.0.3
PrivilegesRequired=lowest
SetupIconFile=img\logo.ico

; --- LOGOS ---
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
// Ocultar la imagen y el panel lateral en la última página
procedure CurPageChanged(CurPageID: Integer);
begin
  if CurPageID = wpFinished then
  begin
    // Esto oculta la imagen lateral completamente
    WizardForm.WizardBitmapImage.Visible := False;
    // Esto oculta el panel que contiene la imagen para que el texto se centre
    WizardForm.WizardBitmapImage.Parent.Visible := False;
  end;
end;

// Borrado total de R-Portable
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