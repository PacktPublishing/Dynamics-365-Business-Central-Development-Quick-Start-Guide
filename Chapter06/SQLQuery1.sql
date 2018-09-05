--Select the Database
use [FinancialsW1] -- Example: FinancialsW1 or Demo Database NAV (11-0)
go
--NAV APP Tables: relates each other by NAV APP ID
declare @Appid uniqueidentifier
select @Appid = '6106f7a9-36bf-4a4c-8480-f2198b711101' --Change this value with “id” field value in the App.json file
SELECT * FROM [dbo].[NAV App]               WHERE ID=@Appid       
SELECT * FROM [dbo].[NAV App Data Archive]  WHERE [App ID]=@Appid
SELECT * FROM [dbo].[NAV App Installed App] WHERE [App ID]=@Appid
SELECT * FROM [dbo].[NAV App Tenant Add-In] WHERE [App ID]=@Appid
SELECT * FROM [dbo].[NAV App Published App] WHERE [App ID]=@Appid

