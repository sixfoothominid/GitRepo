IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'SCLHS\EbaServer_GeneralRO')
CREATE LOGIN [SCLHS\EbaServer_GeneralRO] FROM WINDOWS
GO
CREATE USER [SCLHS\EbaServer_GeneralRO] FOR LOGIN [SCLHS\EbaServer_GeneralRO]
GO
