program interfin;

uses
  Forms,
  MainFrm in 'MainFrm.pas' {MainForm},
  MainDM in 'MainDM.pas' {DM: TDataModule},
  PswdForm in 'PswdForm.pas' {PasswordForm},
  SplashFrm in 'SplashFrm.pas' {SplashForm},
  In_schets in 'In_schets.pas' {fr_schets_in},
  New_in_schet in 'New_in_schet.pas' {fr_new_in_schet},
  Ask_dlg in 'Ask_dlg.pas' {fr_dialog},
  Reestrs_schets in 'Reestrs_schets.pas' {fr_reestrs},
  New_reestr in 'New_reestr.pas' {fr_new_reestr},
  get_sum in 'get_sum.pas' {fr_get_summ},
  del_vozvrat in 'del_vozvrat.pas' {fr_del_vozvrat},
  new_plat_in in 'new_plat_in.pas' {fr_plat_in_new},
  PLAT_OUT in 'PLAT_OUT.pas' {fr_plat_out},
  Ask_chislo in 'Ask_chislo.pas' {fr_get_chislo},
  Out_schets in 'Out_schets.pas' {fr_schets_out},
  New_out_schet in 'New_out_schet.pas' {fr_new_out_schet},
  Get_str in 'Get_str.pas' {fr_get_str},
  prn_schet in 'prn_schet.pas' {fr_schet_prn},
  Formula in 'Formula.pas',
  lst_plat_out in 'lst_plat_out.pas' {fr_lst_plat},
  Bank_rekv in 'Bank_rekv.pas' {fr_recvisits},
  prn_plat_por in 'prn_plat_por.pas' {fr_plat_poruch},
  Mask_filtr in 'Mask_filtr.pas' {fr_filtr_mask},
  Zn_uslovie in '..\server\Zn_uslovie.pas' {fr_uslovie_zn},
  Get_dat in 'Get_dat.pas' {fr_get_dat},
  get_db_list in 'get_db_list.pas' {fr_db_list},
  AddUrpers in 'AddUrpers.pas' {FormAddUrpers},
  Acts in 'Acts.pas' {fr_acts},
  sp_urpers in 'sp_urpers.pas' {fr_show_urp},
  intra_act in 'intra_act.pas' {fr_intra_act},
  prn_lst_in_sch in 'prn_lst_in_sch.pas' {fr_prn_lst_in_sch},
  bnkseek in 'bnkseek.pas' {fr_bnkseek},
  spr_saldo_in in 'spr_saldo_in.pas' {fr_saldo_in},
  prn_lst_out_sch in 'prn_lst_out_sch.pas' {fr_prn_lst_out_sch},
  Get_list_id in 'Get_list_id.pas' {fr_get_list_id},
  sum_saldo in 'sum_saldo.pas' {fr_sum_saldo},
  Reports_lst in 'Reports_lst.pas' {fr_reports},
  regions in 'regions.pas' {fr_regions},
  ill_men in 'ill_men.pas' {fr_ill_men_count};

{$R *.TLB}

{$R *.RES}

begin
  Application.Initialize;
  SplashForm:= TSplashForm.Create(nil);
  try
    SplashForm.Show;
    SplashForm.Update;
    Application.ProcessMessages;
  Application.Title := 'Интерфинанс +';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TDM, DM);
  finally
     SplashForm.Hide;
     SplashForm.Free;
  end;
  try
    ConnectToServer;
    Application.Run;
  except
  end;
end.

