program PPrinterList;

uses
  Forms,
  FMainList in 'FMainList.pas' {FormMain},
  FormAbout in '..\..\sources\FormAbout.pas' {FAbout};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
