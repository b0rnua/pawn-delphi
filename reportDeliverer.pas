unit reportDeliverer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, DateUtils, DANADO, ADODB, ComObj;

type

  TDateRange = Class(TObject)
    public
      myArr : Array [1..31,0..23,0..1] of Integer;
      minHour : Integer;
      maxHour : Integer;
      maxDays : Integer;
      dayWeek : Integer;
      function getDateBegin : String;
      function getDateEnd : String;
      procedure setDateRangeByMonthID(monthId : Integer);
      procedure incDayWeek(dayWeek : Integer);
    private
      dateBegin : String;
      dateEnd : String;
      function getMonthEnd(month1 : Integer) : String;
      function getMonthBegin(month1 : Integer) : String;
  End;
  TForm16 = class(TForm)
    Button1: TButton;
    ComboBox1: TComboBox;
    procedure Button1Click(Sender: TObject);
    function fillComboBoxByMONTH(cb1 : TCombobox) : TCombobox;
    procedure FormShow(Sender: TObject);
    procedure createReportByDateRange(dr : TdateRange);
    procedure fillEXCEL(dr : TDateRange);
    function createFillColor(dr : TDateRange) : TDAteRange;
    function getFillColor(max,maxAv,av,minAv,min,tmp : Double) : Integer;
    function getColor(id1 : Integer) : Integer;
  //  function clearMy( my : Array of Integer) :
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  Form16: TForm16;
  dateRange : TDateRange;

implementation

{$R *.dfm}

procedure TForm16.Button1Click(Sender: TObject);
var
  dr : TDateRange;
begin
  dr := TDateRange.Create;
  dr.setDateRangeByMonthID(comboBox1.ItemIndex+1);

  createReportByDateRange(dr);
  form16.Close;
end;


function TForm16.createFillColor(dr: TDateRange): TDAteRange;
var
  i,j,p, count : Integer;
  res : TDateRange;
  max,maxAv,av,minAv,min,summ : Double;
begin


  for I := 1 to dr.maxDays do begin
    count := 0;
    max := 0;
    maxAv := 0;
    av := 0;
    minAv := 0;
    min := 0;
    summ := 0;
    for j := dr.minHour to dr.maxHour do begin
      if (dr.myArr[i][j][0] > max) then max := dr.myArr[i][j][0];
      summ := summ + dr.myArr[i][j][0];
      inc(count);
    end;
    av := summ/count;
    maxAv := (max+av)/2;
    minAv := (min+av)/2;
   // ShowMessage('MAX= ' + FloatToStr(max) + ' maxAV= ' + FloatToStr(maxAv) + ' av= ' + FloatToStr(av) + ' minAv= ' + FloatToStr(minAv) + ' min= ' + FloatToStr(min));
    for p := dr.minHour to dr.maxHour do begin
      dr.myArr[i][p][1] := getFillColor(max,maxAv,av,minAv,min,dr.myArr[i][p][0]);
    end;

  end;
  RESULT := dr;
end;

procedure TForm16.createReportByDateRange(dr: TdateRange);
var
  q1 : TADOQuery;
  sql1 : String;
  myStr : String;
  myDay : Integer;
  myHour : Integer;
  i,j : Integer;
begin
  q1 := TADOQUery.Create(nil);
  q1.ConnectionString := danado.utils.getConnectionString;

  dr.minHour := 23;
  dr.maxHour := 0;
   // Clear ARRay
  for I := 1 to dr.maxDays do begin
    for J := 0 to 23 do begin
      dr.myArr[i][j][0] := 0;
    end;
  end;

  sql1 := 'SELECT * FROM operation WHERE ((date_op>=:pDateBegin) AND (date_op<=:pDateEnd)) AND ((op=1) OR (op=2)) AND (timeStampField is not null) ORDER BY date_op';
  q1.SQL.Add(sql1);
  q1.Parameters.ParamByName('pDateBegin').Value := dr.getDateBegin;
  q1.Parameters.ParamByName('pDateEnd').Value := dr.getDateEnd;
  with q1 do begin
  q1.Open;
  //ShowMessage(IntToStr(q1.RecordCount));
    while not eof do begin
      myStr := q1.FieldByName('timeStampField').AsString;
      myHour := StrToInt(myStr[Length(myStr)-7]+myStr[Length(myStr)-6]);
      if (myHour < dr.minHour) then dr.minHour := myHour;
      if (myHour > dr.maxHour) then dr.maxHour := myHour;
      myDay := StrToInt(myStr[1]+myStr[2]);
      dr.myArr[myDay][myHour][0] := dr.myArr[myDay][myHour][0] +1;
      next;
    end;
  end;
  dr := createFillColor(dr);
  fillEXCEL(dr);
end;

function TForm16.fillComboBoxByMONTH(cb1 : TComboBox): TCombobox;

begin
  cb1.Items.Clear;
  cb1.Items.Add('Январь');
  cb1.Items.Add('Февраль');
  cb1.Items.Add('Март');
  cb1.Items.Add('Апрель');
  cb1.Items.Add('Май');
  cb1.Items.Add('Июнь');
  cb1.Items.Add('Июль');
  cb1.Items.Add('Август');
  cb1.Items.Add('Сентябрь');
  cb1.Items.Add('Октябрь');
  cb1.Items.Add('Ноябрь');
  cb1.Items.Add('Декабрь');
  cb1.Items.Add('2014');
  cb1.ItemIndex := MonthOfTheYear(now)-1;
  RESULT := cb1;
end;

procedure TForm16.fillEXCEL(dr: TDateRange);
var
  ex : Variant;
  i , j , p, k: Integer;
begin
  ex := CreateOleObject('Excel.Application');
  ex.WorkBooks.Add('C:\Pawn\report\delivererReport.xls');
  ex.DisplayAlerts := false;

  ex.Cells[1,1] := 'Ло№'+DANADO.utils.getLombardName +' За '+ comboBox1.Items[Combobox1.ItemIndex];
  ex.Cells[1,1].columnWidth := 15;


  for I := 1 to dr.maxDays do begin

    if (dr.dayWeek = 6) OR (dr.dayWeek = 7) then begin
    ex.Cells[i+1,1].interior.color := rgb(235,175,125);
    end else begin
    ex.Cells[i+1,1].interior.color := rgb(185,235,125);
    end;
    if (dr.dayWeek <> 0) then  dr.incDayWeek(dr.dayWeek);

    ex.Cells[i+1,1] := IntToStr(i);
  end;

  k := 2;
  for I := dr.minHour to dr.maxHour do begin
    ex.Cells[1,k] := i;
    inc(k);
  end;

  for I := 1 to dr.maxDays do begin
    p :=1;
    for j := dr.minHour to dr.maxHour do begin
      ex.Cells.Item[i+1,p+1] := dr.myArr[i][j][0];
      ex.Cells.Item[i+1,p+1].Columnwidth := 3;
      ex.Cells.Item[i+1,p+1].interior.color := getColor(dr.myArr[i][j][1]);
      p := p +1;
    end;
  end;
  ex.Visible := True;
  //ex.destroy;
end;

procedure TForm16.FormShow(Sender: TObject);
begin
  ComboBox1 := fillComboBoxByMONTH(comboBox1);
end;

function TForm16.getColor(id1: Integer): Integer;
var
  res : Integer;
begin
  case id1 of
    0 : res := rgb(255,105,107) ;
    1 : res := rgb(255,150,115);
    2 : res := rgb(255,190,123);
    3 : res := rgb(255,235,132);
    4 : res := rgb(206,223,132);
    5 : res := rgb(156,207,123);
    6 : res := rgb(99,190,123);
  end;
  RESULT := res;
end;

function TForm16.getFillColor(max, maxAv, av, minAv, min, tmp: Double): Integer;
var
  res : Integer;
begin

  if (tmp = max) then begin
    res := 6;
    RESULT := res;
  end;

  if (tmp >= maxAv) AND (tmp < max) then  begin
    res := 5;
    RESULT := res;
  end;  

  if (tmp > av) AND (tmp < maxAv) then  begin
    res := 4;
    RESULT := res;
  end;

  if (tmp = av) then  begin
    res := 3;
    RESULT := res;
  end;

  if (tmp >= minAv) AND (tmp < Av) then  begin
    res := 2;
    RESULT := res;
  end;

  if (tmp > min) AND (tmp < minAv) then  begin
    res := 1;
    RESULT := res;
  end;

  if (tmp = min) then  begin
    res := 0;
    RESULT := res;
  end;

end;

{ dateRange }

function TDateRange.getDateBegin: String;
begin
  RESULT := self.dateBegin;
end;

function TDateRange.getDateEnd: String;
begin
  RESULT := self.dateEnd;
end;

function TDateRange.getMonthBegin(month1: Integer): String;
var
  res : String;
  AYear,AMonth,ADay : word;
begin
  DecodeDate(Now,AYear,AMonth,ADay);
  res := DateToStr(EncodeDate(AYear, month1, 1));
  RESULT := res;
end;

function TDateRange.getMonthEnd(month1: Integer): string;
var
  res : String;
  AYear,AMonth,ADay : word;
begin
  DecodeDate(Now,AYear,AMonth,ADay);
  res := DateToStr(EndOfAMonth(AYear, month1));
  RESULT := res;
end;

procedure TDateRange.incDayWeek(dayWeek: Integer);
begin
if (dayWeek = 7) then self.dayWeek := 1
  else inc(self.dayWeek);
end;

procedure TDateRange.setDateRangeByMonthID(monthId: Integer);
begin
  if (monthId <> 13) then  begin
  self.dateBegin := getMonthBegin(monthId);
  self.dateEnd := getMonthEnd(monthId);
  self.maxDays := StrToInt(self.dateEnd[1]+self.dateEnd[2]);
  self.dayWeek := DayOfTheWeek(StrToDate(getMonthBegin(monthId)));
 // ShowMessage(IntToStr(self.dayWeek));
  end else begin
     self.dateBegin := getMonthBegin(1);
     self.dateEnd := DateToStr(now());
     self.maxDays := 31;
     self.dayWeek := 0;
  end;
end;

end.
