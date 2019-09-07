unit bnkseek;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBClient, StdCtrls, Grids, DBGrids, ExtCtrls, Buttons;

type
  Tfr_bnkseek = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    ed_name: TEdit;
    ed_bik: TEdit;
    DBGrid1: TDBGrid;
    ch_name: TCheckBox;
    ch_bik: TCheckBox;
    cds_bnkseek: TClientDataSet;
    bt_find: TBitBtn;
    bt_exit: TBitBtn;
    lb_flt: TLabel;
    ds_bnkseek: TDataSource;
    bt_import: TBitBtn;
    bt_reset: TBitBtn;
    bt_add_key: TButton;
    procedure FormCreate(Sender: TObject);
    procedure bt_exitClick(Sender: TObject);
    procedure bt_findClick(Sender: TObject);
    procedure bt_importClick(Sender: TObject);
    procedure bt_resetClick(Sender: TObject);
    procedure bt_add_keyClick(Sender: TObject);
  private
    Procedure filterOn;
    { Private declarations }
  public
    { Public declarations }
  end;

Procedure All_Banks;

var
  fr_bnkseek: Tfr_bnkseek;

implementation

Uses MainDM;

{$R *.DFM}

Procedure All_Banks;
Begin
  try
    try
      fr_bnkseek:=Tfr_bnkseek.Create(Application);
      fr_bnkseek.ShowModal;
    finally
      fr_bnkseek.Free;
    end;
  except
  end;
end;

procedure Tfr_bnkseek.FormCreate(Sender: TObject);
var
  res : variant;
begin
   res:=DM.GetData(3524,null);
   cds_bnkseek.data:=res;
end;

Procedure Tfr_bnkseek.filterOn;
var
  ffl : string;
Begin
   If ch_name.Checked and (ed_name.text='' )Then Begin
      ShowMessage('Для поиска по имени необходимо ввести хотябы один символ');
      ed_name.SetFocus;
      Exit;
   end;
   If ch_bik.Checked and (ed_bik.text='') Then Begin
      ShowMessage('Для поиска по БИКу необходимо ввести хотябы одину цифру');
      ed_bik.SetFocus;
      Exit;
   end;
   ffl:='';
   If ch_name.Checked Then ffl:='namep like '+#39+ed_name.text+'%'+#39;
   If ch_bik.Checked Then Begin
     If ffl<>'' Then ffl:=ffl+' and ';
     ffl:=ffl+'newnum like '+#39+ed_bik.text+'%'+#39;
   end;
   If ffl='' Then Begin
     cds_bnkseek.Filter:='';
     cds_bnkseek.Filtered:=false;
     lb_flt.Visible:=false;
   end
   Else Begin
     cds_bnkseek.Filter:=ffl;
     cds_bnkseek.Filtered:=true;
     lb_flt.Visible:=true;
   end;
end;

procedure Tfr_bnkseek.bt_exitClick(Sender: TObject);
begin
  Close;
end;

procedure Tfr_bnkseek.bt_findClick(Sender: TObject);
begin
  filterOn;
end;

procedure Tfr_bnkseek.bt_importClick(Sender: TObject);
var
 cds_tmp : TClientDataSet;
 res,par_val,par_name,par : variant;
 id_typ_bnk,id_bnk : integer;
 name_b : string;
begin
  If cds_bnkseek.RecordCount<=0 Then Begin
    MessageDlg('Не выбран ни один банк!',mtError,[mbOK],0);
    Exit;
  end;
  cds_tmp:=TClientDataSet.Create(nil);
  try
    par_val:=VarArrayOf([cds_bnkseek.FieldByName('newnum').AsString]);
    par_name:=VarArrayOf(['bik']);
    par:=VarArrayOf([par_name,par_val]);
    cds_tmp.data:=DM.GetData(3526,par);
    If cds_tmp.RecordCount<=0 Then Begin
       par_val:=VarArrayOf([cds_bnkseek.FieldByName('imy').AsString]);
       par_name:=VarArrayOf(['kod']);
       par:=VarArrayOf([par_name,par_val]);
       id_typ_bnk:=DM.GetData(3525,par);
       name_b:=cds_bnkseek.FieldByName('namep').AsString;
       If cds_bnkseek.FieldByName('namep').AsString<>'+' Then
          name_b:=cds_bnkseek.FieldByName('imy').AsString+' '+name_b;
       DM.StartTrans;
       try
         id_bnk:=DM.GetNextID;
         par_val:=VarArrayOf([id_bnk,id_typ_bnk,name_b,
                              cds_bnkseek.FieldByName('ksnp').AsString,
                              cds_bnkseek.FieldByName('newnum').AsString,
                              cds_bnkseek.FieldByName('permfo').AsString,
                              cds_bnkseek.FieldByName('ind').AsString,
                              cds_bnkseek.FieldByName('nnp').AsString,
                              cds_bnkseek.FieldByName('adr').AsString,
                              cds_bnkseek.FieldByName('vkey').AsString]);
         par_name:=VarArrayOf(['id','id_tp','nam','ks','bik','mfo','ind','city','adr','key']);
         par:=VarArrayOf([par_name,par_val]);
         DM.DoOperation(3527,false,par);
       except
         DM.Rollback;
         MessageDlg('Неожиданный сбой!!! Попробуйте еще раз...',mtError,[mbOK],0);
         Exit;
       end;
       DM.Commit;
       //DM.Rollback;
       ShowMessage('Банк импортирован!!');
    end;
  finally
   cds_tmp.free;
  end;
end;

procedure Tfr_bnkseek.bt_resetClick(Sender: TObject);
var
 par_val,par_name,par : variant;
 name_b : string;
begin
  If cds_bnkseek.RecordCount<=0 Then Begin
    MessageDlg('Не выбран ни один банк!',mtError,[mbOK],0);
    Exit;
  end;
  cds_bnkseek.first;
  While not cds_bnkseek.EOF Do Begin
    name_b:=cds_bnkseek.FieldByName('namep').AsString;
    If cds_bnkseek.FieldByName('p').AsString<>'+' Then
       name_b:=cds_bnkseek.FieldByName('imy').AsString+' '+name_b;
    DM.StartTrans;
    try
      par_name:=VarArrayOf(['nam','ks','bik','mfo','ind','adr','key']);
      par_val:=VarArrayOf([name_b,
                           cds_bnkseek.FieldByName('ksnp').AsString,
                           cds_bnkseek.FieldByName('newnum').AsString,
                           cds_bnkseek.FieldByName('permfo').AsString,
                           cds_bnkseek.FieldByName('ind').AsString,
                           cds_bnkseek.FieldByName('adr').AsString,
                           cds_bnkseek.FieldByName('vkey').AsString]);
      par:=VarArrayOf([par_name,par_val]);
      DM.DoOperation(3540,false,par);
      DM.Commit;
    except
      DM.Rollback;
      //MessageDlg('Неожиданный сбой!!! Попробуйте еще раз...',mtError,[mbOK],0);
      //Exit;
    end;
    //DM.Commit;
    cds_bnkseek.next;
  end;
end;

procedure Tfr_bnkseek.bt_add_keyClick(Sender: TObject);
var
  par_val,par_name,par : variant;
begin
  If cds_bnkseek.RecordCount<=0 Then Begin
    MessageDlg('Не выбран ни один банк!',mtError,[mbOK],0);
    Exit;
  end;
  cds_bnkseek.first;
  While not cds_bnkseek.EOF Do Begin
    DM.StartTrans;
    try
      par_name:=VarArrayOf(['bik','key']);
      par_val:=VarArrayOf([cds_bnkseek.FieldByName('newnum').AsString,
                           cds_bnkseek.FieldByName('vkey').AsString]);
      par:=VarArrayOf([par_name,par_val]);
      DM.DoOperation(3560,false,par);
    except
      DM.Rollback;
      MessageDlg('Неожиданный сбой!!! Попробуйте еще раз...',mtError,[mbOK],0);
      Exit;
    end;
    DM.Commit;
    cds_bnkseek.next;
  end;
end;

end.
