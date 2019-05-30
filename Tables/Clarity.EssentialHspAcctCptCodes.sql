CREATE TABLE [Clarity].[EssentialHspAcctCptCodes]
(
[Hsp_Account_ID] [numeric] (18, 0) NOT NULL,
[Line] [int] NOT NULL,
[Cpt_Code] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Cpt_Code_Desc] [varchar] (1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Cpt_Code_Date] [date] NULL,
[Cpt_Perf_Prov_ID] [varchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Cpt_Perf_Prov_Name] [varchar] (254) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Cpt_Event_Number] [numeric] (18, 0) NULL,
[Cpt_Modifiers] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Lmrp_Code] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PX_APC_WEIGHT] [numeric] (18, 2) NULL,
[PX_APC_FAC_RMB_AMT] [numeric] (18, 2) NULL,
[Px_Apc_Code] [varchar] (254) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Px_Reimb_Type] [varchar] (254) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Px_Hcfa_Paymt_Amt] [numeric] (18, 2) NULL,
[Px_Copay_Amt] [numeric] (18, 2) NULL,
[px_Pay_Rt_Unit_Amt] [numeric] (18, 2) NULL,
[Px_Rev_Code_ID] [numeric] (18, 0) NULL,
[Cpt_Quantity] [numeric] (18, 0) NULL
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [ix_pkHarLine] ON [Clarity].[EssentialHspAcctCptCodes] ([Hsp_Account_ID], [Line]) WITH (IGNORE_DUP_KEY=ON) ON [PRIMARY]
GO
