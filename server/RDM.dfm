�
 TOTHERAREARDM 04  TPF0TOtherAreaRDMOtherAreaRDMOldCreateOrderOnCreateRDMServerCreate	OnDestroyRDMServerDestroyLeft� Top� Height�Width� 	TDatabaseDB	AliasNameORACLE_IDatabaseNameAAAAAHandleShared	LoginPromptParams.StringsUSER NAME=zbPASSWORD=manager SessionNameDefaultLeftTop  TQueryqTemp	AfterOpenqTempAfterOpenDatabaseNameAAAAASessionNameDefaultLeftTop8  TClientDataSetcTemp
Aggregates Params ProviderNamepTempLeftTop�   TActionListOperationListLeftTTop TActionInsert_in_schetTagCaptionInsert_in_schet	OnExecuteInsert_in_schetExecute  TActionDel_in_schetTageCaptionDel_in_schet	OnExecuteInsert_in_schetExecute  TActionChange_reestrTag	OnExecuteChange_reestrExecute  TAction
Vozvrat_inTagCCaption
Vozvrat_in	OnExecuteVozvrat_inExecute  TActionShow_saldo_inTag�CaptionShow_saldo_in	OnExecuteShow_saldo_inExecute   
TxProviderpTempDataSetqTempConstraints	
UpdateModeupWhereKeyOnlyLeftTopj  TQueryqr_Ins_comentSessionNameDefaultLeftTTop:  
TxProvider	pr_reestrDataSetq_reestrConstraints	OnGetTableNamepr_reestrGetTableNameLeftVTop�   TQueryq_sumSchIn_updDatabaseNameAAAAASessionNameDefaultSQL.StringsUpdate schets_inset sum_schet=sum_schet+:deltawhereid=:id LeftXTop� 	ParamDataDataTypeftFloatNamedelta	ParamType	ptUnknownValue           DataType	ftIntegerNameid	ParamType	ptUnknownValue     TQueryq_reestrDatabaseNameAAAAASessionNameDefaultSQL.StringsSelect * from reestr_schetswhereid=:id LeftTTopv	ParamDataDataType	ftUnknownNameid	ParamType	ptUnknown    TQuery
q_saldo_inDatabaseNameAAAAASessionNameDefaultSQL.StringsSelect *from saldo_inwhereid_urpers=:id Left� Topv	ParamDataDataType	ftIntegerNameid	ParamType	ptUnknown   TIntegerFieldq_saldo_inID_URPERS	FieldName	ID_URPERSOriginAAAAA.SALDO_IN.ID_URPERSProviderFlags
pfInUpdate	pfInWherepfInKey   TFloatFieldq_saldo_inS_IN_NULL	FieldName	S_IN_NULLOriginAAAAA.SALDO_IN.S_IN_NULLProviderFlags
pfInUpdate   TFloatFieldq_saldo_inS_OUT_NULL	FieldName
S_OUT_NULLOriginAAAAA.SALDO_IN.S_OUT_NULLProviderFlags
pfInUpdate   TFloatFieldq_saldo_inPL_PP_IN	FieldNamePL_PP_INOriginAAAAA.SALDO_IN.PL_PP_INProviderFlags
pfInUpdate   TFloatFieldq_saldo_inPL_PP_OUT	FieldName	PL_PP_OUTOriginAAAAA.SALDO_IN.PL_PP_OUTProviderFlags
pfInUpdate   TFloatFieldq_saldo_inPL_TP_IN	FieldNamePL_TP_INOriginAAAAA.SALDO_IN.PL_TP_INProviderFlags
pfInUpdate   TFloatFieldq_saldo_inPL_TP_OUT	FieldName	PL_TP_OUTOriginAAAAA.SALDO_IN.PL_TP_OUTProviderFlags
pfInUpdate   TFloatFieldq_saldo_inV_PP_IN	FieldNameV_PP_INOriginAAAAA.SALDO_IN.V_PP_INProviderFlags
pfInUpdate   TFloatFieldq_saldo_inV_PP_OUT	FieldNameV_PP_OUTOriginAAAAA.SALDO_IN.V_PP_OUTProviderFlags
pfInUpdate   TFloatFieldq_saldo_inV_TP_IN	FieldNameV_TP_INOriginAAAAA.SALDO_IN.V_TP_INProviderFlags
pfInUpdate   TFloatFieldq_saldo_inV_TP_OUT	FieldNameV_TP_OUTOriginAAAAA.SALDO_IN.V_TP_OUTProviderFlags
pfInUpdate   TFloatFieldq_saldo_inSCH_PP_IN	FieldName	SCH_PP_INOriginAAAAA.SALDO_IN.SCH_PP_INProviderFlags
pfInUpdate   TFloatFieldq_saldo_inSCH_PP_OUT	FieldName
SCH_PP_OUTOriginAAAAA.SALDO_IN.SCH_PP_OUTProviderFlags
pfInUpdate   TFloatFieldq_saldo_inSCH_TP_IN	FieldName	SCH_TP_INOriginAAAAA.SALDO_IN.SCH_TP_INProviderFlags
pfInUpdate   TFloatFieldq_saldo_inSCH_TP_OUT	FieldName
SCH_TP_OUTOriginAAAAA.SALDO_IN.SCH_TP_OUTProviderFlags
pfInUpdate    
TxProviderpr_saldo_inDataSet
q_saldo_inConstraints	
UpdateModeupWhereKeyOnlyBeforeApplyUpdatespr_saldo_inBeforeApplyUpdatesOnGetTableNamepr_saldo_inGetTableNameOnErrorExecSQL
DisplaySQLLeft� Top�   TStoredProcstp_tmpDatabaseNameAAAAASessionNameDefaultLeftTop  TQuery	q_regionsDatabaseNameAAAAASQL.StringshSelect /*+HINT1 INDEX(t1,REGIONS_AK1) */  t1.*, t2.short_name, t3.name as reg_name, t4.name as area_name3from regions t1, urp_view t2, reg_names t3, area t4wheret1.id=t2.idand t1.area_id=t4.idand t1.reg_name_id=t3.idorder by t2.short_name Left� Top| TIntegerFieldq_regionsID	FieldNameIDOriginAAAAA.REGIONS.IDProviderFlags
pfInUpdate	pfInWherepfInKey   TIntegerFieldq_regionsAREA_ID	FieldNameAREA_IDOriginAAAAA.REGIONS.AREA_IDProviderFlags
pfInUpdate   TIntegerFieldq_regionsREG_NAME_ID	FieldNameREG_NAME_IDOriginAAAAA.REGIONS.REG_NAME_IDProviderFlags
pfInUpdate   TStringFieldq_regionsSHORT_NAME	FieldName
SHORT_NAMEOriginAAAAA.URP_VIEW.SHORT_NAMEProviderFlags Size(  TStringFieldq_regionsREG_NAME	FieldNameREG_NAMEOriginAAAAA.REG_NAMES.NAMEProviderFlags   TStringFieldq_regionsAREA_NAME	FieldName	AREA_NAMEOriginAAAAA.AREA.NAMEProviderFlags Size2  TStringFieldq_regionsCEL_NOM	FieldNameCEL_NOMOriginAAAAA.REGIONS.CEL_NOMProviderFlags
pfInUpdate Size  TStringFieldq_regionsCEL_NOM_TOP	FieldNameCEL_NOM_TOPOriginAAAAA.REGIONS.CEL_NOM_TOPProviderFlags
pfInUpdate Size  TSmallintFieldq_regionsCOD	FieldNameCODOriginAAAAA.REGIONS.CODProviderFlags
pfInUpdate    
TxProvider
pr_regionsDataSet	q_regionsConstraints	
UpdateModeupWhereKeyOnlyBeforeApplyUpdatespr_regionsBeforeApplyUpdatesOnGetTableNamepr_regionsGetTableNameOnErrorExecSQLpr_regionsErrorExecSQLLeft� Top�    