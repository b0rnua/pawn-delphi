unit sprice_form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, ADODB;

type
  Tsprice = class(TForm)
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
  private
    procedure UpdateData;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  sprice: Tsprice;

implementation

uses main;

{$R *.dfm}

procedure Tsprice.Button2Click(Sender: TObject);
begin
close;
end;

procedure Tsprice.UpdateData;
begin

end;
end.
