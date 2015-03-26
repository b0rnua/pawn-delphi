unit subject_form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB;

type
  TSugject = class(TForm)
    ds1: TADODataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Sugject: TSugject;

implementation

{$R *.dfm}

end.
