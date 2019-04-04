Declare @Band decimal(5,1) = 25--25
Select @Band = 20 * log10(@Band)    -- log 10
Select @Band
Select @Band/20

Select POWER(10,1.400000)  -- inver log 10 



--------------

--Declare @Band varchar(20) = 28.0,--25,
--  @BAND1Value  Decimal(5,1),
--  @BAND2Value  Decimal(5,1),
--  @BAND3Value  Decimal(5,1) 
  
--  Select @BAND1Value = Cast(@Band AS DEcimal(5,1)) / 20 
--  Set @BAND1Value = Power(10,@BAND1Value)
--  Select @BAND1Value


--Select * from MPLLeakageVerification

--    --select * from CustomerSetup
--    Select * from QAMMeasurementDetailForMPLLeakVerification
--    Update QAMMeasurementDetailForMPLLeakVerification Set LeakLevel = 4 Where QAMMeasurementDetailID = 3
--    Update CustomerSetup Set LeakSignalStrengthUnitsdBuVm = 1 Where CustomerID = 1
    
--    Declare @BAND varchar(50)
--    Declare @BAND1Value  Decimal(5,1),
--  @BAND2Value  Decimal(5,1),
--  @BAND3Value  Decimal(5,1),
--  @Band1 Decimal(5,1) = NULL,  
-- @Band2 Decimal(5,1) = NULL,   
-- @Band3 Decimal(5,1) = NULL      
-- Set @Band1=N'13.0'
--  Set @Band2=N'20.0'
--  Set @Band3=N'20.0' 
--     IF ISNULL(@Band1,0) <> 0 AND ISNULL(@Band2,0) <> 0 AND ISNULL(@Band3,0) <> 0 
--BEGIN  

--SET @BAND =  Cast(@Band1 As varchar) + ',' + Cast(@Band2 As varchar) + ','+ Cast(@Band3 As varchar)   
--Select @BAND
--END  
--   Set @BAND = (  Select Distinct  
             
--              ISNULL(Band1,10) +','+
              
--              ISNULL(Band2,10) +','+
--               ISNULL(Band3,10)
--               From MPLLeakageVerification MLV  
--               INNER JOIN CustomerSetUp CSU ON MLV.CustomerID = Csu.CustomerID
--               where MLV.CustomerID = 1)
--               Select @BAND
 
-- Declare   @BAND1Leak varchar(10),
--  @BAND2Leak  varchar(10),
--  @BAND3Leak  varchar(10)              

--Declare @BAND1Value  Decimal(5,1),
--  @BAND2Value  Decimal(5,1),
--  @BAND3Value  Decimal(5,1),
--  @Band1 Decimal(5,1) = NULL,  
-- @Band2 Decimal(5,1) = NULL,   
-- @Band3 Decimal(5,1) = NULL      
-- Set @Band1=N'13.0'
--  Set @Band2=N'20.0'
--  Set @Band3=N'20.0'  
  
--  IF ISNULL(@Band1,0) <> 0 AND ISNULL(@Band2,0) <> 0 AND ISNULL(@Band3,0) <> 0 
--BEGIN
--Select 1 
--END       
--IF EXISTS (Select 1 From CustomerSetUp Where CustomerID = 1 AND LeakSignalStrengthUnitsdBuVm = 1 AND ISActive = 1 )
--BEGIN
--Select 1
--Select 
--@BAND1Value =  Cast(@Band1 As Decimal(5,1))/ 20 , @BAND2Value = Cast(@Band2 As Decimal(5,1)) / 20 , @BAND3Value = Cast(@Band3 As Decimal(5,1))/ 20
--Set @BAND1Value = Power(10,@BAND1Value)
--Set @BAND2Value = Power(10,@BAND2Value)
--Set @BAND3Value = Power(10,@BAND3Value)

--Update
-- MLV SET Band1 = @BAND1Value, Band2 = @BAND2Value, Band3 = @BAND3Value 
-- From MPLLeakageVerification MLV  
--Where  MLV.CustomerID = 2
--END
                                   
-- Alter table MPLLeakageVerification Alter column Band1 Decimal(5,1)
--                         Alter table MPLLeakageVerification Alter column Band2 Decimal(5,1)
--                                   Alter table MPLLeakageVerification Alter column Band3 Decimal(5,1)   
                                   