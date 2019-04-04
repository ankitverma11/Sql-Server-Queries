   
 /*  
=======================================================================================================            
 Author    : Ankit verma     
 Date    : 14-11-2017  
 Input Parameters : WorkorderID,ColumnType,UitType    
 Description  : This function returns the associated Linked Leaks     
  
 MODIFIED BY    DATE    REASON    
  
   
  
--Select dbo.fn_LinkedLeakDatawithlevel (0,'LeakSignalStrength',0,7241107)  -- 62,52,85  -- 35,34,38  
--Select dbo.fn_LinkedLeakData (0,'DeviceFrequency',0,2119861)  
--Select dbo.fn_LinkedLeak (1069834,'DeviceFrequency',1)  
--Select Cast(20 * log10(ISNULL(85,1)) As Decimal(5,1))  
 option (maxrecursion 0)  
 ======================================================================================================            
*/   
  
  
   
  
CREATE Function [dbo].[fn_LinkedLeakDatawithlevel]  
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
Declare @TemplinktableLeak Table (startid int identity(1,1),ID Float,finalResult varchar(200))  
Declare @TemplinktableDevice Table (startid int identity(1,1),ID Float)  
  
Declare @Templinkresult Table (Levelwithunit varchar(400))  
  
  
IF @Leakage = 0  
BEGIN  
Select @LeakageID = L.LeakageID From Leakage L WITH(NOLOCK) Inner Join WorkOrders W WITH(NOLOCK) On L.LeakageID = W.LeakageID Where W.WorkOrderID =  @WorkorderID   
END  
ELSE  
BEGIN  
Set @LeakageID  = @Leakage  
END  
  
--IF @Type = 'LeakSignalStrength'  
BEGIN  
Insert Into @TemplinktableLeak (ID)   
Select LeakSignalStrength from   
(  
Select   
 Case When @UnitType = 1 then Cast(20 * log10(ISNULL(LeakSignalStrength,1)) As Decimal(5,1))  
                         ELSE  ISNULL(LeakSignalStrength,0) END AS LeakSignalStrength , DeviceFrequency  
         from Leakage WITH(NOLOCK) where LeakageID = @LeakageID  
UNION ALL  
SELECT   
 Case When @UnitType = 1 then Cast(20 * log10(ISNULL(LeakSignalStrength,1)) As Decimal(5,1))  
                         ELSE  ISNULL(LeakSignalStrength,0) END AS LeakSignalStrength , DeviceFrequency  
        FROM Leakage WITH(NOLOCK) Where BaseLeakageID = @LeakageID  
) Leak  order by DeviceFrequency ASC  
END  
  
   
  
   
  
--ELSE IF @Type = 'DeviceFrequency'  
BEGIN  
Insert Into @TemplinktableDevice (ID)   
Select * from   
(  
  
Select   
 Case When @UnitType = 1 then Cast(20 * log10(ISNULL(DeviceFrequency,1)) As Decimal(5,1))  
                         ELSE  ISNULL(DeviceFrequency,0) END AS DeviceFrequency  
         from Leakage WITH(NOLOCK) where LeakageID = @LeakageID  
         
UNION ALL  
SELECT   
 Case When @UnitType = 1 then Cast(20 * log10(ISNULL(DeviceFrequency,1)) As Decimal(5,1))  
                         ELSE  ISNULL(DeviceFrequency,0) END AS DeviceFrequency  
        FROM Leakage WITH(NOLOCK) Where BaseLeakageID = @LeakageID  
        
)   Leak  order by Leak.DeviceFrequency ASC   
END  
  
   
  
insert into @Templinkresult   
Select    
 case when @UnitType = 1 then cast(tl.ID as varchar) + ' dbµV/m @ ' +  cast(td.ID as varchar)  +' MHz'  
 else  cast(tl.ID as varchar) + ' µV/m @ ' +  cast(td.ID as varchar) +' MHz' End As Levelwithunit  
from  @TemplinktableLeak tl inner join @TemplinktableDevice td on   
tl.startid = td.startid  
   
  
Set @result =   
(Select   
               Leak = STUFF(( Select ',' + Cast(Levelwithunit As Varchar) FROM @Templinkresult   FOR XML PATH ('')),1,1,''))  
  
Return ISNULL(@result,'0')  
END  
  
  
  