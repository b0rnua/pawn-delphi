unit sclient_form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, ADODB, StdCtrls;

type
  Tsclients = class(TForm)
    ADOConnection1: TADOConnection;
    ADODataSet1: TADODataSet;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label1: TLabel;
    Button4: TButton;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure UpdateData;
  end;

var
  sclients: Tsclients;
  iClientID: double;
  bSaleGroup: Byte;
  sSaleGroup: string;

implementation

uses newContract_form, main;

{$R *.dfm}

procedure Tsclients.FormCreate(Sender: TObject);
var
  i: byte;
begin
For i := 0 to 7 do
begin
  DBGrid1.Columns[i].Width := 110;
end;
  DBGrid1.Columns[0].Title.Caption := 'ФИО';
  DBGrid1.Columns[1].Title.Caption := 'Дата рождения';
  DBGrid1.Columns[2].Title.Caption := 'Адрес';
  DBGrid1.Columns[3].Title.Caption := 'Серия паспорта';
  DBGrid1.Columns[4].Title.Caption := '№ паспорта';
  DBGrid1.Columns[5].Title.Caption := 'Кем выдан паспорт';
  DBGrid1.Columns[6].Title.Caption := 'Дата выдачи';
  DBGrid1.Columns[7].Title.Caption := 'ИНН';
  DBGrid1.Columns[8].Title.Caption := 'Телефон';
end;

procedure Tsclients.UpdateData;
begin
  ADODataSet1.UpdateBatch;
end;

procedure Tsclients.Button1Click(Sender: TObject);
begin
  UpdateData;
  Close;
end;

procedure Tsclients.Button2Click(Sender: TObject);
begin
  ADODataSet1.Delete;
end;


procedure Tsclients.Button3Click(Sender: TObject);
begin
  iClientID := DBGrid1.DataSource.DataSet.FieldByName('id').AsInteger;
  bSaleGroup := DBGrid1.DataSource.DataSet.FieldByName('id_tarif').AsInteger;
  sSaleGroup := 'Group'+IntToStr(bSaleGroup);
  if iClientID>0 then
    newContract.client.Text := DBGrid1.DataSource.DataSet.FieldByName('name').AsString;
    // newContract.Label10.Caption := DBGrid1.DataSource.DataSet.FieldByName('id').AsString;
  UpdateData;
  Close;
end;

procedure Tsclients.Button4Click(Sender: TObject);
begin
  Close;
end;

procedure Tsclients.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  ADODataSet1.Active := false;
  ADODataSet1.CommandText := 'SELECT * FROM deliverer WHERE deliverer.name LIKE :pename ORDER BY name';
  ADODataSet1.Parameters.ParamByName('pename').Value := Edit1.Text+'%';
  ADODataSet1.Active := true;
end;

procedure Tsclients.Edit1Click(Sender: TObject);
begin
  Edit1.Text := '';
  Edit1.Font.Color := clNone;
end;

end.
