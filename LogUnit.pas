unit LogUnit;

interface

uses

  SysUtils, Classes;

procedure WriteAction(str:string);


implementation

procedure WriteAction(str:string);

Var

  F: TextFile;

begin

  str := DateToStr(Date)+'|'+TimeToStr(time)+'|'+str;

  AssignFile(F, 'C:/Pawn/Log.ucs');

  try

  Append(F);

  except

    on E: Exception do begin

      Rewrite(f);

    end;

  end;

  WriteLn(F,str);

  CloseFile(F);

end;

end.
