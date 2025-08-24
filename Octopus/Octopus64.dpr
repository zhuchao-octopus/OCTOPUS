program Octopus64;

uses
  Forms,

  uOctopusAbout in 'uOctopusAbout.pas' {AboutBox} ,
  uOctopusMain in 'uOctopusMain.pas' {MainOctopusDebuggingDevelopmentForm} ,
  uMainSetting in 'uMainSetting.pas' {SettingPagesDlg} ,
  uCommand in 'uCommand.pas' {CommandFrm} ,
  uDownloadsManager in 'uDownloadsManager.pas',
  uDownloader in 'uDownloader.pas' {DownloaderFrm} ,
  uPageSetup in 'uPageSetup.pas' {PageSetupFrm} ,
  uMergeBin in 'uMergeBin.pas' {MergeBinFrm} ,

  uCRC in '..\..\octopus-zsbwm\CRC\uCRC.pas' {CRCFRM} ,
  uEncryptionDecryption in '..\..\octopus-zsbwm\RSAOSSL\uEncryptionDecryption.pas' {DecryptEncryptFrm} ,
  uSMTP in '..\..\octopus-zsbwm\SMTP\uSMTP.pas' {SubmitProblemFrm} ,
  uScreenMain in '..\..\octopus-zsbwm\SCREEN\uScreenMain.pas' {ScreenMainFrm} ,
  uANNDataSetting in '..\..\octopus-zsbwm\SCREEN\uANNDataSetting.pas' {ANNDataSettingFrm} ,
  uCutSetting in '..\..\octopus-zsbwm\SCREEN\uCutSetting.pas' {CutSettingForm} ,
  Screenshot in '..\..\octopus-zsbwm\SCREEN\Screenshot.pas' {ScreenshotFrm} ,

  CPort in '..\ComPort\CPort.pas',
  CPortSetup in '..\ComPort\CPortSetup.pas' {ComSetupFrm} ,
  CPortCtl in '..\ComPort\CPortCtl.pas',
  CPortEsc in '..\ComPort\CPortEsc.pas',
  CPortTrmSet in '..\ComPort\CPortTrmSet.pas' {ComTrmSetForm} ,
  OcComPortObj in 'OcComPortObj.pas',

  //Vcl.MyPageEdit in 'Vcl.MyPageEdit.pas',
  Vcl.Themes,
  Vcl.Styles;


{$R *.res}

begin
  Application.Initialize;
  TStyleManager.TrySetStyle('Emerald Light Slate');
  Application.Title := 'Octopus Serial Port Development & Debugging Assistant';
  Application.CreateForm(TMainOctopusDebuggingDevelopmentForm, MainOctopusDebuggingDevelopmentForm);
  Application.CreateForm(TCommandFrm, CommandFrm);
  Application.CreateForm(TDownloaderFrm, DownloaderFrm);
  Application.CreateForm(TPageSetupFrm, PageSetupFrm);
  Application.CreateForm(TMergeBinFrm, MergeBinFrm);
  Application.CreateForm(TMergeBinFrm, MergeBinFrm);
  Application.CreateForm(TCRCFRM, CRCFRM);
  Application.CreateForm(TDecryptEncryptFrm, DecryptEncryptFrm);
  Application.CreateForm(TSubmitProblemFrm, SubmitProblemFrm);
  Application.CreateForm(TScreenMainFrm, ScreenMainFrm);
  Application.CreateForm(TANNDataSettingFrm, ANNDataSettingFrm);
  Application.CreateForm(TCutSettingForm, CutSettingForm);
  Application.CreateForm(TScreenshotFrm, ScreenshotFrm);
  Application.Run;

end.
