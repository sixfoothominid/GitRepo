CREATE TABLE [Clarity].[EssentialHspAcctDxList]
(
[HSP_ACCOUNT_ID] [numeric] (18, 0) NOT NULL,
[LINE] [numeric] (38, 0) NOT NULL,
[REF_BILL_CODE] [varchar] (254) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DX_ID] [numeric] (18, 0) NULL,
[DX_NAME] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CURRENT_ICD9_LIST] [varchar] (254) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CURRENT_ICD10_LIST] [varchar] (254) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DX_POA_YNU] [varchar] (254) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DX_AFFECTS_DRG_YN] [varchar] (254) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DX_COMORBIDITY_YN] [varchar] (254) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FINAL_DX_SOI_C] [numeric] (38, 0) NULL,
[SEVERITY_OF_ILLNESS] [varchar] (254) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FINAL_DX_ROM_C] [numeric] (38, 0) NULL,
[RISK_OF_MORTALITY] [varchar] (254) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FINAL_DX_EXCLD_YN] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FNL_DX_AFCT_SOI_YN] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FNL_DX_AFCT_ROM_YN] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FINAL_DX_POA_C] [numeric] (38, 0) NULL,
[DX_PRESENTONADMIT] [varchar] (254) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DX_COMORBIDITY_C] [numeric] (38, 0) NULL,
[COMPLICATION_EXIST] [varchar] (254) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DX_HAC_YN] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [ix_Pk_EssentialHspAcctDxList_Mult1] ON [Clarity].[EssentialHspAcctDxList] ([HSP_ACCOUNT_ID], [LINE]) WITH (IGNORE_DUP_KEY=ON) ON [PRIMARY]
GO
