--Select the Database
use [FinancialsW1] 
go

--NAV APP Schema Tables: related to NAV App table by ID
declare @id uniqueidentifier
select @id = '6106f7a9-36bf-4a4c-8480-f2198b711101' --Change this value with “id” field value in the App.json file

SELECT * FROM [dbo].[$ndo$navappschemasnapshot] WHERE appid = @id
SELECT * FROM [dbo].[$ndo$navappschematracking] WHERE appid = @id
SELECT * FROM [dbo].[$ndo$navappuninstalledapp] WHERE appid = @id
