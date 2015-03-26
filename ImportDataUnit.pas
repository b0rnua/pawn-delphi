unit ImportDataUnit;

interface

type
  ImportData = class (TObject)
  private
    folderIndex : Integer;
  public
    procedure setFolderIndex(folderIndex : Integer);
    function getFolderIndex() : Integer;
end;


implementation

procedure ImportData.setFolderIndex(folderIndex : Integer);
begin
  ImportData.folderIndex := folderIndex;
end;

function ImportData.getFolderIndex() : Integer;
begin
  return ImportData.folderIndex;
end;

end.
