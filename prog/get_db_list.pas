unit get_db_list;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, Db, DBClient, Get_str;

type
  Tfr_db_list = class(TForm)
    ed_db_list: TDBLookupComboBox;
    lb_coment: TLabel;
    bt_ok: TBitBtn;
    bt_cancel: TBitBtn;
    cds_spr_lst: TClientDataSet;
    ds_spr_lst: TDataSource;
    ch_filter: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure bt_okClick(Sender: TObject);
    procedure ch_filterClick(Sender: TObject);
    procedure bt_cancelClick(Sender: TObject);
  private
    flt_str : string;
    { Private declarations }
  public
    { Public declarations }
  end;


Function GetDBList(shp,com,keyf,showf,com_f:string;dee,dad:variant):variant;

var
  fr_db_list: Tfr_db_list;
  res,def,dd : variant;
  key_f,show_f,sh,cm,cm_f : string;

implementation

{$R *.DFM}

Function GetDBList(shp,com,keyf,showf,com_f:string;dee,dad:variant):variant;
Begin
  def:=dee;
  sh:=shp;
  cm:=com;
  key_f:=keyf;
  show_f:=showf;
  res:=null;
  dd:=dad;
  cm_f:=com_f;
  try
    try
      fr_db_list:=Tfr_db_list.Create(Application);
      fr_db_list.ShowModal;
    finally
      Result:=res;
      fr_db_list.Free;
    end;
  except
  end;
end;

procedure Tfr_db_list.FormCreate(Sender: TObject);
begin
  Caption:=sh;
  lb_coment.Caption:=cm;
  ed_db_list.KeyField:=key_f;
  ed_db_list.ListField:=show_f;
  cds_spr_lst.data:=dd;
  flt_str:='';
  //def - дефаультные значения в списке [0]название полей [1]их значения
  If not VarIsNull(def) Then cds_spr_lst.Locate(def[0],def[1],[loCaseInsensitive]);
end;

procedure Tfr_db_list.bt_okClick(Sender: TObject);
begin
  If not VarIsNull(ed_db_list.KeyValue) Then Res:=ed_db_list.KeyValue;
  Close;
end;

procedure Tfr_db_list.ch_filterClick(Sender: TObject);
begin
   If ch_filter.Checked Then Begin
      flt_str:=Get_Str_Par('Фильтр','Введите строку для фильтра',cm_f,flt_str);
      cds_spr_lst.Filtered:=false;
      cds_spr_lst.Filter:=show_f+' like '+#39+'%'+flt_str+'%'+#39;
      cds_spr_lst.Filtered:=true;
   end
   Else Begin
      cds_spr_lst.Filtered:=false;
   end;
end;

procedure Tfr_db_list.bt_cancelClick(Sender: TObject);
begin
   Close;
end;

end.
