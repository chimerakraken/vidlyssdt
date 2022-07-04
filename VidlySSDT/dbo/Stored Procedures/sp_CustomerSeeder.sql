﻿CREATE PROCEDURE [dbo].[sp_CustomerSeeder]
	@numberOfRecordsToSeed int
AS
	DECLARE @counter int
	SET @counter = 1


	CREATE TABLE #RandomPersonName
	(id INT IDENTITY(1,1),
	 PersonName VARCHAR(100),
	)

	INSERT INTO #RandomPersonName
	(PersonName) VALUES
 ('SMITH')
,('BROWN')
,('WILSON')
,('ROBERTSON')
,('CAMPBELL')
,('STEWART')
,('THOMSON')
,('ANDERSON')
,('SCOTT')
,('MACDONALD')
,('REID')
,('MURRAY')
,('CLARK')
,('TAYLOR')
,('ROSS')
,('YOUNG')
,('PATERSON')
,('WATSON')
,('MITCHELL')
,('FRASER')
,('MORRISON')
,('WALKER')
,('MCDONALD')
,('GRAHAM')
,('MILLER')
,('JOHNSTON')
,('HENDERSON')
,('CAMERON')
,('DUNCAN')
,('GRAY')
,('KERR')
,('HAMILTON')
,('HUNTER')
,('DAVIDSON')
,('FERGUSON')   
,('BELL')
,('MACKENZIE')
,('MARTIN')
,('SIMPSON')
,('ALLAN')
,('KELLY')
,('MACLEOD')
,('BLACK')
,('MACKAY')
,('WALLACE')
,('MCLEAN')
,('KENNEDY')
,('GIBSON')
,('RUSSELL')
,('MARSHALL')
,('GORDON')
,('BURNS')
,('STEVENSON')
,('MILNE')
,('CRAIG')
,('WOOD')
,('WRIGHT')
,('MUNRO')
,('JOHNSTONE')
,('RITCHIE')
,('SINCLAIR')
,('WATT')
,('MCKENZIE')
,('MUIR')
,('MURPHY')
,('SUTHERLAND')
,('MCMILLAN')
,('WHITE')
,('MCKAY')
,('MILLAR')
,('HUGHES')
,('CRAWFORD')
,('WILLIAMSON')
,('DOCHERTY')
,('MACLEAN')
,('FLEMING')
,('CUNNINGHAM')
,('DICKSON')
,('BOYLE')
,('DOUGLAS')
,('MCINTOSH')
,('BRUCE')
,('SHAW')
,('MCGREGOR')
,('LINDSAY')
,('JAMIESON')
,('HAY')
,('CHRISTIE')
,('BOYD')
,('AITKEN')
,('RAE')
,('HILL')
,('MCCALLUM')
,('ALEXANDER')
,('MCINTYRE')
,('CURRIE')
,('RAMSAY')
,('MACKIE')
,('WEIR')
,('JONES')
,('CAIRNS')
,('WHYTE')
,('MCLAUGHLIN')
,('JACKSON')
,('FINDLAY')
,('FORBES')
,('KING')
,('DONALDSON')
,('HUTCHISON')
,('MCCULLOCH')
,('MCLEOD')
,('MCFARLANE')
,('NICOL')
,('BUCHANAN')
,('PATON')
,('MOORE')
,('DUFFY')
,('REILLY')

	WHILE (@counter <= @numberOfRecordsToSeed)
	BEGIN

	INSERT INTO dbo.Customers
		VALUES
		( 
		(SELECT TOP 1 PersonName FROM #RandomPersonName ORDER by NEWID()) + ' ' +
		(SELECT TOP 1 LEFT( PersonName, 1) FROM #RandomPersonName ORDER by NEWID()) + '. ' +
		(SELECT TOP 1 PersonName FROM #RandomPersonName ORDER by NEWID()) 
		
		, CRYPT_GEN_RANDOM(1) % 2 , 1, CONVERT(VARCHAR(10), getdate(), 111), NULL )

	SET @Counter  = @Counter  + 1
	END
