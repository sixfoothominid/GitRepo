IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'SCLHS\EbaServer_LimDevRO')
CREATE LOGIN [SCLHS\EbaServer_LimDevRO] FROM WINDOWS
GO
CREATE USER [SCLHS\EbaServer_LimDevRO] FOR LOGIN [SCLHS\EbaServer_LimDevRO]
GO
