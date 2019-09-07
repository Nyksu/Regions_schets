unit Get_list_id;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls;

type
  Tfr_get_list_id = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    gr_in_list: TDBGrid;
    pn_in_name: TPanel;
    pn_out_name: TPanel;
    bt_add: TBitBtn;
    bt_del: TBitBtn;
    BitBtn3: TBitBtn;
    gr_out_list: TDBGrid;
    cds_in_list: TClientDataSet;
    cds_out_list: TClientDataSet;
    ds_in_list: TDataSource;
    ds_out_list: TDataSource;
    ed_search_str: TEdit;
    Label1: TLabel;
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ed_search_strKeyPress(Sender: TObject; var Key: Char);
    procedure bt_addClick(Sender: TObject);
    procedure bt_delClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

Function Get_id_list(in_lst : variant;zg,zg_in,zg_out : string) : variant;

var
  fr_get_list_id : Tfr_get_list_id;
  lst_in,lst_out : variant;
  zgl,zgl_in,zgl_out : string;

implementation

{$R *.DFM}

Function Get_id_list(in_lst : variant;zg,zg_in,zg_out : string) : variant;
Begin
  lst_in:=in_lst;
  lst_out:=null;
  zgl:=zg;
  zgl_in:=zg_in;
  zgl_out:=zg_out;
  try
    try
      fr_get_list_id:=Tfr_get_list_id.Create(Application);
      fr_get_list_id.ShowModal;
    finally
      Result:=lst_out;
      fr_get_list_id.free;
    end;
  except
  end;
end;

procedure Tfr_get_list_id.BitBtn3Click(Sender: TObject);
begin
  If (cds_out_list.Active) and (cds_out_list.recordcount>0) Then
     lst_out:=cds_out_list.data
  else lst_out:=null;
  Close;
end;

procedure Tfr_get_list_id.FormCreate(Sender: TObject);
begin
  Caption:=zgl;
  pn_in_name.Caption:=zgl_in;
  pn_out_name.Caption:=zgl_out;
  cds_out_list.data:=lst_in;
  cds_in_list.data:=lst_in;
  cds_out_list.EmptyDataSet;
end;

procedure Tfr_get_list_id.ed_search_strKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key<>#13 Then Begin
     cds_in_list.Filtered:=false;
     cds_in_list.Filter:='name like '+#39+'%'+ed_search_str.text+'%'+#39;
     If ed_search_str.text='' Then cds_in_list.Filter:='' Else
        cds_in_list.Filtered:=true;
  end
  Else gr_in_list.SetFocus;
end;

procedure Tfr_get_list_id.bt_addClick(Sender: TObject);
begin
  cds_out_list.InsertRecord([cds_in_list.FieldByName('id'),
                             cds_in_list.FieldByName('name')]);
  cds_in_list.Delete;
end;

procedure Tfr_get_list_id.bt_delClick(Sender: TObject);
begin
  cds_in_list.InsertRecord([cds_out_list.FieldByName('id'),
                             cds_out_list.FieldByName('name')]);
  cds_out_list.Delete;
end;

end.
