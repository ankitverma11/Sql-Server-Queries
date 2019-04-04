  
  
 /*  
=======================================================================================================            
 Author    : Ankit verma     
 Date    : 17-10-2016  
 Input Parameters : WorkorderID,ColumnType,UitType    
 Description  : This function returns the associated Linked Leaks     
  
 MODIFIED BY    DATE    REASON    
  
  Select dbo.fn_LinkedLeakData (0,'DeviceFrequency',0,7149773)   
  
  
 ======================================================================================================            
*/   
  
Alter Function [dbo].[fn_LinkedLeakData]  
(  
@WorkorderID int,  
@Type varchar(25),  
@UnitType int,  
@Leakage Int   
)  
Returns VARCHAR(max)  
  
BEGIN  
Declare @result varchar(max)  
Declare @LeakageID Int  
Declare @Templinktable Table (ID Float)  
Declare @Templeakktable Table (ID int)  
  
IF @Leakage = 0  
BEGIN  
Select @LeakageID = L.LeakageID From Leakage L  With (NOLOCK) Inner Join WorkOrders W  With (NOLOCK) On L.LeakageID = W.LeakageID Where W.WorkOrderID =  @WorkorderID   
END  
ELSE  
BEGIN  
Set @LeakageID  = @Leakage  
END  
  
IF @Type = 'LeakSignalStrength'  
BEGIN  
Insert Into @Templinktable (ID)   
Select LeakSignalStrength from   
(  
Select   
 Case When @UnitType = 1 then Cast(20 * log10(ISNULL(LeakSignalStrength,1)) As Decimal(5,1))  
                         ELSE  ISNULL(LeakSignalStrength,0) END AS LeakSignalStrength , DeviceFrequency  
         from Leakage  With (NOLOCK) where LeakageID = @LeakageID  
UNION ALL  
SELECT   
 Case When @UnitType = 1 then Cast(20 * log10(ISNULL(LeakSignalStrength,1)) As Decimal(5,1))  
                         ELSE  ISNULL(LeakSignalStrength,0) END AS LeakSignalStrength , DeviceFrequency  
        FROM Leakage  With (NOLOCK) Where BaseLeakageID = @LeakageID  
) Leak  order by DeviceFrequency ASC  
  
  
  
END  
ELSE IF @Type = 'DeviceFrequency'  
BEGIN  
  
Insert Into @Templinktable (ID)   
Select * from   
(  
  
Select   
 Case When @UnitType = 1 then Cast(20 * log10(ISNULL(DeviceFrequency,1)) As Decimal(5,1))  
                         ELSE  ISNULL(DeviceFrequency,0) END AS DeviceFrequency  
         from Leakage  With (NOLOCK) where LeakageID = @LeakageID  
         
UNION ALL  
SELECT   
 Case When @UnitType = 1 then Cast(20 * log10(ISNULL(DeviceFrequency,1)) As Decimal(5,1))  
                         ELSE  ISNULL(DeviceFrequency,0) END AS DeviceFrequency  
        FROM Leakage  With (NOLOCK) Where BaseLeakageID = @LeakageID  
        
)   Leak  order by Leak.DeviceFrequency ASC   
  

END  
  
ELSE IF @Type = 'LeakageID'  
BEGIN  
  
Insert Into @Templeakktable (ID)   
Select LeakageID from   
(  
  
Select  LeakageID , DeviceFrequency from Leakage  With (NOLOCK) where LeakageID = @LeakageID  
         
UNION ALL  
SELECT  LeakageID ,DeviceFrequency  FROM Leakage  With (NOLOCK) Where BaseLeakageID = @LeakageID  
        
)   Leak  order by Leak.DeviceFrequency ASC   
  
END  
  
IF @Type = 'LeakageID'  
BEGIN  
Set @result = (Select   
               Leak = STUFF(( Select ',' + Cast(ID As Varchar) FROM @Templeakktable  order by ID ASC FOR XML PATH ('')),1,1,''))  
END  
ELSE  
BEGIN  
Set @result = (Select   
               Leak = STUFF(( Select ',' + Cast(ID As Varchar) FROM @Templinktable order by ID ASC FOR XML PATH ('')),1,1,''))  
END  
Return @result  
END  
  
  
  