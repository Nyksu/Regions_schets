unit New_reestr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Db, DBClient, Mask, DBCtrls;

type
  Tfr_new_reestr = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    bt_save: TBitBtn;
    bt_cancel: TBitBtn;
    cds_reestr: TClientDataSet;
    ds_reestr: TDataSource;
    ed_kvo_pac: TDBEdit;
    ed_summa: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    ed_coment: TMemo;
    ds_urpers: TDataSource;
    cds_urpers: TClientDataSet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    rg_tip_plat: TRadioGroup;
    procedure bt_cancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bt_saveClick(Sender: TObject);
    procedure rg_tip_platClick(Sender: TObject);
  private
    procedure reset_urpers;
    Function UpdateReestr : boolean;
    { Private declarations }
  public
    { Public declarations }
  end;


Procedure StartNewReestr(par : variant);

var
  fr_new_reestr: Tfr_new_reestr;
  Insert_r : boolean;
  coment : variant;
  id,id_s : integer;
  old_sum : real;

implementation

Uses MainDM;

{$R *.DFM}


Procedure StartNewReestr(par : variant);
Begin
  id_s:=par[0];
  Case par[1] of
    0 : Begin //edit
          Insert_r:=false;
          id:=par[2];
          coment:=par[3];
        end;
    1 : Begin //insert
          Insert_r:=true;
          id:=0;
          coment:='';
        end;
  end;
  try
    try
      fr_new_reestr:=Tfr_new_reestr.Create(Application);
      fr_new_reestr.ShowModal;
    finally
      fr_new_reestr.Free;
    end;
  except
  end;
end;

procedure Tfr_new_reestr.bt_cancelClick(Sender: TObject);
begin
  fr_new_reestr.Close;
end;

procedure Tfr_new_reestr.reset_urpers;
var
  res,par_val,par_name,par : variant;
Begin
  {If cds_urpers.Active Then Begin
  end;}
  cds_urpers.Active:=false;
  Case rg_tip_plat.ItemIndex Of
      0 : par_val:=VarArrayOf([500,599]);
      1 : par_val:=VarArrayOf([200,299]);
  end;
  par_name:=VarArrayOf(['type_s','type_po']);
  par:=VarArrayOf([par_name,par_val]);
  res:=DM.GetData(86,par);
  cds_urpers.Data:=res;
end;

procedure Tfr_new_reestr.FormCreate(Sender: TObject);
var
  ful_param : variant;
begin
  ful_param:=VarArrayCreate([1,2],varVariant);
  If Insert_r Then Begin {вставка}
     ful_param[1]:=1;
     DM.DoOperation(1541,true,ful_param);
     cds_reestr.Open;
     cds_reestr.Insert;
     id:=DM.GetNextID;
     cds_reestr.FieldByName('id').AsInteger:=id;
     cds_reestr.FieldByName('sum_return').AsInteger:=0;
     cds_reestr.FieldByName('sum_in').AsInteger:=0;
     cds_reestr.FieldByName('schet_in_id').AsInteger:=id_s;
     old_sum:=0;
  end
  Else Begin {редактирование}
     Panel2.Caption:='Изменение реестра';
     ful_param[1]:=0;
     ful_param[2]:=id;
     DM.DoOperation(1541,true,ful_param);
     cds_reestr.Open;
     cds_reestr.Edit;
     old_sum:=cds_reestr.FieldByName('summa').AsFloat;
  end;
  ed_coment.Lines.Text:=coment;
  reset_urpers;
end;

Function Tfr_new_reestr.UpdateReestr : boolean;
var
  ful_param,par_names,par_val : variant;
  delta : real;
Begin
   If old_sum<>cds_reestr.FieldByName('summa').AsFloat Then Begin
      delta:=cds_reestr.FieldByName('summa').AsFloat-old_sum;
      par_names:=VarArrayOf(['id','delta','vozvrat']);
      par_val:=VarArrayOf([id_s,delta,0]);
      ful_param:=VarArrayOf([par_names,par_val]);
      DM.DoOperation(1545,false,ful_param);
   end;
   If cds_reestr.ApplyUpdates(-1)<>0 Then Result:=false
   Else Result:=true;
end;

procedure Tfr_new_reestr.bt_saveClick(Sender: TObject);
var
  id_c : integer;
  ful_param,par_names,par_val : variant;
begin
  If Insert_r Then Begin {вставка}
     cds_reestr.Post;
     If VarIsNull(cds_reestr.FieldByName('mso_id').Value)or
        VarIsNull(cds_reestr.FieldByName('count_men').Value)or
        VarIsNull(cds_reestr.FieldByName('summa').Value) Then Begin
           MessageDlg('Сначала необходимо заполнить все поля!!',mtWarning,[mbOK],0);
           cds_reestr.Edit;
           Exit;
        end;
     If (cds_reestr.FieldByName('count_men').AsInteger<=0) or
        (cds_reestr.FieldByName('summa').AsFloat<=0) Then Begin
           MessageDlg('Неверные данные в числовых полях!!',mtWarning,[mbOK],0);
           cds_reestr.Edit;
           Exit;
        end;
     DM.StartTrans;
     try
      If ed_coment.Lines.Text>'' Then Begin
         id_c:=DM.GetNextID;
         cds_reestr.Edit;
         cds_reestr.FieldByName('coment_id').AsInteger:=id_c;
         cds_reestr.Post;
         par_names:=VarArrayOf(['id','koment']);
         par_val:=VarArrayOf([id_c,ed_coment.Lines.Text]);
         ful_param:=VarArrayOf([par_names,par_val]);
         DM.DoOperation(5,false,ful_param);
         If cds_reestr.ApplyUpdates(-1)<>0 Then Begin
            DM.Rollback;
            cds_reestr.Edit;
            Exit;
         end;
      end
      Else If cds_reestr.ApplyUpdates(-1)<>0 Then Begin
            DM.Rollback;
            cds_reestr.Edit;
            Exit;
      end;
      par_names:=VarArrayOf(['id','delta','vozvrat']);
      par_val:=VarArrayOf([id_s,cds_reestr.FieldByName('summa').AsFloat,0]);
      ful_param:=VarArrayOf([par_names,par_val]);
      DM.DoOperation(1545,false,ful_param);
     except
       DM.Rollback;
       cds_reestr.Edit;
       Exit;
     end;
     DM.Commit;
  end
  Else Begin {редактирование}
    cds_reestr.Post;
    If (cds_reestr.FieldByName('count_men').AsInteger<=0) or
        (cds_reestr.FieldByName('summa').AsFloat<=0)or
        VarIsNull(cds_reestr.FieldByName('count_men').Value)or
        VarIsNull(cds_reestr.FieldByName('summa').Value) Then Begin
           MessageDlg('Неверные данные в числовых полях!!',mtWarning,[mbOK],0);
           cds_reestr.Edit;
           Exit;
        end;
    DM.StartTrans;
    try
      If ed_coment.Lines.Text<>coment Then Begin
         If ed_coment.Lines.Text='' Then Begin
            id_c:=cds_reestr.FieldByName('coment_id').AsInteger;
            cds_reestr.Edit;
            cds_reestr.FieldByName('coment_id').Value:=null;
            cds_reestr.Post;
                       //Удаление коментария
            If not UpdateReestr Then Begin
               DM.Rollback;
               cds_reestr.Edit;
               Exit;
            end;
            par_names:=VarArrayOf(['id']);
            par_val:=VarArrayOf([id_c]);
            ful_param:=VarArrayOf([par_names,par_val]);
            DM.DoOperation(1546,false,ful_param);
         end
         Else Begin
                If coment='' Then Begin
                 id_c:=DM.GetNextID; //Вставка нового коментария
                 cds_reestr.Edit;
                 cds_reestr.FieldByName('coment_id').AsInteger:=id_c;
                 cds_reestr.Post;
                 par_names:=VarArrayOf(['id','koment']);
                 par_val:=VarArrayOf([id_c,ed_coment.Lines.Text]);
                 ful_param:=VarArrayOf([par_names,par_val]);
                 DM.DoOperation(5,false,ful_param);
                end
                Else If ed_coment.Lines.Text<>coment Then Begin
                 par_names:=VarArrayOf(['id','text']);  //Редактирование коментария
                 par_val:=VarArrayOf([id_c,ed_coment.Lines.Text]);
                 ful_param:=VarArrayOf([par_names,par_val]);
                 DM.DoOperation(1547,false,ful_param);
                end;
                If not UpdateReestr Then Begin
                   DM.Rollback;
                   cds_reestr.Edit;
                   Exit;
                end;
              end;
      end
      Else If not UpdateReestr Then Begin
        DM.Rollback;
        cds_reestr.Edit;
        Exit;
      end;
    except
       DM.Rollback;
       cds_reestr.Edit;
       Exit;
    end;
    DM.Commit;
  end;
  fr_new_reestr.Close;
end;

procedure Tfr_new_reestr.rg_tip_platClick(Sender: TObject);
begin
  reset_urpers;
end;

end.
