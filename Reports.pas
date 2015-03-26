unit Reports;

interface

uses
  frxClass, ADODB;

procedure contractChanges(dateBegin: TDateTime; dateEnd: TDateTime);

implementation

uses
  main;

procedure contractChanges(dateBegin: TDateTime; dateEnd: TDateTime);
var
 report : TfrxReport;
 dataSet : TADODataSet;
begin
  report := Form1.frxReport1;
  report.LoadFromFile('c:\pawn\report\contractChanges.fr3');
  dataSet := Form1.contractChangesDataSet;
   dataSet.Parameters.ParamByName('EventDateBegin').Value := dateBegin;
  dataSet.Parameters.ParamByName('EventDateEnd').Value := dateEnd;

  report.Variables['datebegin']:= dateBegin;
  report.Variables['dateend'] := dateEnd;

  dataSet.Active := true;
  report.Variables['filial'] := '''' + filialNumberMain + '''';
 // report.SaveToFile('C:\bbaa.pdf');
 dataSet.Active := false;
 report.ShowReport(true);
 // report.sa

end;

end.
