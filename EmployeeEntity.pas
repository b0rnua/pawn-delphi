unit EmployeeEntity;

interface

type
  TEmployee = class(TObject)
    public
      id: Longint;
      name: string;
      warrant_num: integer;
      warrant_date: string;
      hideEmployee: boolean;
      pass: string;
      Instruction: integer;
  end;

implementation

end.
