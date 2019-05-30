CREATE SCHEMA [Clarity]
AUTHORIZATION [dbo]
GO
GRANT SELECT ON SCHEMA:: [Clarity] TO [GeneralReadOnly_Role]
GO
GRANT SELECT ON SCHEMA:: [Clarity] TO [LimitedDeveloper_Role]
GO
GRANT VIEW DEFINITION ON SCHEMA:: [Clarity] TO [LimitedDeveloper_Role]
GO
GRANT SELECT ON SCHEMA:: [Clarity] TO [SuperUser_Role]
GO
GRANT VIEW DEFINITION ON SCHEMA:: [Clarity] TO [SuperUser_Role]
GO
