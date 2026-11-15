; MStudio Live (rebranded SonoBus 1.7.2) Inno Setup installer
; 64-bit only: Standalone application + VST3 plugins (MStudio Live + MStudio Live Instrument)
; Code signing: the [Setup] SignTool entry needs a sign tool named "signtool",
; defined by distwin.sh via iscc /Ssigntool=... (requires CERTFILE).
; For an unsigned test build, remove the SignTool line below and set SignedUninstaller=no.

[Setup]
AppName=MStudio Live
AppVersion={#SBVERSION}
MinVersion=6.1
WizardStyle=modern
DefaultDirName={autopf}\MStudio Live
DefaultGroupName=MStudio Live
UninstallDisplayIcon={app}\MStudioLive.exe
Compression=lzma2
SolidCompression=yes
ArchitecturesAllowed=x64
ArchitecturesInstallIn64BitMode=x64
OutputBaseFilename=MStudioLive-{#SBVERSION}-Installer
LicenseFile=gpl-3.0.txt
SetupLogging=yes
SignTool=signtool $f
SignedUninstaller=yes
DisableReadyPage=true
DisableWelcomePage=yes
DisableDirPage=no
ShowComponentSizes=no

[Types]
Name: "full"; Description: "Full installation"
Name: "custom"; Description: "Custom installation"; Flags: iscustom


[Components]
Name: "app"; Description: "Standalone 64-bit application (.exe)"; Types: full custom; Check: Is64BitInstallMode
Name: "vst3_64"; Description: "64-bit VST3 Plugins (.vst3)"; Types: full custom; Check: Is64BitInstallMode



[Files]
Source: "MStudioLive\MStudioLive.exe"; DestDir: "{app}"; Check: Is64BitInstallMode; Components: app; Flags: ignoreversion signonce
Source: "MStudioLive\Plugins\VST3\MStudioLive.vst3"; DestDir: "{commoncf}\VST3"; Check: Is64BitInstallMode; Components: vst3_64; Flags: ignoreversion signonce recursesubdirs createallsubdirs
Source: "MStudioLive\Plugins\VST3\MStudioLiveInstrument.vst3"; DestDir: "{commoncf}\VST3"; Check: Is64BitInstallMode; Components: vst3_64; Flags: ignoreversion signonce recursesubdirs createallsubdirs

Source: "MStudioLive\README.txt"; DestDir: "{app}"; DestName: "README.txt"; Flags: isreadme


[InstallDelete]
Type: files; Name: "{commoncf}\VST3\MStudioLive.vst3"
Type: files; Name: "{commoncf}\VST3\MStudioLiveInstrument.vst3"
; remove upstream SonoBus plugin files if a user is replacing SonoBus
Type: files; Name: "{commoncf}\VST3\SonoBus.vst3"
Type: files; Name: "{commoncf}\VST3\SonoBusInstrument.vst3"



[Icons]
Name: "{group}\MStudio Live"; Filename: "{app}\MStudioLive.exe"
Name: "{group}\README"; Filename: "{app}\README.txt"
Name: "{group}\Uninstall MStudio Live"; Filename: "{app}\unins000.exe"

[Registry]
Root: HKCR; Subkey: "mstudiolive"; ValueType: "string"; ValueData: "URL:mstudiolive Protocol"; Flags: uninsdeletekey
Root: HKCR; Subkey: "mstudiolive"; ValueType: "string"; ValueName: "URL Protocol"; ValueData: ""
Root: HKCR; Subkey: "mstudiolive\DefaultIcon"; ValueType: "string"; ValueData: "{app}\MStudioLive.exe,0"
Root: HKCR; Subkey: "mstudiolive\shell\open\command"; ValueType: "string"; ValueData: """{app}\MStudioLive.exe"" ""%1"""


[Code]
var
  OkToCopyLog : Boolean;
  TypesComboOnChangePrev: TNotifyEvent;


procedure CurStepChanged(CurStep: TSetupStep);
begin
  if CurStep = ssDone then
    OkToCopyLog := True;
end;

procedure DeinitializeSetup();
begin
  if OkToCopyLog then
    FileCopy (ExpandConstant ('{log}'), ExpandConstant ('{app}\InstallationLogFile.log'), FALSE);
  RestartReplace (ExpandConstant ('{log}'), '');
end;



procedure ComponentsListCheckChanges;
begin
  WizardForm.NextButton.Enabled := (WizardSelectedComponents(False) <> '');
end;

procedure ComponentsListClickCheck(Sender: TObject);
begin
  ComponentsListCheckChanges;
end;

procedure TypesComboOnChange(Sender: TObject);
begin
  TypesComboOnChangePrev(Sender);
  ComponentsListCheckChanges;
end;

procedure InitializeWizard;
begin
  WizardForm.ComponentsDiskSpaceLabel.Visible := False;
  WizardForm.ComponentsList.OnClickCheck := @ComponentsListClickCheck;
  TypesComboOnChangePrev := WizardForm.TypesCombo.OnChange;
  WizardForm.TypesCombo.OnChange := @TypesComboOnChange;
end;


[UninstallDelete]
Type: files; Name: "{app}\InstallationLogFile.log"
