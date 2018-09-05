--Select the Database
use FinancialsW1-- Example: FinancialsUS or Demo Database NAV (11-0)
go

--NAV APP Package Tables: related to NAV App table by PACKAGE ID
declare @xAppid uniqueidentifier
select @xAppid = '6106f7a9-36bf-4a4c-8480-f2198b711101' --Change this value with “id” field value in the App.json file
declare @PackageID uniqueidentifier
select @PackageID = (SELECT [Package ID] FROM [dbo].[NAV App] WHERE ID=@xAppid)

SELECT * FROM [dbo].[NAV App Capabilities] WHERE [Package ID]=@PackageID
SELECT * FROM [dbo].[NAV App Dependencies] WHERE [Package ID]=@PackageID
SELECT * FROM [dbo].[NAV App Object Metadata] WHERE [App Package ID]=@PackageID
SELECT * FROM [dbo].[NAV App Object Prerequisites] WHERE [Package ID]=@PackageID
SELECT * FROM [dbo].[NAV App Resource] WHERE [Package ID]=@PackageID
SELECT * FROM [dbo].[NAV App Tenant App] WHERE [App Package ID]=@PackageID 
SELECT * FROM [dbo].[NAV App Publish Reference] WHERE [App Package ID]=@PackageID

