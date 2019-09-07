unit regions;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, StdCtrls, Grids, DBGrids, Db, DBClient, Ask_dlg, Mask;

type
  Tfr_regions = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    DBLookupComboBox1: TDBLookupComboBox;
    bt_close: TButton;
    cds_regions: TClientDataSet;
    cds_area: TClientDataSet;
    cds_reg_name: TClientDataSet;
    ds_regions: TDataSource;
    ds_area: TDataSource;
    ds_reg_name: TDataSource;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    Label2: TLabel;
    DBLookupListBox1: TDBLookupListBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    bt_update: TButton;
    procedure bt_closeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bt_updateClick(Sender: TObject);
  private
    procedure ApdateApply;
    { Private declarations }
  public
    { Public declarations }
  end;

Procedure Start_Rgions;

var
  fr_regions: Tfr_regions;

implementation

Uses MainDM;

{$R *.DFM}

Procedure Start_Rgions;
Begin
  try
    try
      fr_regions:=Tfr_regions.Create(Application);
      fr_regions.ShowModal;
    finally
      fr_regions.free;
    end;
  except
  end;
end;

procedure Tfr_regions.ApdateApply;
var
  ss : string;
  bb : boolean;
begin
  ss:='В справочнике были произведена изменения'+#13+'Сохранить изменения? (Да/Нет)';
  bb:=false;
  If cds_regions.Active=false Then Exit;
  If cds_regions.State<>dsBrowse Then cds_regions.Post;
  try
    If not VarIsNull(cds_regions.Delta) Then bb:=true;
  except
  end;
  If bb Then
    If Get_Answer('Внимание!!',ss,true) Then
    Begin
       try
         cds_regions.ApplyUpdates(-1);
       except
       end;
    end;
end;

procedure Tfr_regions.bt_closeClick(Sender: TObject);
begin
  Close;
end;

procedure Tfr_regions.FormCreate(Sender: TObject);
var
  res : variant;
begin
  res:=DM.GetData(3780,null);
  cds_area.data:=res;
  res:=DM.GetData(3781,null);
  cds_reg_name.data:=res;
  screen.Cursor:=crsqlwait;
  try
   cds_regions.Active:=true;
  finally
  screen.Cursor:=crdefault;
  end;
end;

procedure Tfr_regions.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ApdateApply;
  cds_regions.Active:=false;
end;

procedure Tfr_regions.bt_updateClick(Sender: TObject);
begin
  ApdateApply;
end;

end.
