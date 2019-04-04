Select * from CustomerConfiguration Where CustomerID = 1

Update CustomerConfiguration Set LTELeakageSensitivity = 85  Where CustomerID = 229







DECLARE @value decimal(10,2)
SET @value = 50.512171

original value - 23  After Conversion - 22

Select 20 * log10(23) As Decimalunit

Select Cast(20 * log10(23) As Decimal(5,1)) As DecimalunitShowOnPage

Select POWER(10,45.6/20) AS Integerwhichwesave

Select CONVERT(INT,(POWER(10.0,45.6/20)) +.5) 

SELECT ROUND(@value, 2) RoundNumber

SELECT CEILING(@value) CeilingNumber

SELECT FLOOR(@value) FloorNumber

Select * from CustomerSetUp Where CustomerID = 2

Update CustomerSetup Set LeakSignalStrengthUnitsdBuVm  = 0 Where CustomerID = 2

--DECLARE @value DECIMAL(4,2) = 5.07
--SELECT @value OriginalValue, 
--        REPLACE(RIGHT(@value  + 1000, 1), '.', ':') NewValue

--Select Round(20 * log10(23),2)

--Select 20 * log10(23)

--Select CEILING ( 27.2) 

--Select Round(20 * log10(23),5)


--Select Cast(Power(10,(27.2/20)) AS INT)

--Select CEILING(Power(10,27.2/20))

--Select Cast(Power(10,27.2/20) + .5 As INTeger)
--Select POWER(10,CAST(27.2/20 AS Decimal)) AS IntegerResult  
--Select INT(MinThresholdValue) from DeviceID Where CustomerID = 1

--Select * from CustomerSetUp Where CustomerID = 1

--Update CustomerSetup Set LeakSignalStrengthUnitsdBuVm  = 1 Where CustomerID = 1

--Declare @LTESensitivity varchar(20) = '40.0000'
--Select Power(10,Cast(@LTESensitivity As decimal)/ 20)
 
--Select * from CustomerConfiguration Where CustomerID = 1

--Declare @pagevalue Decimal(5,1) = 0.0
--Select @pagevalue / 20
--Select power(10,@pagevalue)

-- SELECT *
--	FROM CustomerDeviceConfig 
--	WHERE CustomerID IS NULL
	
--	Declare @DeviceMinThresholdValue AS Float = '29.6'
--	 IF EXISTS (Select 1 From CustomerSetUp Where CustomerID = 1 AND LeakSignalStrengthUnitsdBuVm = 1 AND ISActive = 1 )
--            BEGIN
--				Set @DeviceMinThresholdValue = (Select Power(10,@DeviceMinThresholdValue/ 20))
--				Print @DeviceMinThresholdValue
--			END
			
--			Select Power(10,20/20)
			
--Select MinThresholdValue,* from  DEVICE 
--		WHERE  CustomerID = 1 AND  DeviceID = 394 
		
--		000000500101  -- 26  -- 28.3
		
--		000000500162  --23.0 -- 27.2
		
--		000000502441  --10.0 -- 20.0
		
--		000001804103  -- 20.0   26.0
		
		
--		000000500592 --  26.0 28.0 26.0  20  25  20