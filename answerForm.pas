unit answerForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ComObj, DB, ADODB, DANADO;

type
  Tanswer = class(TForm)
    CheckBox1: TCheckBox;
    Button1: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Label1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Label1MouseLeave(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  answer: Tanswer;

implementation

uses
  main;

{$R *.dfm}

procedure Tanswer.Button1Click(Sender: TObject);
var
  q1 : TADOQuery;
begin
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := danado.utils.getConnectionString;
  if (CheckBox1.Checked) then begin
    q1 := TADOQuery.Create(nil);
    q1.ConnectionString := danado.utils.getConnectionString;
    q1.SQL.Add('UPDATE employee SET Instruction=1 WHERE id=:pid');
    q1.PArameters.ParamByName('pid').Value := bIDEmployee;
    q1.ExecSQL;
    q1.Close;
    q1.SQL.Clear;
    q1.Destroy;
  end;
  Close;
end;

procedure Tanswer.Label1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  //Cursor := crHandPoint;
end;

procedure Tanswer.Label1MouseLeave(Sender: TObject);
begin
 // Cursor := crDefault;
end;

procedure Tanswer.Label1Click(Sender: TObject);
var
  MSWord : OleVariant;
begin
  MSWord := CreateOleObject('Word.Application');
  MSWord.Documents.Add('C://Pawn//report//answer.docx');
  MSWord.Visible := True;
  MSWord.Activate;
end;

procedure Tanswer.Label2Click(Sender: TObject);
var
  MSWord : OleVariant;
begin
  MSWord := CreateOleObject('Word.Application');
  MSWord.Documents.Add('C://Pawn//report//instruction.docx');
  MSWord.Visible := True;
  MSWord.Activate;
end;

procedure Tanswer.FormCreate(Sender: TObject);
var
  q1 : TADOQuery;
begin
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString := DANADO.utils.getConnectionString;
  q1.SQL.Add('SELECT Instruction FROM employee WHERE id=:pid');
  q1.Parameters.ParamByName('pid').Value := bIDEmployee;
  q1.Open;
  if (q1.Fields[0].AsFloat <> 0) then begin
    CheckBox1.Checked := True;
    CheckBox1.Enabled := False;
  end;
  q1.Close;
  q1.SQL.Clear;
  q1.Destroy;
end;

end.
