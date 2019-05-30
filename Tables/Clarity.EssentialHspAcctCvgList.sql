CREATE TABLE [Clarity].[EssentialHspAcctCvgList]
(
[HSP_ACCOUNT_ID] [numeric] (18, 0) NULL,
[LINE] [numeric] (38, 0) NULL,
[COVERAGE_ID] [numeric] (18, 0) NULL,
[PAYOR_ID] [numeric] (18, 0) NULL,
[PAYOR_NAME] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BENEFIT_PLAN_ID] [numeric] (18, 0) NULL,
[BENEFIT_PLAN_NAME] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FINANCIAL_CLASS] [varchar] (66) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FINANCIAL_CLASS_NAME] [varchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [ix_Pk_EssentialHspAcctCvgList_Mult1] ON [Clarity].[EssentialHspAcctCvgList] ([HSP_ACCOUNT_ID], [LINE]) WITH (IGNORE_DUP_KEY=ON) ON [PRIMARY]
GO
