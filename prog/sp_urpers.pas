unit sp_urpers;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Db, DBClient, Grids, DBGrids, AddUrpers,
  Menus, Bank_rekv;

type
  Tfr_show_urp = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    cds_urp: TClientDataSet;
    ds_urp: TDataSource;
    RadioGroup1: TRadioGroup;
    bt_edit: TBitBtn;
    bt_exit: TBitBtn;
    bt_add: TBitBtn;
    ch_show_all: TCheckBox;
    Panel4: TPanel;
    ed_name: TEdit;
    Label1: TLabel;
    lb_flt_is: TLabel;
    rb_nam: TRadioButton;
    rb_inn: TRadioButton;
    pp_menu1: TPopupMenu;
    n_rekv: TMenuItem;
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bt_exitClick(Sender: TObject);
    procedure bt_addClick(Sender: TObject);
    procedure bt_editClick(Sender: TObject);
    procedure ch_show_allClick(Sender: TObject);
    procedure ed_nameKeyPress(Sender: TObject; var Key: Char);
    procedure n_rekvClick(Sender: TObject);
  private
    procedure RescanUrp;
    { Private declarations }
  public
    { Public declarations }
  end;

Procedure ShowUrpers;

var
  fr_show_urp: Tfr_show_urp;

implementation
 
Uses MainDM;

{$R *.DFM}

Procedure ShowUrpers;
Begin
  try
    try
      fr_show_urp:=Tfr_show_urp.Create(Application);
      fr_show_urp.ShowModal;
    finally
      fr_show_urp.free;
    end;
  except
  end;
end;

procedure Tfr_show_urp.RescanUrp;
var
  res,par_val,par_name,par : variant;
Begin
  cds_urp.Active:=false;
  Case RadioGroup1.ItemIndex of
     0 : par_val:=VarArrayOf([0,0]);
     1 : par_val:=VarArrayOf([200,299]);
     2 : par_val:=VarArrayOf([500,599]);
     3 : par_val:=VarArrayOf([400,499]);
     4 : par_val:=VarArrayOf([300,399]);
  end;
  If ch_show_all.Checked Then par_val:=VarArrayOf([0,1000]);
  par_name:=VarArrayOf(['type_s','type_po']);
  par:=VarArrayOf([par_name,par_val]);
  If ch_show_all.Checked Then res:=DM.GetData(3483,par)
  Else res:=DM.GetData(86,par);
  cds_urp.Data:=res;
end;

procedure Tfr_show_urp.RadioGroup1Click(Sender: TObject);
begin
  RescanUrp;
end;

procedure Tfr_show_urp.FormCreate(Sender: TObject);
begin
  RescanUrp;
end;

procedure Tfr_show_urp.bt_exitClick(Sender: TObject);
begin
  Close;
end;

procedure Tfr_show_urp.bt_addClick(Sender: TObject);
begin
  Enter(-1,true);
end;

procedure Tfr_show_urp.bt_editClick(Sender: TObject);
begin
  If (cds_urp.Active)and(cds_urp.RecordCount>0) Then
                     Enter(cds_urp.FieldByName('ID').AsInteger,true);
end;

procedure Tfr_show_urp.ch_show_allClick(Sender: TObject);
begin
  RescanUrp;
end;

procedure Tfr_show_urp.ed_nameKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 Then Begin
     cds_urp.Filtered:=false;
     If ed_name.text='' Then Begin
        cds_urp.Filter:='';
        lb_flt_is.Visible:=false;
     end
     Else Begin
        lb_flt_is.Visible:=true;
        If rb_nam.Checked Then
          cds_urp.Filter:='(name like '+#39+ed_name.text+'%'+#39+
                        ') or (short_name like '+#39+ed_name.text+'%'+#39+')';
        If rb_inn.Checked Then
          cds_urp.Filter:='inn like '+#39+ed_name.text+'%'+#39;
        cds_urp.Filtered:=true;
     end;
  end;
end;

procedure Tfr_show_urp.n_rekvClick(Sender: TObject);
begin
  If (cds_urp.Active)and(cds_urp.RecordCount>0) Then
      GetBankRecv(cds_urp.FieldByName('ID').AsInteger,2,
                  cds_urp.FieldByName('short_name').AsString);
end;

end.
