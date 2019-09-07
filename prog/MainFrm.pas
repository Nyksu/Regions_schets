unit MainFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Menus, ToolWin, ComCtrls, ImgList, ActnList, RxGrdCpt,
  In_schets, PLAT_OUT, Out_schets, lst_plat_out, Acts, sp_urpers, bnkseek,
  spr_saldo_in,Reports_lst, regions;

type
  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    n_system: TMenuItem;
    n_exit: TMenuItem;
    ImageList1: TImageList;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ActionList1: TActionList;
    Schets_in: TAction;
    bt_schets_in: TToolButton;
    bt_schets_out: TToolButton;
    Schets_out: TAction;
    RxGradientCaption1: TRxGradientCaption;
    Plats: TAction;
    ToolButton1: TToolButton;
    N1: TMenuItem;
    N2: TMenuItem;
    Acty: TAction;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    Banks: TAction;
    n_saldo_in: TMenuItem;
    N3: TMenuItem;
    n_reports: TMenuItem;
    n_regions: TMenuItem;
    Reports: TAction;
    ToolButton4: TToolButton;
    procedure FormResize(Sender: TObject);
    procedure n_exitClick(Sender: TObject);
    procedure Schets_inExecute(Sender: TObject);
    procedure Schets_outExecute(Sender: TObject);
    procedure PlatsExecute(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure ActyExecute(Sender: TObject);
    procedure BanksExecute(Sender: TObject);
    procedure n_saldo_inClick(Sender: TObject);
    procedure n_reportsClick(Sender: TObject);
    procedure n_regionsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses MainDM;

{$R *.DFM}

procedure TMainForm.FormResize(Sender: TObject);
begin
  MainForm.Height:=123;
  If MainForm.Width<720 Then MainForm.Width:=720 
end;

procedure TMainForm.n_exitClick(Sender: TObject);
begin
   MainForm.Close;
end;

procedure TMainForm.Schets_inExecute(Sender: TObject);
begin
  Start_in_schets;
end;

procedure TMainForm.Schets_outExecute(Sender: TObject);
begin
  ShowSchetsOut;
end;

procedure TMainForm.PlatsExecute(Sender: TObject);
begin
   ListPlat;
end;

procedure TMainForm.N2Click(Sender: TObject);
begin
  ShowUrpers;
end;

procedure TMainForm.ActyExecute(Sender: TObject);
begin
  ActsView;
end;

procedure TMainForm.BanksExecute(Sender: TObject);
begin
  All_Banks;
end;

procedure TMainForm.n_saldo_inClick(Sender: TObject);
begin
   CreateSaldo;
end;

procedure TMainForm.n_reportsClick(Sender: TObject);
begin
  ShowRepLst;
end;

procedure TMainForm.n_regionsClick(Sender: TObject);
begin
  Start_Rgions;
end;

end.
