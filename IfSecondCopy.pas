unit IfSecondCopy;

interface

uses  Windows;

var yes:boolean;

implementation

var

hMutex : integer;
begin
yes:=false;
hMutex:=CreateMutex(nil,TRUE,'antoxa_pown');
if GetLastError <> 0 then yes:=true;
ReleaseMutex(hMutex);
end.
