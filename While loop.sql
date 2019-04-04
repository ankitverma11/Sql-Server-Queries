Declare @count int , @min int = 1 , @max int
Select [RN] = Row_number() OVER (ORDER BY CustomerID ASC), CustomerID into #customerSetup From CustomerSetup where IsActive = 1 order by CustomerID ASC
Select @max = Count(0) from #customerSetup 

	  While @min <= @max
	  BEGIN
	 Select CustomerID from #customerSetup where RN = @min
	  Set @min = @min + 1
	  END
Drop table #customerSetup