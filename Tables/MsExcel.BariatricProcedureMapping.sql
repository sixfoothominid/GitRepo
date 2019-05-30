CREATE TABLE [MsExcel].[BariatricProcedureMapping]
(
[PRIMARY_PROCEDURE_NAME] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PRIMARY_PROCEDURE_ID] [float] NULL,
[PRIMARY_PROCEDURE_CODE] [float] NULL,
[Include_YN] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Procedure_Group_Type_MBSAQIP ] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Procedure_Sub_Group] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
