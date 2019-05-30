CREATE TABLE [Clarity].[EssentialHspAcctPxList]
(
[HSP_ACCOUNT_ID] [numeric] (18, 0) NOT NULL,
[LINE] [numeric] (38, 0) NOT NULL,
[PXFILTER] [varchar] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FINAL_ICD_PX_ID] [varchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ICD_PX_NAME] [varchar] (254) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PROC_MASTER_NM] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SHORT_PROC_NAME] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BILL_DESC] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[REF_BILL_CODE] [varchar] (254) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[REF_BILL_CODE_SET] [varchar] (254) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PROC_DATE] [date] NULL,
[PROC_PERF_PROV_ID] [varchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PROV_NAME] [varchar] (254) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PROV_TYPE] [varchar] (254) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PROV_SPECIALTY1] [varchar] (254) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PROV_SPECIALTY2] [varchar] (254) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PROV_SPECIALTY3] [varchar] (254) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PX_AFCT_ROM_YN] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PX_EXCLD_RPT_YN] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PX_AFCT_SOI_YN] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [ix_Pk_EssentialHspAcctPxList_Mult1] ON [Clarity].[EssentialHspAcctPxList] ([HSP_ACCOUNT_ID], [LINE]) WITH (IGNORE_DUP_KEY=ON) ON [PRIMARY]
GO
