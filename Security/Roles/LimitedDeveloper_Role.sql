CREATE ROLE [LimitedDeveloper_Role]
AUTHORIZATION [dbo]
GO
EXEC sp_addrolemember N'LimitedDeveloper_Role', N'SCLHS\EbaServer_LimDevRO'
GO
