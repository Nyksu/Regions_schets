unit Reports_lst;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Get_db_list, ImgList, ComCtrls, ExtCtrls, StdCtrls, Buttons, Db, DBClient,
  ComObj,ill_men;

type
  Tfr_reports = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    TreeView1: TTreeView;
    ImageList1: TImageList;
    bt_exit: TBitBtn;
    cds_tmp: TClientDataSet;
    procedure bt_exitClick(Sender: TObject);
    procedure TreeView1DblClick(Sender: TObject);
    procedure TreeView1Expanded(Sender: TObject; Node: TTreeNode);
    procedure TreeView1Collapsed(Sender: TObject; Node: TTreeNode);
  private
    sheet: variant;
    procedure Otch_MO7a7b7v;
    procedure Otch_kv_to_feder1;
    procedure Otch_kv_to_feder2;
    procedure Otch_count_ill_men_result;
    function GetPeriod(ses_len : integer):integer;
    procedure OpenExel(fn : string);
    { Private declarations }
  public
    { Public declarations }
  end;

Procedure ShowRepLst;

var
  fr_reports: Tfr_reports;
  xl : Variant;
  name_ses : string;

implementation

Uses MainDM;

{$R *.DFM}

Procedure ShowRepLst;
Begin
 try
  try
    fr_reports:=Tfr_reports.Create(Application);
    fr_reports.ShowModal;
  finally
    fr_reports.Free;
  end;
 except
 end;
end;

procedure Tfr_reports.bt_exitClick(Sender: TObject);
begin
  Close;
end;

procedure Tfr_reports.TreeView1DblClick(Sender: TObject);
begin
  Case TreeView1.Selected.AbsoluteIndex of
       1 : Otch_MO7a7b7v;//1.1
       2 : Otch_count_ill_men_result;//1.2
       4 : Otch_kv_to_feder1;//2.1
       5 : Otch_kv_to_feder2;//2.2
  end;
end;

function Tfr_reports.GetPeriod(ses_len : integer):integer;
var
  res,par_val,par_name,par : variant;
Begin
   name_ses:='';
   par_val:=VarArrayOf([ses_len]);
   par_name:=VarArrayOf(['len']);
   par:=VarArrayOf([par_name,par_val]);
   res:=DM.GetData(3703,par);
   par:=GetDBList('Периоды','Выбирете период отчета','id','name',
                        'Введите часть наименования периода',null,res);
   If not VarIsNull(par) Then Result:=par
   Else Result:=-1;
   If Result>=0 Then Begin
     cds_tmp.data:=res;
     cds_tmp.Locate('id',Result,[loCaseInsensitive]);
     name_ses:=cds_tmp.FieldByName('name').AsString;
     cds_tmp.Active:=false;
   end;
end;

procedure Tfr_reports.Otch_kv_to_feder1;
var
  res,par_val,par_name,par : variant;
  id_season,ii : integer;
  ss,exel_file_name : string;
  x_pos,y_pos : integer;
  namreg : string;
  sum_str8 : real;
Begin
   id_season:=GetPeriod(3);
   If id_season<0 Then Exit;
   exel_file_name:=Rep_lst.Values['rep10'];
   OpenExel(exel_file_name);

   //Получаем справочник регионов
   //par:=VarArrayOf([null]);
   res:=DM.GetData(3820,null);
   cds_tmp.data:=res;
   cds_tmp.first;

   //Строка АА
   sheet.cells[2,1]:='по состоянию на '+name_ses;

   x_pos:=1;
   y_pos:=10;
   While not cds_tmp.EOF Do Begin
      namreg:=cds_tmp.FieldByName('reg_name').AsString;
      sheet.cells[y_pos,2]:=cds_tmp.FieldByName('cel_nom_top').AsString;
      sheet.cells[y_pos,x_pos]:=namreg;
      Inc(y_pos,2);
      ii:=1;
      While (not cds_tmp.EOF)and(cds_tmp.FieldByName('reg_name').AsString=namreg) Do Begin
        sum_str8:=0;
        sheet.cells[y_pos,x_pos].select;
        //Заполняем 1, 2, 3 колонки
        par_val:=VarArrayOf([cds_tmp.FieldByName('id').AsInteger]);
        par_name:=VarArrayOf(['id_urp']);
        par:=VarArrayOf([par_name,par_val]);
        res:=DM.GetData(3821,par);
        sheet.cells[y_pos,1]:=cds_tmp.FieldByName('area_name').AsString;
        sheet.cells[y_pos,2]:=cds_tmp.FieldByName('cel_nom').AsString;
        sheet.cells[y_pos,3]:=res;
        sum_str8:=res;
        //Заполняем 4 колонку
        par_val:=VarArrayOf([cds_tmp.FieldByName('id').AsInteger,id_season]);
        par_name:=VarArrayOf(['id_urp','ses']);
        par:=VarArrayOf([par_name,par_val]);
        res:=DM.GetData(3860,par);
        sheet.cells[y_pos,4]:=res;
        sum_str8:=sum_str8+res;
        //Заполняем 5 колонку
        par_val:=VarArrayOf([cds_tmp.FieldByName('id').AsInteger,id_season]);
        par_name:=VarArrayOf(['id_urp','ses']);
        par:=VarArrayOf([par_name,par_val]);
        res:=DM.GetData(3862,par);
        sheet.cells[y_pos,5]:=res;
        sum_str8:=sum_str8-res;
        //Заполняем 6 колонку
        par_val:=VarArrayOf([cds_tmp.FieldByName('id').AsInteger,id_season]);
        par_name:=VarArrayOf(['id_urp','ses']);
        par:=VarArrayOf([par_name,par_val]);
        res:=DM.GetData(3864,par);
        sheet.cells[y_pos,6]:=res;
        sum_str8:=sum_str8-res;
        //Заполняем 7 колонку
        par_val:=VarArrayOf([cds_tmp.FieldByName('id').AsInteger,id_season]);
        par_name:=VarArrayOf(['id_urp','ses']);
        par:=VarArrayOf([par_name,par_val]);
        res:=DM.GetData(3865,par);
        sheet.cells[y_pos,7]:=res;

        sheet.cells[y_pos,8]:=sum_str8;
        cds_tmp.next;
        If (not cds_tmp.EOF)and(cds_tmp.FieldByName('reg_name').AsString=namreg) Then Begin
          //sheet.rows(y_pos).Insert;
          xl.Selection.EntireRow.Insert;
          Inc(ii);
        end;
      end;
      y_pos:=y_pos+ii;
      x_pos:=1;
   end;

{Range("A15").Select
    Selection.EntireRow.Insert}
    cds_tmp.active:=false;
end;


procedure Tfr_reports.Otch_kv_to_feder2;
var
  res,par_val,par_name,par : variant;
  id_season,ii : integer;
  ss,exel_file_name : string;
  x_pos,y_pos : integer;
  namreg : string;
  sum_str8 : real;
Begin
   id_season:=GetPeriod(3);
   If id_season<0 Then Exit;
   exel_file_name:=Rep_lst.Values['rep11'];
   OpenExel(exel_file_name);

   //Получаем справочник регионов
   //par:=VarArrayOf([null]);
   res:=DM.GetData(3820,null);
   cds_tmp.data:=res;
   cds_tmp.first;

   //Строка АА
   sheet.cells[2,1]:='по состоянию на '+name_ses;

   x_pos:=1;
   y_pos:=10;
   While not cds_tmp.EOF Do Begin
      namreg:=cds_tmp.FieldByName('reg_name').AsString;
      sheet.cells[y_pos,2]:=cds_tmp.FieldByName('cel_nom_top').AsString;
      sheet.cells[y_pos,x_pos]:=namreg;
      Inc(y_pos,2);
      ii:=1;
      While (not cds_tmp.EOF)and(cds_tmp.FieldByName('reg_name').AsString=namreg) Do Begin
        sum_str8:=0;
        sheet.cells[y_pos,x_pos].select;
        //Заполняем 1, 2, 9 колонки
        par_val:=VarArrayOf([cds_tmp.FieldByName('id').AsInteger]);
        par_name:=VarArrayOf(['id_urp']);
        par:=VarArrayOf([par_name,par_val]);
        res:=DM.GetData(3861,par);
        sheet.cells[y_pos,1]:=cds_tmp.FieldByName('area_name').AsString;
        sheet.cells[y_pos,2]:=cds_tmp.FieldByName('cel_nom').AsString;
        sheet.cells[y_pos,3]:=res;
        sum_str8:=res;
        //Заполняем 10 колонку
        par_val:=VarArrayOf([cds_tmp.FieldByName('id').AsInteger,id_season]);
        par_name:=VarArrayOf(['id_urp','ses']);
        par:=VarArrayOf([par_name,par_val]);
        res:=DM.GetData(3841,par);
        sheet.cells[y_pos,4]:=res;
        sum_str8:=sum_str8+res;
        //Заполняем 11 колонку
        par_val:=VarArrayOf([cds_tmp.FieldByName('id').AsInteger,id_season]);
        par_name:=VarArrayOf(['id_urp','ses']);
        par:=VarArrayOf([par_name,par_val]);
        res:=DM.GetData(3866,par);
        sheet.cells[y_pos,5]:=res;
        sum_str8:=sum_str8-res;
        //Заполняем 12 колонку
        par_val:=VarArrayOf([cds_tmp.FieldByName('id').AsInteger,id_season]);
        par_name:=VarArrayOf(['id_urp','ses']);
        par:=VarArrayOf([par_name,par_val]);
        res:=DM.GetData(3867,par);
        sheet.cells[y_pos,6]:=res;
        sum_str8:=sum_str8-res;
        //Заполняем 13 колонку
        par_val:=VarArrayOf([cds_tmp.FieldByName('id').AsInteger,id_season]);
        par_name:=VarArrayOf(['id_urp','ses']);
        par:=VarArrayOf([par_name,par_val]);
        res:=DM.GetData(3868,par);
        sheet.cells[y_pos,7]:=res;

        sheet.cells[y_pos,8]:=sum_str8;
        cds_tmp.next;
        If (not cds_tmp.EOF)and(cds_tmp.FieldByName('reg_name').AsString=namreg) Then Begin
          xl.Selection.EntireRow.Insert;
          Inc(ii);
        end;
      end;
      y_pos:=y_pos+ii;
      x_pos:=1;
   end;

   cds_tmp.active:=false;
end;

procedure Tfr_reports.Otch_count_ill_men_result;
var
  res,par_val,par_name,par : variant;
  id_season : integer;
Begin
   id_season:=GetPeriod(1);
   If id_season<0 Then Exit;
   GetIllMen(id_season,name_ses);
end;

procedure Tfr_reports.OpenExel(fn : string);
Begin
  //Открываем Exel
   xl:=CreateOleObject('Excel.Application');
   xl.visible:=true;
   xl.application.workbooks.open(fn);
   sheet:=xl.application.workbooks[1].worksheets[1];
end;

procedure Tfr_reports.Otch_MO7a7b7v;
var
  res,par_val,par_name,par : variant;
  pars,pn,pv : variant;
  id_season : integer;
  resy : real;
  ss,exel_file_name : string;
Begin
   id_season:=GetPeriod(1);
   If id_season<0 Then Exit;

   exel_file_name:={'D:\b.xls'}Rep_lst.Values['rep1'];

   //Открываем Exel
   OpenExel(exel_file_name);

   //Строка АА
   sheet.cells[1,1]:='За '+name_ses;
   //Сторока А1
   pars:=VarArrayCreate([0,3],varVariant);
   pars[0]:='PROC1';
   pars[1]:=VarArrayOf([200,300,id_season]);
   pars[2]:=VarArrayof(['SALDO_IN']);
   pars[3]:=3720;
   res:=DM.Get_Res_proc(pars);
   If VarIsNull(res) Then resy:=0
   Else resy:=res[0];
   sheet.cells[7,2]:=resy;
   //Строка А3
   par_val:=VarArrayOf([id_season,200,299]);
   par_name:=VarArrayOf(['ses','urp_s','urp_po']);
   par:=VarArrayOf([par_name,par_val]);
   res:=DM.GetData(3742,par);
   If VarIsNull(res) Then resy:=0
   Else resy:=res;
   sheet.cells[7,4]:=resy;
   //Строка А4
   res:=DM.GetData(3743,par);
   If VarIsNull(res) Then resy:=0
   Else resy:=res;
   sheet.cells[7,6]:=resy;
   //Строка А6
   res:=DM.GetData(3744,par);
   If VarIsNull(res) Then resy:=0
   Else resy:=res;
   sheet.cells[7,8]:=resy;
   //Строка В2

end;

procedure Tfr_reports.TreeView1Expanded(Sender: TObject; Node: TTreeNode);
begin
  Node.ImageIndex:=2;
end;

procedure Tfr_reports.TreeView1Collapsed(Sender: TObject; Node: TTreeNode);
begin
  Node.ImageIndex:=0;
end;

end.
