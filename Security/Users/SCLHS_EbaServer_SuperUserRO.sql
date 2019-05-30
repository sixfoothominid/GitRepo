IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'SCLHS\EbaServer_SuperUserRO')
CREATE LOGIN [SCLHS\EbaServer_SuperUserRO] FROM WINDOWS
GO
CREATE USER [SCLHS\EbaServer_SuperUserRO] FOR LOGIN [SCLHS\EbaServer_SuperUserRO]
GO
