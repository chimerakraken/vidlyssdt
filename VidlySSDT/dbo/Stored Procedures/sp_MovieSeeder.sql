CREATE PROCEDURE [dbo].[sp_MovieSeeder]
	@numberOfRecordsToSeed int
AS
	DECLARE @counter int
	SET @counter = 1


	CREATE TABLE #RandomAdjective 
	 (id INT IDENTITY(1,1),
	 Adjective VARCHAR(50),
	 )
	 
	 
	INSERT INTO #RandomAdjective
	(Adjective) VALUES
	 ('Adorable') 
,('Adventurous')
,('Aggressive')
,('Agreeable')
,('Alert')
,('Alive')
,('Amused')
,('Angry')
,('Annoyed')
,('Annoying')
,('Anxious')
,('Arrogant')
,('Ashamed')
,('Attractive')
,('Average')
,('Awful')
,('Bad')
,('Beautiful')
,('Better')
,('Bewildered')
,('Black')
,('Bloody')
,('Blue')
,('Blue-eyed')
,('Blushing')
,('Bored')
,('Brainy')
,('Brave')
,('Breakable')
,('Bright')
,('Busy')
,('Calm')
,('Careful')
,('Cautious')
,('Charming')
,('Cheerful')
,('Clean')
,('Clear')
,('Clever')
,('Cloudy')
,('Clumsy')
,('Colorful')
,('Combative')
,('Comfortable')
,('Concerned')
,('Condemned')
,('Confused')
,('Cooperative')
,('Courageous')
,('Crazy')
,('Creepy')
,('Crowded')
,('Cruel')
,('Curious')
,('Cute')
,('Dangerous')
,('Dark')
,('Dead')
,('Defeated')
,('Defiant')
,('Delightful')
,('Depressed')
,('Determined')
,('Different')
,('Difficult')
,('Disgusted')
,('Distinct')
,('Disturbed')
,('Dizzy')
,('Doubtful')
,('Drab')
,('Dull')
	
	
	CREATE TABLE #RandomPersonName
	(id INT IDENTITY(1,1),
	 PersonName VARCHAR(100),
	)

	INSERT INTO #RandomPersonName
	(PersonName) VALUES
	 ('DJ')
,('Dum Dum')
,('Sweety')
,('Piglet')
,('Cat')
,('Dimples')
,('Butterfinger')
,('Blondie')
,('Harry Potter')
,('Ginger')
,('Chicken Wing	')
,('Belle')
,('Barbie')
,('Dilly Dally')
,('Pig')
,('Romeo')
,('Skinny Jeans')
,('Chuckles')
,('Bessie')
,('Genius')
,('Pixie')
,('Pixie Stick')
,('Chip')
,('Cuddles')
,('Kitten')
,('Chicken Legs')
,('Tickles')
,('Rockette')
,('Coke Zero')
,('Buddy')
,('Dragon')
,('Hot Sauce')
,('Teeny')
,('Ace')
,('Donut')
,('Pearl')
,('Prego')
,('Chica')
,('Chickie')
,('Shuttershy')
,('Freak')
,('Einstein')
,('Swiss Miss')
,('Chump')
,('Spud')
,('Apple')
,('Apple Jack')
,('Fury')
,('Gummi Bear')
,('Punk')

	CREATE TABLE #RandomConnectives
	(id INT IDENTITY(1,1),
	 Connective VARCHAR(100),
	)

	INSERT INTO #RandomConnectives
	(Connective) VALUES
	('Of'),
	('Of the'),
	('And'),
	('And the'),
	('The'),
	('From')

	WHILE (@counter <= @numberOfRecordsToSeed)
	BEGIN

	-- IF 0 then use connectives
	IF ( CRYPT_GEN_RANDOM(1) % 2) = 0
	
	INSERT INTO dbo.Movies
		VALUES
		( 
		(SELECT TOP 1 PersonName FROM #RandomPersonName ORDER by NEWID()) + ' ' +
		(SELECT TOP 1 Connective FROM #RandomConnectives ORDER by NEWID()) + ' ' +
		(SELECT TOP 1 Adjective FROM #RandomAdjective ORDER by NEWID()) 
		
		, CONVERT(VARCHAR(10), getdate(), 111), ABS(CHECKSUM(NewId())) % 20, 1,  CONVERT(DECIMAL(10,2),ABS(CHECKSUM(NewId())) % 1000) )

	ELSE

	INSERT INTO dbo.Movies
		VALUES
		( 
		(SELECT TOP 1 Adjective FROM #RandomAdjective ORDER by NEWID()) + ' ' +
		(SELECT TOP 1 PersonName FROM #RandomPersonName ORDER by NEWID()) 
		
		, CONVERT(VARCHAR(10), getdate(), 111),ABS(CHECKSUM(NewId())) % 20, 1, CONVERT(DECIMAL(10,2),ABS(CHECKSUM(NewId())) % 1000) )


	SET @Counter  = @Counter  + 1
	END
