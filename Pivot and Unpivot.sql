CREATE TABLE #Employee  
(  
Name [nvarchar](max),  
[Year] [int] ,  
Sales [int]  
)  

INSERT INTO #Employee
SELECT 'Pankaj',2010,72500 UNION ALL  
SELECT 'Rahul',2010,60500 UNION ALL  
SELECT 'Sandeep',2010,52000 UNION ALL  
SELECT 'Pankaj',2011,45000 UNION ALL  
SELECT 'Sandeep',2011,82500 UNION ALL  
SELECT 'Rahul',2011,35600 UNION ALL  
SELECT 'Pankaj',2012,32500 UNION ALL  
SELECT 'Pankaj',2010,20500 UNION ALL  
SELECT 'Rahul',2011,200500 UNION ALL  
SELECT 'Sandeep',2010,32000   


Select * from #Employee 

--PIVOT in SQL Server
--PIVOT relational operator convert data from row level to column level. PIVOT rotates a table-valued expression by turning the unique values from one column in the expression into multiple columns in the output. 
--Using PIVOT operator we can perform aggregate operation where we required.

SELECT [Year], Pankaj, Rahul, Sandeep FROM   
(SELECT Name, [Year] , Sales FROM #Employee )
AS Tab1  
PIVOT  
(SUM(Sales) FOR Name IN (Pankaj,Rahul,Sandeep))
AS Tab2  
ORDER BY [Tab2].[Year]  
-----------------------
SELECT Name, [2010],[2011],[2012] FROM   
(SELECT Name, [Year] , Sales FROM #Employee )Tab1  
PIVOT  
(  
SUM(Sales) FOR [Year] IN ([2010],[2011],[2012])) AS Tab2  
ORDER BY Tab2.Name  

DECLARE @Tab TABLE  
(  
[Year] int,  
Pankaj int,  
Rahul int,  
Sandeep int  
)  

--Insert Value in Temp Variable
INSERT INTO @Tab  
SELECT [Year], Pankaj,Rahul,Sandeep FROM   
(SELECT Name, [Year] , Sales FROM #Employee )Tab1  
PIVOT  
(  
SUM(Sales) FOR Name IN (Pankaj,Rahul,Sandeep)) AS Tab2  
ORDER BY [Tab2].[Year]  
--Perform UNPIVOT Operation

SELECT Name,[Year] , Sales FROM @Tab t  
UNPIVOT  
(  
Sales FOR Name IN (Pankaj,Rahul,Sandeep)  
) AS TAb2  
