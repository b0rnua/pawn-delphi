�
 TSCLIENTS 0�
  TPF0	TsclientssclientsLeftTop� BorderIcons BorderStylebsSingleCaption%   Справочник клиентовClientHeightClientWidth�Color	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTahoma
Font.Style OldCreateOrderPositionpoOwnerFormCenterOnCreate
FormCreatePixelsPerInch`
TextHeight TLabelLabel1LeftXTop� WidthHeight  TDBGridDBGrid1Left Top Width�Height�Ctl3D
DataSourceDataSource1OptionsdgTitlesdgIndicatordgColumnResize
dgColLines
dgRowLinesdgTabsdgConfirmDeletedgCancelOnExit ParentCtl3DTabOrder TitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameTahomaTitleFont.Style ColumnsExpanded	FieldNamenameVisible	 Expanded	FieldNamedate_of_burnVisible	 Expanded	FieldNameadressVisible	 Expanded	FieldNamepasport_serVisible	 Expanded	FieldNamepasport_numVisible	 Expanded	FieldNamepasport_vydanVisible	 Expanded	FieldNamepasport_dateVisible	 Expanded	FieldNameinnVisible	 Expanded	FieldNametelephonVisible	    TButtonButton1Left�Top�WidthKHeightCaption	   !>E@0=8BLTabOrderOnClickButton1Click  TButtonButton2Left�Top�WidthKHeightCaption   #40;8BLTabOrderOnClickButton2Click  TButtonButton3LeftTop�WidthqHeightCaption!   Выбрать/СохранитьTabOrderOnClickButton3Click  TButtonButton4Left8Top�WidthKHeightCaption   B<5=0TabOrderOnClickButton4Click  TEditEdit1Left� Top�WidthyHeightColorclWhiteCtl3DFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameMS Sans Serif
Font.Style ParentCtl3D
ParentFontTabOrderText   Поиск по фамилииOnClick
Edit1Click
OnKeyPressEdit1KeyPress  TADOConnectionADOConnection1ConnectionString=  Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=C:\pawn\data\lo.mdb;Mode=Share Deny None;Persist Security Info=False;Jet OLEDB:System database="";Jet OLEDB:Registry Path="";Jet OLEDB:Database Password="";Jet OLEDB:Engine Type=5;Jet OLEDB:Database Locking Mode=1;Jet OLEDB:Global Partial Bulk Ops=2;Jet OLEDB:Global Bulk Transactions=1;Jet OLEDB:New Database Password="pep01PER";Jet OLEDB:Create System Database=False;Jet OLEDB:Encrypt Database=False;Jet OLEDB:Don't Copy Locale on Compact=False;Jet OLEDB:Compact Without Replica Repair=False;Jet OLEDB:SFP=False;LoginPromptProviderMicrosoft.Jet.OLEDB.4.0Left�Top  TADODataSetADODataSet1
ConnectionADOConnection1
CursorTypectStaticCommandText%SELECT * FROM deliverer ORDER BY name
Parameters Left�Top  TDataSourceDataSource1DataSetADODataSet1Left Top   