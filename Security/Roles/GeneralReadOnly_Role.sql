CREATE ROLE [GeneralReadOnly_Role]
AUTHORIZATION [dbo]
GO
EXEC sp_addrolemember N'GeneralReadOnly_Role', N'SCLHS\EbaServer_GeneralRO'
GO
