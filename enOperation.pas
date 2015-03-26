unit enOperation;

interface

uses
  SysUtils,Dialogs;

type
  TENoperation2 = class(TObject)
    private
      id,op,id_contract_op	: Integer;
      date_op : TDate;
      sum_op, percent_op,delay_op : Double;
      TimestampField : TDateTime;
    public
      constructor Create Overload;
      constructor Create(id_contract_op1 : Integer) Overload;
      procedure setId(id1 : Integer);
      procedure setOp(op1 : Integer);
      procedure setId_contract_op(id_contract_op1 : Integer);
      procedure setDate_op(date_op1 : TDate);
      procedure setSum_op(sum_op1 : Double);
      procedure setPercent_op(percent_op1 : Double);
      procedure setDelay_op(delay_op1 : Double);
      procedure setTimestampField(TimestampField : TDATETIME);
      function getId(): Integer;
      function getOp(): Integer;
      function getId_contract_op(): Integer;
      function getDate_op(): TDate;
      function getSum_op(): Double;
      function getPercent_op(): Double;
      function getdelay_op(): Double;
      function getTimestampField() : TDATETIME;
  end;

  TENoperation = class(TObject)
    public
      o : Array[0..1] of TENoperation2;
      count : Integer;
  end;

implementation
uses ADODB,DANADO;

{ TENoperation }

constructor TENoperation2.Create(id_contract_op1 : Integer);
// ≈ѕ»–ј÷»» бывают и без контракта (приход=расход)
var
  q1 : TADOQuery;
  sql1 : String;
begin
  q1 := TADOQuery.Create(nil);
  q1.ConnectionString:= DANado.utils.getConnectionString;
  sql1 :='SELECT * FROM operation WHERE id_contract_op =:pId_contract_op ';
  q1.SQL.Add(sql1);
  q1.Parameters.ParamByName('pId_Contract_op').Value := id_contract_op1;

  try
    q1.Open;
    self.setId(q1.FieldByName('id').AsInteger);
    self.setOp(q1.FieldByName('op').AsInteger);
    self.setId_contract_op(q1.FieldByName('id_contract_op').AsInteger);
    self.setDate_op(q1.FieldByName('date_op').AsDateTime);
    self.setSum_op(q1.FieldByName('sum_op').AsFloat);
    self.setPercent_op(q1.FieldByName('percent_op').AsFloat);
    self.setDelay_op(q1.FieldByName('delay_op').AsFloat);
    self.setTimestampField(q1.FieldByName('TimestampField').AsDateTime);
  except
  on e: Exception do
    begin
      self.id := 0;
      self.op := 0;
      self.id_contract_op := 0;
      self.date_op := 01/01/2010;
      self.sum_op := 0.0;
      self.percent_op := 0.0;
      self.delay_op := 0.0;
      self.TimestampField := now();
    end;

  end;

end;

constructor TENoperation2.Create;
begin
  self.id := 0;
  self.op := 0;
  self.id_contract_op := 0;
  self.date_op := 01/01/2010;
  self.sum_op := 0.0;
  self.percent_op := 0.0;
  self.delay_op := 0.0;
  self.TimestampField := now();
end;


function TENoperation2.getDate_op: TDate;
begin
  RESULT := self.date_op;
end;

function TENoperation2.getDelay_op: Double;
begin
  RESULT := self.delay_op
end;

function TENoperation2.getId: Integer;
begin
  RESULT := self.id
end;

function TENoperation2.getId_contract_op: Integer;
begin
  RESULT := self.id_contract_op
end;


function TENoperation2.getOp: Integer;
begin
  RESULT := self.op;
end;

function TENoperation2.getPercent_op: Double;
begin
  RESULT := self.percent_op;
end;

function TENoperation2.getSum_op: Double;
begin
  RESULT := self.sum_op;
end;


function TENoperation2.getTimestampField: TDATETIME;
begin
  RESULT := self.TimestampField;
end;

procedure TENoperation2.setDate_op(date_op1: TDate);
begin
  self.date_op := date_op1;
end;

procedure TENoperation2.setDelay_op(delay_op1: Double);
begin
  self.delay_op := delay_op1;
end;

procedure TENoperation2.setId(id1: Integer);
begin
  self.id := id1;
end;

procedure TENoperation2.setId_contract_op(id_contract_op1: Integer);
begin
  self.id_contract_op := id_contract_op1;
end;

procedure TENoperation2.setOp(op1: Integer);
begin
  self.op := op1;
end;

procedure TENoperation2.setPercent_op(percent_op1: Double);
begin
  self.percent_op := percent_op1;
end;

procedure TENoperation2.setSum_op(sum_op1: Double);
begin
  self.sum_op := sum_op1;
end;

procedure TENoperation2.setTimestampField(TimestampField: TDATETIME);
begin
  self.TimestampField := TimestampField;
end;

end.
