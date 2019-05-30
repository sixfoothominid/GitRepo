CREATE ROLE [SuperUser_Role]
AUTHORIZATION [dbo]
GO
EXEC sp_addrolemember N'SuperUser_Role', N'SCLHS\EbaServer_SuperUserRO'
GO
EXEC sp_addrolemember N'SuperUser_Role', N'SCLHS\gettelc'
GO
EXEC sp_addrolemember N'SuperUser_Role', N'SCLHS\S023558'
GO
