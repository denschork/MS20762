-- step 1
USE TempDB
GO

--step 2
CREATE SEQUENCE dbo.RecordIDSeq
 AS int
 START WITH 100
 INCREMENT BY 1
 MAXVALUE 105
GO

--step 3
CREATE TABLE dbo.Table1(
	ID int NULL,
	[Name] nchar(10) NULL,
	City nchar(10) NULL
) 
GO

--step 4
INSERT INTO dbo.Table1 (ID, [Name], City)
VALUES
	(NEXT VALUE FOR RecordIDSeq, 'Bob', 'LA'),
	(NEXT VALUE FOR RecordIDSeq, 'Sue', 'NY'),
	(NEXT VALUE FOR RecordIDSeq, 'Alan', 'MIA'),
	(NEXT VALUE FOR RecordIDSeq, 'Sue', 'CHI'),
	(NEXT VALUE FOR RecordIDSeq, 'Sue', 'SFRAN');
GO

SELECT * FROM dbo.Table1;
GO

--step 5
INSERT INTO dbo.Table1 (ID, [Name], City)
  VALUES
   (NEXT VALUE FOR RecordIDSeq, 'Gary', 'LA'),
   (NEXT VALUE FOR RecordIDSeq, 'Mary', 'NO');

SELECT * FROM dbo.Table1;
GO

--step 6
ALTER SEQUENCE RecordIDSeq
MAXVALUE 200;


--step 7
INSERT INTO dbo.Table1 (ID, [Name], City)
  VALUES
   (NEXT VALUE FOR RecordIDSeq, 'Gary', 'LA'),
   (NEXT VALUE FOR RecordIDSeq, 'Mary', 'NO');

GO

SELECT * FROM dbo.Table1;
GO

--step 8
DROP TABLE dbo.Table1
GO

DROP SEQUENCE [dbo].[RecordIDSeq]
GO

