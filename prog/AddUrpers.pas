unit AddUrpers;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Db, DBClient, RxLookup, ComCtrls, Mask,
  DBCtrls, Grids, DBGrids, RXDBCtrl, RxMemDS, ToolEdit, DBTreeView,
  DBTables, RxQuery;

type
  TFormAddUrpers = class(TForm)    
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtnExit: TBitBtn;
    ClientDataSetAreas: TClientDataSet;
    ClientDataSetAreasID: TIntegerField;
    ClientDataSetAreasCODE: TStringField;
    ClientDataSetAreasNAME: TStringField;
    ClientDataSetAreasMASTER_ID: TIntegerField;
    DataSourceAreas: TDataSource;
    ClientDataSetAreaEnd: TClientDataSet;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    IntegerField2: TIntegerField;
    DataSourceAreaEnd: TDataSource;
    ClientDataSetType: TClientDataSet;
    ClientDataSetTypeID: TIntegerField;
    ClientDataSetTypeNAME: TStringField;
    Panel3: TPanel;
    GroupBoxArea: TGroupBox;
    RxDBLookupComboAreas: TRxDBLookupCombo;
    GroupBoxType: TGroupBox;
    RxDBLookupType: TRxDBLookupCombo;
    RxDBLookupComboAreaEnd: TRxDBLookupCombo;
    GroupBoxCode: TGroupBox;
    PageControlUrpers: TPageControl;
    TabSheetUR: TTabSheet;
    TabSheetPH: TTabSheet;
    TabSheetRem: TTabSheet;
    TabSheetRS: TTabSheet;
    BitBtnAdd: TBitBtn;
    BitBtnResetAll: TBitBtn;
    BitBtnReset: TBitBtn;
    GroupBoxPass: TGroupBox;
    LabelPASPNUM: TLabel;
    LabelPASPSER: TLabel;
    LabelPASPVYD: TLabel;
    LabelPASPDAT: TLabel;
    MaskEditCode: TMaskEdit;
    MaskEditPASPSER: TMaskEdit;
    MaskEditPASPNUM: TMaskEdit;
    MaskEditPASPVYD: TMaskEdit;
    GroupBoxSvid: TGroupBox;
    LabelSVIDNUM: TLabel;
    LabelSVIDSER: TLabel;
    LabelSVIDDAT: TLabel;
    LabelSVIDSROK: TLabel;
    MaskEditSVIDNUM: TMaskEdit;
    MaskEditSVIDSER: TMaskEdit;
    MaskEditSVIDSROK: TMaskEdit;
    GroupBoxAddon: TGroupBox;
    LabelGNICOD: TLabel;
    LabelGNIKF: TLabel;
    LabelVKLREE: TLabel;
    LabelREASISKL: TLabel;
    LabelGZ: TLabel;
    LabelVP: TLabel;
    GroupBoxRem: TGroupBox;
    MemoPHRem: TMemo;
    MaskEditGNICOD: TMaskEdit;
    MaskEditGNIKF: TMaskEdit;
    MaskEditVKLREE: TMaskEdit;
    MaskEditREASISKL: TMaskEdit;
    MaskEditVP: TMaskEdit;
    MaskEditGZ: TMaskEdit;
    GroupBoxNalog: TGroupBox;
    LabelU136: TLabel;
    LabelP61: TLabel;
    LabelINTAX: TLabel;
    LabelDINTAX: TLabel;
    GroupBoxBankrot: TGroupBox;
    LabelBANKROT: TLabel;
    LabelFENIX: TLabel;
    LabelRCODE: TLabel;
    GroupBoxMoreDate: TGroupBox;
    LabelVU: TLabel;
    LabelKR: TLabel;
    LabelPEACE: TLabel;
    LabelDEADSOUL: TLabel;
    LabelLOOK: TLabel;
    MaskEditRCODE: TMaskEdit;
    MaskEditU136: TMaskEdit;
    MaskEditP61: TMaskEdit;
    MaskEditINTAX: TMaskEdit;
    LabelBank: TLabel;
    LabeRS: TLabel;
    RxDBGridRS: TRxDBGrid;
    BitBtnAddRS: TBitBtn;
    BitBtnRemove: TBitBtn;
    DataSourceType: TDataSource;
    DataSourceRS: TDataSource;
    CheckBoxRSActive: TCheckBox;
    MaskEditRS: TMaskEdit;
    ComboEditBank: TComboEdit;
    TabSheetBank: TTabSheet;
    GroupBox4: TGroupBox;
    GroupBoxBank: TGroupBox;
    DataSourceBank: TDataSource;
    ClientDataSetBank: TClientDataSet;
    RxDBGrid1: TRxDBGrid;
    PageControlFilterBank: TPageControl;
    TabSheetBankType: TTabSheet;
    TabSheetBankName: TTabSheet;
    TabSheetBankKS: TTabSheet;
    TabSheetBankBik: TTabSheet;
    TabSheetBankMfo: TTabSheet;
    BitBtnSetBankFilter: TBitBtn;
    TabSheetBankOKPO: TTabSheet;
    TabSheetBankRKMFO: TTabSheet;
    TabSheetBankInd: TTabSheet;
    TabSheetBankCity: TTabSheet;
    TabSheetBankAddr: TTabSheet;
    RxDBLookupComboBankType: TRxDBLookupCombo;
    ClientDataSetBankType: TClientDataSet;
    DataSourceBankType: TDataSource;
    ComboBoxBankName: TComboBox;
    MaskEditBankName: TMaskEdit;
    CheckBoxBankName: TCheckBox;
    ComboBoxBankCity: TComboBox;
    MaskEditBankCity: TMaskEdit;
    CheckBoxBankCity: TCheckBox;
    ComboBoxBankAddr: TComboBox;
    MaskEditBankAddr: TMaskEdit;
    CheckBoxBankAddr: TCheckBox;
    CheckBoxActiveType: TCheckBox;
    CheckBoxActiveName: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBoxBIC: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBoxActiveCity: TCheckBox;
    CheckBoxActiveAddr: TCheckBox;
    BitBtnSelect: TBitBtn;
    TabSheetOKONH: TTabSheet;
    ClientDataSetOKONH: TClientDataSet;
    DataSourceOKONH: TDataSource;
    DBTreeViewOKONH: TDBTreeView;
    ClientDataSetOKONHID: TIntegerField;
    ClientDataSetOKONHNAME: TStringField;
    ClientDataSetOKONHUP_ID: TIntegerField;
    ClientDataSetOKONHCODE: TStringField;
    ClientDataSetOPF: TClientDataSet;
    DataSourceOPF: TDataSource;
    ClientDataSetOPFID: TIntegerField;
    ClientDataSetOPFNAME: TStringField;
    ClientDataSetOPFCODE: TStringField;
    TabSheetOWNER_FORM: TTabSheet;
    DBTreeViewOWNER_FORM: TDBTreeView;
    ClientDataSetOWNER_FORM: TClientDataSet;
    DataSourceOWNER_FORM: TDataSource;
    ClientDataSetOWNER_FORMID: TIntegerField;
    ClientDataSetOWNER_FORMNAME: TStringField;
    ClientDataSetOWNER_FORMCODE: TStringField;
    ClientDataSetOWNER_FORMMASTER_ID: TIntegerField;
    DataSourceSOOGU: TDataSource;
    ClientDataSetSOOGU: TClientDataSet;
    ClientDataSetSOOGUID: TIntegerField;
    ClientDataSetSOOGUCODE: TStringField;
    ClientDataSetSOOGUNAME: TStringField;
    ClientDataSetSOOGUNAMECIS: TStringField;
    ClientDataSetSOOGUFULLNAME: TStringField;
    ClientDataSetSOOGUFULLNAMC: TStringField;
    ClientDataSetSOOGUNOSHORT: TSmallintField;
    ClientDataSetSOOGUANNUL: TDateTimeField;
    TabSheetAdditional: TTabSheet;
    Label9: TLabel;
    EditTREG: TDBEdit;
    Label10: TLabel;
    EditFDATE: TDBEdit;
    DateEditPASPDAT: TDateEdit;
    DateEditSVIDDAT: TDateEdit;
    DateEditVU: TDateEdit;
    DateEditKR: TDateEdit;
    DateEditLOOK: TDateEdit;
    DateEditDEADSOUL: TDateEdit;
    DateEditPEACE: TDateEdit;
    DateEditBANKROT: TDateEdit;
    DateEditFENIX: TDateEdit;
    DateEditDINTAX: TDateEdit;
    GroupBoxIndSP: TGroupBox;
    LabelOPF: TLabel;
    LabelOKONH: TLabel;
    LabelSOOGU: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    LabelOKPO: TLabel;
    ComboEditOKONH: TComboEdit;
    ComboEditOWNER_FORM: TComboEdit;
    RxDBLookupComboOPF: TRxDBLookupCombo;
    RxDBLookupComboSOOGU: TRxDBLookupCombo;
    MaskEditINN: TMaskEdit;
    MaskEditOKPO: TMaskEdit;
    LabelFULLNAME: TLabel;
    LabelShort_Name: TLabel;
    MaskEditName: TMaskEdit;
    MaskEditShort_Name: TMaskEdit;
    MaskEditBOSSNAME: TMaskEdit;
    MaskEditBUHNAME: TMaskEdit;
    LabelBOSSNAME: TLabel;
    LabelBUHNAME: TLabel;
    LabelBOSSTEL: TLabel;
    LabelBUHTEL: TLabel;
    MaskEditBUHTEL: TMaskEdit;
    MaskEditBOSSTEL: TMaskEdit;
    ClientDataSetDataRS: TClientDataSet;
    ClientDataSetDataRSBankID: TIntegerField;
    ClientDataSetDataRSBankName: TStringField;
    ClientDataSetDataRSRS: TStringField;
    ClientDataSetDataRSState: TIntegerField;
    ClientDataSetDataRSStateView: TStringField;
    GroupBoxUchet: TGroupBox;
    LabelFDATE: TLabel;
    DateEditFDATE: TDateEdit;
    LabelTREG: TLabel;
    MaskEditTREG: TMaskEdit;
    LabelDCLOSE: TLabel;
    DateEditDCLOSE: TDateEdit;
    LabelQCLOSE: TLabel;
    MaskEditQCLOSE: TMaskEdit;
    LabelRCLOSE: TLabel;
    MaskEditRCLOSE: TMaskEdit;
    LabelLACT: TLabel;
    MaskEditLACT: TMaskEdit;
    GroupBoxAdress: TGroupBox;
    LabelREGION: TLabel;
    LabelSTREET: TLabel;
    LabelIND: TLabel;
    MaskEditIND: TMaskEdit;
    LabelCITY: TLabel;
    MaskEditCITY: TMaskEdit;
    LabelADDRESS: TLabel;
    LabelRCITY: TLabel;
    LabelFADDR: TLabel;
    MaskEditREGION: TMaskEdit;
    MaskEditRCITY: TMaskEdit;
    MaskEditADDRESS: TMaskEdit;
    MaskEditSTREET: TMaskEdit;
    MaskEditFADDR: TMaskEdit;
    GroupBox1: TGroupBox;
    LabelDGOSREG: TLabel;
    LabelOTV: TLabel;
    LabelNGOSREG: TLabel;
    LabelDDOSNEW: TLabel;
    LabelASSC: TLabel;
    LabelFROMOTD: TLabel;
    LabelCONCURWS: TLabel;
    LabelNWORKERS: TLabel;
    LabelMDATE1: TLabel;
    LabelKATEG: TLabel;
    DateEditDGOSREG: TDateEdit;
    DateEditDDOSNEW: TDateEdit;
    MaskEditNGOSREG: TMaskEdit;
    MaskEditOTV: TMaskEdit;
    MaskEditASSC: TMaskEdit;
    MaskEditKATEG: TMaskEdit;
    MaskEditFROMOTD: TMaskEdit;
    MaskEditMDATE1: TMaskEdit;
    MaskEditNWORKERS: TMaskEdit;
    MaskEditCONCURWS: TMaskEdit;
    ClientDataSetSearch: TClientDataSet;
    TabSheeSetup: TTabSheet;
    CheckBoxType: TCheckBox;
    CheckBoxName: TCheckBox;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    CheckBox12: TCheckBox;
    CheckBox13: TCheckBox;
    CheckBox14: TCheckBox;
    CheckBoxCity: TCheckBox;
    CheckBoxAddr: TCheckBox;
    EditBIC: TEdit;
    ClientDataSetDataRSID: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure ClientDataSetAreasAfterScroll(DataSet: TDataSet);
    procedure RxDBLookupTypeChange(Sender: TObject);
    procedure BitBtnAddClick(Sender: TObject);
    procedure BitBtnSetBankFilterClick(Sender: TObject);
    procedure ComboEditBankButtonClick(Sender: TObject);
    procedure TabSheetBankShow(Sender: TObject);
    procedure BitBtnSelectClick(Sender: TObject);
    procedure ComboEditOKONHButtonClick(Sender: TObject);
    procedure DBTreeViewOKONHDblClick(Sender: TObject);
    procedure DBTreeViewOWNER_FORMDblClick(Sender: TObject);
    procedure ComboEditOWNER_FORMButtonClick(Sender: TObject);
    procedure BitBtnAddRSClick(Sender: TObject);
    procedure CheckBoxTypeClick(Sender: TObject);
    procedure CheckBoxActiveTypeClick(Sender: TObject);
  private
    { Private declarations }
    LastSheet: Integer;
    procedure SwitchVisibleTabSheet( What:Boolean; Some:String);
  public
    { Public declarations }
    Ur_ID: Integer;
    AREA_ID_U:Integer;
    procedure FindUrpers();
  end;

procedure Enter ( Ur_ID: Integer; Edit :Boolean );

var
  FormAddUrpers: TFormAddUrpers;

implementation

uses MainDM;

{$R *.DFM}

Procedure Enter ( Ur_ID: Integer; Edit :Boolean );
Begin
  Screen.Cursor:=crHourglass;
  FormAddUrpers := TFormAddUrpers.Create(Application);
  FormAddUrpers.Ur_ID := Ur_ID ;
  try
    if Ur_ID > 0 then FormAddUrpers.FindUrpers();
    FormAddUrpers.BitBtnAdd.Enabled := Edit ;
    Screen.Cursor:=crDefault;
    FormAddUrpers.ShowModal();
  finally
   FormAddUrpers.Free();
   Screen.Cursor:=crDefault
  end;
End;

procedure TFormAddUrpers.FormCreate(Sender: TObject);
begin
  // Screen.Cursor:=crHourglass;
  try
    ClientDataSetAreas.Active:=false;
    ClientDataSetAreas.Data:=DM.DoOperation(1502,false,null);
    RxDBLookupComboAreas.Value := 'Тюменская  обл';

    ClientDataSetType.Active:=false;
    ClientDataSetType.Data:=DM.DoOperation(1540,false,null);
    RxDBLookupType.Value := 'Прочие предприятия';

    ClientDataSetBankType.Active:=false;
    ClientDataSetBankType.Data:=DM.DoOperation(3443,false,null);
    ClientDataSetBankType.First();
    RxDBLookupComboBankType.Value := ClientDataSetBankType.FieldByName('NAME').AsString;

    ClientDataSetOPF.Active:=false;
    ClientDataSetOPF.Data:=DM.DoOperation(3129,false,null);
    ClientDataSetOPF.First();
    RxDBLookupComboOPF.Value := ClientDataSetOPF.FieldByName('NAME').AsString;

    ClientDataSetOKONH.Active := False;
    ClientDataSetOKONH.Data:=DM.DoOperation(3126,false,null);
    ClientDataSetOKONH.First();
    ComboEditOKONH.Text := ClientDataSetOKONH.FieldByName('NAME').AsString;

    ClientDataSetOWNER_FORM.Active := False;
    ClientDataSetOWNER_FORM.Data:=DM.DoOperation(3132,false,null);
    ClientDataSetOWNER_FORM.First();
    ComboEditOWNER_FORM.Text := ClientDataSetOWNER_FORM.FieldByName('NAME').AsString;


    ClientDataSetSOOGU.Active := False;
    ClientDataSetSOOGU.Data:=DM.DoOperation(3121,false,null);
    ClientDataSetSOOGU.First();
    RxDBLookupComboSOOGU.Value := ClientDataSetSOOGU.FieldByName('NAME').AsString;

    LastSheet := 0;
    SwitchVisibleTabSheet( True, '');
  finally
    // Screen.Cursor:=crDefault;
  end;

end;

procedure TFormAddUrpers.ClientDataSetAreasAfterScroll(DataSet: TDataSet);
begin
  Screen.Cursor:=crHourglass;
  try
    ClientDataSetAreaEnd.Active:=false;
    ClientDataSetAreaEnd.Data:=DM.DoOperation( 3220, false, VarArrayOf([ VarArrayOf(['_MASTER_ID_'] ),
                                                                         VarArrayOf([ClientDataSetAreas.FieldByName('ID').asInteger ])
                                                                 ])
                                          );

    ClientDataSetAreaEnd.First();
    RxDBLookupComboAreaEnd.Value := ClientDataSetAreaEnd.FieldByName('NAME').AsString;
  finally
    Screen.Cursor:=crDefault;
  end;
end;

procedure TFormAddUrpers.RxDBLookupTypeChange(Sender: TObject);
begin
  if ( ClientDataSetType.FieldByName('ID').asInteger = 900 ) or
     ( ClientDataSetType.FieldByName('ID').asInteger = 950 ) Then
       TabSheetPH.Enabled := False
  else TabSheetPH.Enabled := True;
end;

procedure TFormAddUrpers.BitBtnAddClick(Sender: TObject);
var
   ID_TEMP, Operation :Integer;

  procedure PrintErrorUrpers();
  Begin
  // Log
  end;

  function CheckDate( S: String): String;
  Begin
    if S = '  .  .    ' then result := ''
    else                     result := S
  end;

  procedure   UpdateUrRs( ID:Integer );
  Begin
    ClientDataSetDataRS.First();
    While not ClientDataSetDataRS.EOF do Begin
      if ClientDataSetDataRS.FieldByName('ID').asInteger < 0 then Begin
        Id_TEMP       := DM.GetNextID ;
        Operation := 3300
       end
      else Begin
        Id_TEMP       :=  ClientDataSetDataRS.FieldByName('ID').asInteger;
        Operation := 3486
      end   ;
      try
       DM.DoOperation( Operation, False, VarArrayOf([ VarArrayOf(['_ID_', '_URPERS_ID_', '_BANK_ID_', '_STATE_', '_RS_']),
                                                      VarArrayOf([ Id_TEMP,
                                                                   ID,                                                 // _URPERS_ID_
                                                                   ClientDataSetDataRS.FieldByName('BankID').asInteger,    // _BANK_ID_
                                                                   ClientDataSetDataRS.FieldByName('State').asInteger, // _STATE_
                                                                   ClientDataSetDataRS.FieldByName('RS').asString      // _RS_
                                                                ])
                                                   ])
                     );
      except
         ShowMessage( 'Ошибка добавления Расчетного счета ' +
                  ClientDataSetDataRS.FieldByName('RS').asString )
      end ;
      ClientDataSetDataRS.Next();
    end
  end;

Begin

  if Ur_ID < 0 then Begin
     Id_TEMP       := DM.GetNextID ;
     Operation := 3062
    end
  else Begin
     Id_TEMP       := Ur_ID ;
     Operation := 3461
  end   ;
  DM.StartTrans();
  try
   DM.DoOperation( Operation, False, VarArrayOf([ VarArrayOf([  '_ID_', '_REG_NUMBER_', '_AREA_ID_', '_URPERS_TYPE_ID_',
                                                           '_MASTER_ID_', '_LAST_CHANGE_', '_ID_REM_', '_ACTION_',
                                                           '_VU_', '_KR_', '_U136_', '_P61_', '_LOOK_', '_BANKROT_',
                                                           '_INTAX_', '_DEADSOUL_', '_PEACE_', '_FENIX_', '_RCODE_',
                                                           '_DINTAX_', '_ID_UR_', '_AREA_ID_U_', '_OPF_ID_', '_OKONH_ID_',
                                                           '_SOOGU_ID_', '_OWNER_FORM_ID_', '_NAME_', '_FULLNAME_',
                                                           '_INN_', '_TREG_', '_FDATE_', '_DCLOSE_', '_QCLOSE_',
                                                           '_RCLOSE_', '_LACT_', '_IND_', '_CITY_', '_RCITY_', '_REGION_',
                                                           '_STREET_', '_ADDRESS_', '_FADDR_', '_BOSSNAME_', '_BOSSTEL_',
                                                           '_BUHNAME_', '_BUHTEL_', '_OKPO_', '_DGOSREG_', '_OTV_',
                                                           '_NGOSREG_', '_DDOSNEW_', '_ASSC_', '_KATEG_', '_MDATE1_',
                                                           '_NWORKERS_', '_CONCURWS_', '_FROMOTD_', '_ID_RH_',
                                                           '_PASPNUM_', '_PASPSER_', '_PASPVYD_', '_PASPDAT_',
                                                           '_SVIDNUM_', '_SVIDSER_', '_SVIDDAT_', '_SVIDSROK_', '_PRIM_',
                                                           '_GNICOD_', '_GNIKF_', '_VKLREE_', '_REASISKL_', '_GZ_', '_VP_']),
                                             VarArrayOf([ ID_TEMP,
                                                          StringReplace( MaskEditCode.Text, ' ', '0', [rfReplaceAll] ),// Reg_Number
                                                          ClientDataSetAreaEnd.FieldByName('ID').AsInteger,            // Area_ID
                                                          ClientDataSetType.FieldByName('ID').asInteger,               // urpers_type_id прочие предприятия
                                                          NULL,                                                        // MASTER_ID
                                                          Date(),                                                      // LAST_CHANGE '01.01.1990'
                                                          ID_TEMP,                                                          // DM.GetNextID
                                                          0,                                                           // ACTION
                                                          CheckDate( DateEditVU.Text ),                                // VU
                                                          CheckDate( DateEditKR.Text ),                                // KR
                                                          MaskEditU136.Text,                                           // U136
                                                          MaskEditP61.Text,                                            // P61
                                                          CheckDate( DateEditLOOK.Text ),                              // LOOK
                                                          CheckDate( DateEditBANKROT.Text ),                           // BANKROT
                                                          MaskEditINTAX.Text,                                          // INTAX
                                                          CheckDate( DateEditDEADSOUL.Text ),                          // DEADSOUL
                                                          CheckDate( DateEditPEACE.Text ),                             // PEACE
                                                          CheckDate( DateEditFENIX.Text ),                             // FENIX
                                                          MaskEditRCODE.Text,                                          // RCODE
                                                          CheckDate( DateEditDINTAX.Text ),                            // DINTAX
                                                          ID_TEMP,                                                          // DM.GetNextID,
                                                          ClientDataSetAreaEnd.FieldByName(   'ID').AsInteger,         // AREA_ID_U Реализовать парсер
                                                          ClientDataSetOPF.FieldByName(       'ID').asInteger,         // OPF_ID
                                                          ClientDataSetOKONH.FieldByName(     'ID').asInteger,         // OKONH_ID
                                                          ClientDataSetSOOGU.FieldByName(     'ID').asInteger,         // SOOGU_ID
                                                          ClientDataSetOWNER_FORM.FieldByName('ID').asInteger,         // OWNER_FORM_ID
                                                          MaskEditShort_Name.Text,                                     // NAME
                                                          MaskEditName.Text,                                           // FULLNAME
                                                          MaskEditINN.Text,                                            // INN
                                                          MaskEditTREG.Text,                                           // TREG
                                                          CheckDate( DateEditFDATE.Text ),                             // FDATE
                                                          CheckDate( DateEditDCLOSE.Text ),                            // DCLOSE
                                                          MaskEditQCLOSE.Text,                                         // QCLOSE
                                                          MaskEditRCLOSE.Text,                                         // RCLOSE
                                                          MaskEditLACT.Text,                                           // LACT
                                                          MaskEditIND.Text,                                            // IND
                                                          MaskEditCITY.Text,                                           // CITY
                                                          MaskEditRCITY.Text,                                          // RCITY
                                                          MaskEditREGION.Text,                                         // REGION
                                                          MaskEditSTREET.Text,                                         // STREET
                                                          MaskEditADDRESS.Text,                                        // ADDRESS
                                                          MaskEditFADDR.Text,                                          // FADDR
                                                          MaskEditBOSSNAME.Text,                                       // BOSSNAME
                                                          MaskEditBOSSTEL.Text,                                        // BOSSTEL
                                                          MaskEditBUHNAME.Text,                                        // BUHNAME
                                                          MaskEditBUHTEL.Text,                                         // BUHTEL
                                                          MaskEditOKPO.Text,                                           // OKPO
                                                          CheckDate( DateEditDGOSREG.Text ),                           // DGOSREG
                                                          MaskEditOTV.Text,                                            // OTV
                                                          MaskEditNGOSREG.Text,                                        // NGOSREG
                                                          CheckDate( DateEditDDOSNEW.Text ),                           // DDOSNEW
                                                          MaskEditASSC.Text,                                           // ASSC
                                                          MaskEditKATEG.Text,                                          // KETEG
                                                          MaskEditMDATE1.Text,                                         // MDATE1
                                                          MaskEditNWORKERS.Text,                                       // NWORKERS
                                                          MaskEditCONCURWS.Text,                                       // CONCURWS
                                                          MaskEditFROMOTD.Text,                                        // FROMOTD
                                                          ID_TEMP,                                                          // DM.GetNextID,
                                                          MaskEditPASPNUM.Text,                                        // PASPNUM
                                                          MaskEditPASPSER.Text,                                        // PASPSER
                                                          MaskEditPASPVYD.Text,                                        // PASPVYD
                                                          CheckDate( DateEditPASPDAT.Text ),                           // PASPDAT
                                                          MaskEditSVIDNUM.Text,                                        // SVIDNUM
                                                          MaskEditSVIDSER.Text,                                        // SVIDSER
                                                          CheckDate( DateEditSVIDDAT.Text ),                           // SVIDDAT
                                                          MaskEditSVIDSROK.Text,                                       // SVIDSROK
                                                          '',                                                          // PRIM     MemoPHRem.???
                                                          MaskEditGNICOD.Text,                                         // GNICOD
                                                          MaskEditGNIKF.Text,                                          // GNIKF
                                                          MaskEditVKLREE.Text,                                         // VKLREE
                                                          MaskEditREASISKL.Text,                                       // REASISKL
                                                          MaskEditGZ.Text,                                             // GZ
                                                          MaskEditVP.Text                                              // VP
                                                       ])
                                          ])
                 );


    UpdateUrRs( ID_TEMP );
    DM.Commit();
  except
    DM.Rollback();
  end;
end;

procedure TFormAddUrpers.SwitchVisibleTabSheet( What:Boolean; Some:String );
var
 Count : Integer;
begin
  If not What then LastSheet := PageControlUrpers.ActivePageIndex ;
  For Count := PageControlUrpers.PageCount - 1 downto 0 do
   Begin
    if PageControlUrpers.Pages[Count].Caption = Some then
      PageControlUrpers.Pages[Count].TabVisible := not What
    else if What and ( PageControlUrpers.Pages[Count].PageIndex < 5) then
         PageControlUrpers.Pages[Count].TabVisible := What
       else
        PageControlUrpers.Pages[Count].TabVisible := False;
   end;
  If What then PageControlUrpers.ActivePageIndex := LastSheet;
end;

procedure TFormAddUrpers.BitBtnSetBankFilterClick(Sender: TObject);
Var
  sFilter: String;
  sOperator: String;

  Function SetFilterString( Filter, Addon, Expr : String):String ;
  Begin
   if Filter = '' then Result := AddOn
   else Result := '(' + Filter + ')' + Expr + '(' + Addon + ')'
  end;

begin
 // Обработать Фильтр по Типу Банка
 if  CheckBoxActiveType.Checked then
     sFilter := '(Bank_Type_ID = ' + ClientDataSetBankType.FieldByName('ID').AsString + ' )' ;

 // Обработать Фильтр по Названию
 if  CheckBoxActiveName.Checked then Begin

    case ComboBoxBankName.ItemIndex of
      0: sOperator := #39 +       MaskEditBankName.Text + '%' + #39 ;
      1: sOperator := #39 + '%' + MaskEditBankName.Text + '%' + #39 ;
      2: sOperator := #39 + '%' + MaskEditBankName.Text       + #39 ;
    end;

    if  not CheckBoxBankName.Checked  then Begin
       sOperator := AnsiUpperCase( sOperator );
       sFilter := SetFilterString( sFilter, 'UPPER(NAME) LIKE ' +  sOperator, 'AND' )
      end
    else
      sFilter := SetFilterString( sFilter, 'NAME LIKE ' +  sOperator, 'AND' )
 end;

 // Обработать Фильтр по БИКу
 if  CheckBoxBIC.Checked then
     sFilter := SetFilterString( sFilter, 'BIK LIKE ' + #39 + '%' + EditBIC.Text + '%' + #39, 'AND' ) ;


 // Обработать Фильтр по Населенному пункту
 if  CheckBoxActiveCity.Checked then Begin

    case ComboBoxBankCity.ItemIndex of
     0: sOperator := #39 +       MaskEditBankCity.Text + '%' + #39 ;
     1: sOperator := #39 + '%' + MaskEditBankCity.Text + '%' + #39 ;
     2: sOperator := #39 + '%' + MaskEditBankCity.Text       + #39 ;
    end;

    if  not CheckBoxBankCity.Checked  then Begin
       sOperator := AnsiUpperCase( sOperator );
       sFilter := SetFilterString( sFilter, 'UPPER(CITY) LIKE ' +  sOperator, 'AND' )
      end
    else
      sFilter := SetFilterString( sFilter, 'CITY LIKE ' +  sOperator, 'AND' )
 end;

 // Обработать Фильтр по Адресу
 if  CheckBoxActiveAddr.Checked then Begin

    case ComboBoxBankAddr.ItemIndex of
     0: sOperator := #39 +       MaskEditBankAddr.Text + '%' + #39 ;
     1: sOperator := #39 + '%' + MaskEditBankAddr.Text + '%' + #39 ;
     2: sOperator := #39 + '%' + MaskEditBankAddr.Text       + #39 ;
    end;

    if  not CheckBoxBankAddr.Checked  then Begin
       sOperator := AnsiUpperCase( sOperator );
       sFilter := SetFilterString( sFilter, 'UPPER(ADDR) LIKE ' +  sOperator, 'AND' )
      end
    else
      sFilter := SetFilterString( sFilter, 'ADDR LIKE ' +  sOperator, 'AND' )
 end;


 // Выбрать по условию
 if sFilter = '' then
   BitBtnSelect.Enabled := False
 else Begin
  Screen.Cursor:=crHourglass;
  try
   ClientDataSetBank.Active:=false;
   ClientDataSetBank.Data:=DM.DoOperation(3444,false,VarArrayOf([ VarArrayOf([':_What_'] ),
                                                                  VarArrayOf([ 'Where ' + sFilter ])
                                                               ])
                                         );
   BitBtnSelect.Enabled := True;
  finally
    Screen.Cursor:=crDefault;
  end;
 end;

end;

procedure TFormAddUrpers.ComboEditBankButtonClick(Sender: TObject);
begin
  SwitchVisibleTabSheet( False, 'Банк плательщика' )
end;

procedure TFormAddUrpers.TabSheetBankShow(Sender: TObject);
//var
// Count : Integer;
begin

   ComboBoxBankName.ItemIndex := 0;

//  For Count := 1 to PageControlFilterBank.PageCount - 1 do
//      PageControlUrpers.Pages[Count].TabVisible := False;

//  PageControlFilterBank.ActivePageIndex := 0;
  BitBtnSelect.Enabled := False;
//  For Count := PageControlFilterBank.ActivePage.ControlCount - 1 downto 0 do
//     ( PageControlFilterBank.ActivePage.Controls[ Count ] as TCheckBox).Checked := False;

end;

procedure TFormAddUrpers.BitBtnSelectClick(Sender: TObject);
begin
   ComboEditBank.Text :=  ClientDataSetBank.FieldByName('NAME').AsString;
   SwitchVisibleTabSheet( True, '' )

end;

procedure TFormAddUrpers.ComboEditOKONHButtonClick(Sender: TObject);
begin
  SwitchVisibleTabSheet( False, 'Справочник ОКОНХ' )
end;

procedure TFormAddUrpers.DBTreeViewOKONHDblClick(Sender: TObject);
begin
  ComboEditOKONH.Text :=  ClientDataSetOKONH.FieldByName('NAME').asString;
  SwitchVisibleTabSheet( True, '');
end;

procedure TFormAddUrpers.DBTreeViewOWNER_FORMDblClick(Sender: TObject);
begin
  ComboEditOWNER_FORM.Text :=  ClientDataSetOWNER_FORM.FieldByName('NAME').asString;
  SwitchVisibleTabSheet( True, '');
end;

procedure TFormAddUrpers.ComboEditOWNER_FORMButtonClick(Sender: TObject);
begin
  SwitchVisibleTabSheet( False, 'Формы собственности' )
end;

procedure TFormAddUrpers.BitBtnAddRSClick(Sender: TObject);
begin
  ClientDataSetDataRS.Insert;
  ClientDataSetDataRS.FieldByName('ID').asInteger  := -1;
  ClientDataSetDataRS.FieldByName('BankID').asInteger  := ClientDataSetBank.FieldByName('ID').asInteger;
  ClientDataSetDataRS.FieldByName('BankName').asString := ClientDataSetBank.FieldByName('NAME').asString;
  ClientDataSetDataRS.FieldByName('RS').asString       := MaskEditRS.Text;
  if CheckBoxRSActive.Checked then
       ClientDataSetDataRS.FieldByName('State').asInteger   := 0
  else ClientDataSetDataRS.FieldByName('State').asInteger   := 1 ;
  ClientDataSetDataRS.Post;
end;

procedure TFormAddUrpers.FindUrpers();
Begin
  // Основные данные
  ClientDataSetSearch.Active := False;
  ClientDataSetSearch.Data := DM.DoOperation( 3471, false,VarArrayOf([ VarArrayOf(['_ID_' ] ),
                                                                       VarArrayOf([ UR_ID ] )
                                                                 ])
                                            );
  MaskEditCode.Text                                           := ClientDataSetSearch.FieldByName('Reg_Number'     ).asString;

  // ClientDataSetAreaEnd.FieldByName('ID').AsInteger            := ClientDataSetSearch.FieldByName('Area_ID'        ).asInteger;
  ClientDataSetAreas.Locate('ID', VarArrayOf([DM.DoOperation( 3484, false,VarArrayOf([ VarArrayOf(['_ID_' ] ),
                                                                     VarArrayOf([ ClientDataSetSearch.FieldByName('Area_ID').asInteger ] )
                                                                  ])
                                           )]), []);
  RxDBLookupComboAreas.Value := ClientDataSetAreas.FieldByName('NAME').asString;

  ClientDataSetAreasAfterScroll( ClientDataSetAreas );

  ClientDataSetAreaEnd.Locate('ID', VarArrayOf([ClientDataSetSearch.FieldByName('Area_ID').asInteger]), []);
  RxDBLookupComboAreaEnd.Value := ClientDataSetAreaEnd.FieldByName('NAME').asString;

  ClientDataSetType.Locate('ID', VarArrayOf([ClientDataSetSearch.FieldByName('urpers_type_id' ).asInteger]), []);
  RxDBLookupType.Value := ClientDataSetType.FieldByName('NAME').asString;

  DateEditVU.Text                                             := ClientDataSetSearch.FieldByName('VU'             ).asString;
  DateEditKR.Text                                             := ClientDataSetSearch.FieldByName('KR'             ).asString;
  MaskEditU136.Text                                           := ClientDataSetSearch.FieldByName('U136'           ).asString;
  MaskEditP61.Text                                            := ClientDataSetSearch.FieldByName('P61'            ).asString;
  DateEditLOOK.Text                                           := ClientDataSetSearch.FieldByName('LOOK'           ).asString;
  DateEditBANKROT.Text                                        := ClientDataSetSearch.FieldByName('BANKROT'        ).asString;
  MaskEditINTAX.Text                                          := ClientDataSetSearch.FieldByName('INTAX'          ).asString;
  DateEditDEADSOUL.Text                                       := ClientDataSetSearch.FieldByName('DEADSOUL'       ).asString;
  DateEditPEACE.Text                                          := ClientDataSetSearch.FieldByName('PEACE'          ).asString;
  DateEditFENIX.Text                                          := ClientDataSetSearch.FieldByName('FENIX'          ).asString;
  MaskEditRCODE.Text                                          := ClientDataSetSearch.FieldByName('RCODE'          ).asString;
  DateEditDINTAX.Text                                         := ClientDataSetSearch.FieldByName('DINTAX'         ).asString;
  AREA_ID_U                                                   := ClientDataSetSearch.FieldByName('AREA_ID_U'      ).asInteger;

  ClientDataSetOPF.Locate('ID', VarArrayOf([ClientDataSetSearch.FieldByName('OPF_ID').asInteger]), []);
  RxDBLookupComboOPF.Value := ClientDataSetOPF.FieldByName('NAME').AsString;

  ClientDataSetOKONH.Locate('ID', VarArrayOf([ClientDataSetSearch.FieldByName('OKONH_ID').asInteger]), []);
  ComboEditOKONH.Text := ClientDataSetOKONH.FieldByName('NAME').AsString;

  ClientDataSetSOOGU.Locate('ID', VarArrayOf([ClientDataSetSearch.FieldByName('SOOGU_ID').asInteger]), []);
  RxDBLookupComboSOOGU.Value := ClientDataSetSOOGU.FieldByName('NAME').AsString;

  ClientDataSetOWNER_FORM.Locate('ID', VarArrayOf([ClientDataSetSearch.FieldByName('OWNER_FORM_ID').asInteger]), []);
  ComboEditOWNER_FORM.Text := ClientDataSetOWNER_FORM.FieldByName('NAME').AsString;

  MaskEditShort_Name.Text                                     := ClientDataSetSearch.FieldByName('NAME'           ).asString;
  MaskEditName.Text                                           := ClientDataSetSearch.FieldByName('FULLNAME'       ).asString;
  MaskEditINN.Text                                            := ClientDataSetSearch.FieldByName('INN'            ).asString;
  MaskEditTREG.Text                                           := ClientDataSetSearch.FieldByName('TREG'           ).asString;
  DateEditFDATE.Text                                          := ClientDataSetSearch.FieldByName('FDATE'          ).asString;
  DateEditDCLOSE.Text                                         := ClientDataSetSearch.FieldByName('DCLOSE'         ).asString;
  MaskEditQCLOSE.Text                                         := ClientDataSetSearch.FieldByName('QCLOSE'         ).asString;
  MaskEditRCLOSE.Text                                         := ClientDataSetSearch.FieldByName('RCLOSE'         ).asString;
  MaskEditLACT.Text                                           := ClientDataSetSearch.FieldByName('LACT'           ).asString;
  MaskEditIND.Text                                            := ClientDataSetSearch.FieldByName('IND'            ).asString;
  MaskEditCITY.Text                                           := ClientDataSetSearch.FieldByName('CITY'           ).asString;
  MaskEditRCITY.Text                                          := ClientDataSetSearch.FieldByName('RCITY'          ).asString;
  MaskEditREGION.Text                                         := ClientDataSetSearch.FieldByName('REGION'         ).asString;
  MaskEditSTREET.Text                                         := ClientDataSetSearch.FieldByName('STREET'         ).asString;
  MaskEditADDRESS.Text                                        := ClientDataSetSearch.FieldByName('ADDRESS'        ).asString;
  MaskEditFADDR.Text                                          := ClientDataSetSearch.FieldByName('FADDR'          ).asString;
  MaskEditBOSSNAME.Text                                       := ClientDataSetSearch.FieldByName('BOSSNAME'       ).asString;
  MaskEditBOSSTEL.Text                                        := ClientDataSetSearch.FieldByName('BOSSTEL'        ).asString;
  MaskEditBUHNAME.Text                                        := ClientDataSetSearch.FieldByName('BUHNAME'        ).asString;
  MaskEditBUHTEL.Text                                         := ClientDataSetSearch.FieldByName('BUHTEL'         ).asString;
  MaskEditOKPO.Text                                           := ClientDataSetSearch.FieldByName('OKPO'           ).asString;
  DateEditDGOSREG.Text                                        := ClientDataSetSearch.FieldByName('DGOSREG'        ).asString;
  MaskEditOTV.Text                                            := ClientDataSetSearch.FieldByName('OTV'            ).asString;
  MaskEditNGOSREG.Text                                        := ClientDataSetSearch.FieldByName('NGOSREG'        ).asString;
  DateEditDDOSNEW.Text                                        := ClientDataSetSearch.FieldByName('DDOSNEW'        ).asString;
  MaskEditASSC.Text                                           := ClientDataSetSearch.FieldByName('ASSC'           ).asString;
  MaskEditKATEG.Text                                          := ClientDataSetSearch.FieldByName('KATEG'          ).asString;
  MaskEditMDATE1.Text                                         := ClientDataSetSearch.FieldByName('MDATE1'         ).asString;
  MaskEditNWORKERS.Text                                       := ClientDataSetSearch.FieldByName('NWORKERS'       ).asString;
  MaskEditCONCURWS.Text                                       := ClientDataSetSearch.FieldByName('CONCURWS'       ).asString;
  MaskEditFROMOTD.Text                                        := ClientDataSetSearch.FieldByName('FROMOTD'        ).asString;
  MaskEditPASPNUM.Text                                        := ClientDataSetSearch.FieldByName('PASPNUM'        ).asString;
  MaskEditPASPSER.Text                                        := ClientDataSetSearch.FieldByName('PASPSER'        ).asString;
  MaskEditPASPVYD.Text                                        := ClientDataSetSearch.FieldByName('PASPVYD'        ).asString;
  DateEditPASPDAT.Text                                        := ClientDataSetSearch.FieldByName('PASPDAT'        ).asString;
  MaskEditSVIDNUM.Text                                        := ClientDataSetSearch.FieldByName('SVIDNUM'        ).asString;
  MaskEditSVIDSER.Text                                        := ClientDataSetSearch.FieldByName('SVIDSER'        ).asString;
  DateEditSVIDDAT.Text                                        := ClientDataSetSearch.FieldByName('SVIDDAT'        ).asString;
  MaskEditSVIDSROK.Text                                       := ClientDataSetSearch.FieldByName('SVIDSROK'       ).asString;
//  ''                                                          := ClientDataSetSearch.FieldByName('PRIM'           ).asString;
  MaskEditGNICOD.Text                                         := ClientDataSetSearch.FieldByName('GNICOD'         ).asString;
  MaskEditGNIKF.Text                                          := ClientDataSetSearch.FieldByName('GNIKF'          ).asString;
  MaskEditVKLREE.Text                                         := ClientDataSetSearch.FieldByName('VKLREE'         ).asString;
  MaskEditREASISKL.Text                                       := ClientDataSetSearch.FieldByName('REASISKL'       ).asString;
  MaskEditGZ.Text                                             := ClientDataSetSearch.FieldByName('GZ'             ).asString;
  MaskEditVP.Text                                             := ClientDataSetSearch.FieldByName('VP'             ).asString;

  // Рсчетные счета 
  ClientDataSetSearch.Active := False;
  ClientDataSetSearch.Data := DM.DoOperation( 3440, false,VarArrayOf([ VarArrayOf(['_URPERS_ID_' ] ),
                                                                       VarArrayOf([ UR_ID ] )
                                                                     ])
                                            );
  ClientDataSetSearch.First();
  While not ClientDataSetSearch.Eof do Begin
    ClientDataSetDataRS.Insert;
    ClientDataSetDataRS.FieldByName('ID').asInteger      := ClientDataSetSearch.FieldByName('ID').asInteger;
    ClientDataSetDataRS.FieldByName('BankID').asInteger  := ClientDataSetSearch.FieldByName('BN_ID').asInteger;
    ClientDataSetDataRS.FieldByName('BankName').asString := ClientDataSetSearch.FieldByName('NAME').asString;
    ClientDataSetDataRS.FieldByName('RS').asString       := ClientDataSetSearch.FieldByName('RS').asString;
    ClientDataSetDataRS.FieldByName('State').asInteger   := ClientDataSetSearch.FieldByName('STATE').asInteger;
    ClientDataSetDataRS.Post;
    ClientDataSetSearch.Next();
  end;
  ClientDataSetDataRS.First();
end;

procedure TFormAddUrpers.CheckBoxTypeClick(Sender: TObject);
begin
//  if ( sender as TCheckBox ).Checked then
//     PageControlFilterBank.Pages[ ( sender as TCheckBox ).TabOrder + 1 ].TabVisible := True
//  else
//    PageControlFilterBank.Pages[ ( sender as TCheckBox ).TabOrder + 1 ].TabVisible := False;

//  ( PageControlFilterBank.Pages[ ( sender as TCheckBox ).TabOrder + 1 ].Controls[
//    PageControlFilterBank.Pages[ ( sender as TCheckBox ).TabOrder + 1 ].ControlCount - 1 ]
//    as TCheckBox ).Checked :=  ( sender as TCheckBox ).Checked ;

end;

procedure TFormAddUrpers.CheckBoxActiveTypeClick(Sender: TObject);
begin
// if PageControlFilterBank.ActivePageIndex > 0 then Begin
//  if ( sender as TCheckBox ).Checked then
//    PageControlFilterBank.ActivePage.TabVisible := True
//  else
//    PageControlFilterBank.ActivePage.TabVisible := False;

//  ( PageControlFilterBank.Pages[ 0 ].Controls[ PageControlFilterBank.ActivePageIndex - 1 ]
//    as TCheckBox ).Checked := ( sender as TCheckBox ).Checked
// end
end;

end.
