unit MainFace;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ActnList, ImgList, ComCtrls, ToolWin, progress_window, get_db_list;

type
  TMainForm = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    bt_schets_in: TToolButton;
    ImageList1: TImageList;
    ActionList1: TActionList;
    Schets_in: TAction;
    Schets_out: TAction;
    Plats: TAction;
    Acty: TAction;
    Banks: TAction;
    Reports: TAction;
    MainMenu1: TMainMenu;
    n_system: TMenuItem;
    n_exit: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    n_regions: TMenuItem;
    N3: TMenuItem;
    n_reports: TMenuItem;
    Load: TAction;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    procedure FormResize(Sender: TObject);
    procedure Schets_inExecute(Sender: TObject);
    procedure LoadExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure n_exitClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses DM_acepter;

{$R *.DFM}

procedure TMainForm.FormResize(Sender: TObject);
begin
  MainForm.Height:=123;
  If MainForm.Width<720 Then MainForm.Width:=720
end;

procedure TMainForm.Schets_inExecute(Sender: TObject);
begin
  //123123
end;

procedure TMainForm.LoadExecute(Sender: TObject);
var
  F : TSearchRec;
  file_id, count_str : integer;
  new_filename, sql_txt : string;
  type_base : integer;
  tt,dd,p_val,p_nam,pp : variant;
  id,regions,q_u,mkb,n_pp,i_type  : integer;
  num_s,fam,im,ot,w,dr,adres,ds,mcod : string;
  sn_pol,q_name,qcod,sn_pasp : variant;
  dat_s,dat_1,dat_2 : Date;
  s_all :real;
begin    //Load reestr in
  //Ask filename
  If not dm.dlg_open_r_lpu.Execute Then Exit;
  If dm.dlg_open_r_lpu.FileName='' Then Exit;
  If FindFirst(dm.dlg_open_r_lpu.FileName,faAnyFile,F)<>0 Then Exit;
  file_id:=DM.GetID(2);
  new_filename:=dbf_backup_path+IntToStr(file_id)+'.dbf';
  If not RenameFile(dm.dlg_open_r_lpu.FileName, new_filename) Then Begin
    MessageDlg('Невозможно прочитать файл реестра!!', mtError,[mbOk], 0);
    Exit;
  end;
  try
    sql_txt:='Select * from '+IntToStr(file_id);
    DM.ODBC_q_default.SQL.Text:=sql_txt;
    DM.ODBC_q_default.Open;
    count_str:=DM.ODBC_q_default.RecordCount;
    If count_str<1 Then Begin
       DM.ODBC_q_default.Close;
       MessageDlg('Нет ни одной записи в файле реестра!!', mtError,[mbOk], 0);
       RenameFile(new_filename,dm.dlg_open_r_lpu.FileName);
       Exit;
    end;
  except
    MessageDlg('Невозможно открыть файл реестра!!', mtError,[mbOk], 0);
    RenameFile(new_filename,dm.dlg_open_r_lpu.FileName);
    Exit;
  end;
  ShowMessage('!!!!!!!!!!!');
  //Ask type of presentor
  dd:=DM.GetData(3884,null);
  tt:=VarArrayOf(['id',1]);
  tt:=GetDBList('Параметры фильтра',
                'Выбирите тип счетов-реестров',
                'id','name',
                'Для быстрого поиска типа введите часть его наименования',
                tt,dd);
  If VarIsNull(tt) Then Begin
     DM.ODBC_q_default.Close;
     MessageDlg('Отмена загрузки пользователем!!', mtError,[mbOk], 0);
     RenameFile(new_filename,dm.dlg_open_r_lpu.FileName);
     Exit;
  end;
  type_base:=tt;
  //Migration data base
  StartProgress;
  fr_progress.DeclarateConstProgress('Прием реестра. Внесение в базу счетов.',count_str,1);
  try
  try
  DM.StartTrans;
  While not DM.ODBC_q_default.EOF Do Begin
    p_nam:=VarArrayOf(['cod']);
    p_val:=VarArrayOf([ODBC_q_default.FieldByName('n_reg1').AsInteger]);
    pp:=VarArrayOf([p_nam,p_val]);
    pp:=DM.GetData(3884,pp);
    If not VarIsNull(pp) Then Begin
     regions:=pp;
     id:=GetNextID;
     num_s:=ODBC_q_default.FieldByName('num_s').AsString;
     fam:=ODBC_q_default.FieldByName('fam').AsString;
     im:=ODBC_q_default.FieldByName('im').AsString;
     ot:=ODBC_q_default.FieldByName('ot').AsString;
     w:=ODBC_q_default.FieldByName('w').AsString;
     sn_pol:=ODBC_q_default.FieldByName('sn_pol').Value;
     q_name:=ODBC_q_default.FieldByName('q_name').Value;
     qcod:=ODBC_q_default.FieldByName('qcod').Value;
     sn_pasp:=ODBC_q_default.FieldByName('sn_pasp').Value;
     dat_s:=ODBC_q_default.FieldByName('dat_s').AsDate;
     dr:=ODBC_q_default.FieldByName('dr').AsString;
     adres:=ODBC_q_default.FieldByName('adres').AsString;
     dat_1:=ODBC_q_default.FieldByName('dat_1').AsDate;
     dat_2:=ODBC_q_default.FieldByName('dat_2').AsDate;
     q_u:=ODBC_q_default.FieldByName('q_u').AsInteger;
     mkb:=ODBC_q_default.FieldByName('mkb').AsInteger;
     ds:=ODBC_q_default.FieldByName('ds').AsString;
     mcod:=ODBC_q_default.FieldByName('mcod').AsString;
     s_all:=ODBC_q_default.FieldByName('s_all').AsFloat;
     n_pp:=ODBC_q_default.FieldByName('n_pp').AsInteger;
     i_type:=ODBC_q_default.FieldByName('i_type').AsInteger;
     d_type:=ODBC_q_default.FieldByName('d_type').Value;
     Case type_base of
       1 : Begin
             try
              ot_cod:=ODBC_q_default.FieldByName('d_type').Value;
              fam_r:=ODBC_q_default.FieldByName('fam_r').Value;
              im_r:=ODBC_q_default.FieldByName('im_r').Value;
              ot_r:=ODBC_q_default.FieldByName('ot_r').Value;
             except
               DM.ODBC_q_default.Close;
               MessageDlg('Тип счетов-реестров выбран не верно!!', mtError,[mbOk], 0);
               RenameFile(new_filename,dm.dlg_open_r_lpu.FileName);
               DM.Rollback;
               Exit;
             end;
           end;
       2 : Begin
             ot_cod:=null;
             fam_r:=null;
             im_r:=null;
             ot_r:=null;
           end;
     end;
    end
    Else Begin
      //Не существующий регион
    end;

    p_nam:=VarArrayOf(['id','id_fil','regions','tb','num_s','dat_s','fam','im','ot','w',
                       'sn_pol','q_name','sn_pasp','dr','adres','dat_1','dat_2','q_u','mkb','ds,mcod',
                       's_all','n_pp','i_type','d_type','ot_cod','fam_r','im_r','ot_r']);
    p_val:=VarArrayOf([id,file_id,regions,type_base,num_s,dat_s,fam,im,ot,w,
                       sn_pol,q_name,sn_pasp,dr,adres,dat_1,dat_2,q_u,mkb,ds,mcod,
                       s_all,n_pp,i_type,d_type,ot_cod,fam_r,im_r,ot_r]);
    pp:=VarArrayOf([p_nam,p_val]);

    try
     DM.DoOperation(3887,false,pp);
    except
     //Видимо запись уже есть такая...
    end;

    fr_progress.SetStepNext;
    DM.ODBC_q_default.Next;
  end;
  DM.Commit;
  CloseProgress;
  finally
    DM.ODBC_q_default.Active:=false;
  end;
  except
    DM.Rollback;
    RenameFile(new_filename,dm.dlg_open_r_lpu.FileName);
    CloseProgress;
  end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
   MainForm.Height:=123;
end;

procedure TMainForm.n_exitClick(Sender: TObject);
begin
   Close;
end;

end.
