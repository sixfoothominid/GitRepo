IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'SCLHS\gettelc')
CREATE LOGIN [SCLHS\gettelc] FROM WINDOWS
GO
CREATE USER [SCLHS\gettelc] FOR LOGIN [SCLHS\gettelc]
GO
