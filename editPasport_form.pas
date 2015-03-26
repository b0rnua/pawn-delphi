unit editPasport_form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB;

type
  TeditPasport = class(TForm)
    Button1: TButton;
    Button2: TButton;
    GroupBox1: TGroupBox;
    QPasport: TADOQuery;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    StaticText4: TLabel;
    StaticText3: TLabel;
    StaticText1: TLabel;
    StaticText2: TLabel;
    StaticText5: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  editPasport: TeditPasport;

implementation

uses
  main;

{$R *.dfm}

procedure TeditPasport.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TeditPasport.FormCreate(Sender: TObject);
begin
  QPasport.SQL.Add('SELECT StartContractNumber,EndContractNumber,FreeContractNumber,name_filial,City FROM pasport');
  QPasport.Open;
  Edit2.Text := QPasport.Fields[0].AsString;
  Edit3.Text := QPasport.Fields[1].AsString;
  Edit4.Text := QPasport.Fields[2].AsString;
  Edit1.Text := QPasport.Fields[3].AsString;
  Edit5.Text := QPasport.Fields[4].AsString;
  QPasport.SQL.Clear;
  QPasport.Close;
end;

procedure TeditPasport.Button1Click(Sender: TObject);
begin
  QPasport.SQL.Add('UPDATE pasport SET StartContractNumber=:psnumber,EndContractNumber=:penumber,');
  QPasport.SQL.Add(' FreeContractNumber=:pfnumber,name_filial=:pname,City=:pCity');
  QPasport.Parameters.ParamByName('psnumber').Value := Edit2.Text;
  QPasport.Parameters.ParamByName('penumber').Value := Edit3.Text;
  QPasport.Parameters.ParamByName('pfnumber').Value := Edit4.Text;
  QPasport.Parameters.ParamByName('pname').Value := Edit1.Text;
  QPasport.Parameters.ParamByName('pCity').Value := Edit5.Text;
  QPasport.ExecSQL;
  QPasport.SQL.Clear;
  QPasport.Close;
  Close;
end;

end.
