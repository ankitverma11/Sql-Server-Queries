  
  
 /*  
=======================================================================================================            
 Author    : Ankit verma     
 Date    : 22-11-2017  
 Description  : This function returns the associated Linked Leaks with sort   
  
 MODIFIED BY    DATE    REASON    
  
  Select [dbo].[fn_LinkedLeakDatawithSorting]('LeakSignalStrength',0,1510115,'LeakSignalStrength ASC') -- DeviceFrequency   LeakSignalStrength  1510115 1757201  
    Select [dbo].[fn_LinkedLeakDatawithSorting]('LeakSignalStrength',0,2016,'LeakSignalStrength D')   
   Select [dbo].[fn_LinkedLeakDatawithSorting]('LeakSignalStrength',0,2016,'DeviceFrequency ASC')   
       Select [dbo].[fn_LinkedLeakDatawithSorting]('LeakSignalStrength',0,2016,'DeviceFrequency D')   
 ======================================================================================================            
*/   
  
CREATE Function [dbo].[fn_LinkedLeakDatawithSorting]  
(  
@Type varchar(25),  
@UnitType int,  
@Leakage Int,  
@SortID varchar(100)   
)  
Returns VARCHAR(max)  
  
BEGIN  
Declare @result varchar(max)  
Declare @Templinktable Table (ID Float)  
  
IF @Type = 'LeakSignalStrength'  
BEGIN  
Insert Into @Templinktable (ID)   
Select LeakSignalStrength from   
(  
Select   
 Case When @UnitType = 1 then Cast(20 * log10(ISNULL(LeakSignalStrength,1)) As Decimal(5,1))  
                         ELSE  ISNULL(LeakSignalStrength,0) END AS LeakSignalStrength ,   
       Case When @UnitType = 1 then Cast(20 * log10(ISNULL(DeviceFrequency,1)) As Decimal(5,1))  
                         ELSE  ISNULL(DeviceFrequency,0) END AS DeviceFrequency   
         from Leakage with(nolock) where LeakageID = @Leakage  
UNION ALL  
SELECT   
 Case When @UnitType = 1 then Cast(20 * log10(ISNULL(LeakSignalStrength,1)) As Decimal(5,1))  
                         ELSE  ISNULL(LeakSignalStrength,0) END AS LeakSignalStrength ,    
       Case When @UnitType = 1 then Cast(20 * log10(ISNULL(DeviceFrequency,1)) As Decimal(5,1))  
                         ELSE  ISNULL(DeviceFrequency,0) END AS DeviceFrequency   
        FROM Leakage with(nolock) Where BaseLeakageID = @Leakage  
) Leak  ORDER BY  CASE WHEN @SortID IS NULL THEN DeviceFrequency END ASC ,   
                  case when @SortID = 'LeakSignalStrength ASC' THEN LeakSignalStrength  END ASC,  
                  case when @SortID = 'LeakSignalStrength D' then LeakSignalStrength end DESC,  
       case when @SortID = 'DeviceFrequency ASC' THEN DeviceFrequency END ASC ,  
                  case when @SortID = 'DeviceFrequency D' then DeviceFrequency end DESC   
         
  
  
END  
ELSE IF @Type = 'DeviceFrequency'  
BEGIN  
  
Insert Into @Templinktable (ID)   
Select DeviceFrequency from   
(  
  
Select   
 Case When @UnitType = 1 then Cast(20 * log10(ISNULL(DeviceFrequency,1)) As Decimal(5,1))  
                         ELSE  ISNULL(DeviceFrequency,0) END AS DeviceFrequency ,  
         Case When @UnitType = 1 then Cast(20 * log10(ISNULL(LeakSignalStrength,1)) As Decimal(5,1))  
                         ELSE  ISNULL(LeakSignalStrength,0) END AS LeakSignalStrength   
         from Leakage with(nolock) where LeakageID = @Leakage  
         
UNION ALL  
SELECT   
 Case When @UnitType = 1 then Cast(20 * log10(ISNULL(DeviceFrequency,1)) As Decimal(5,1))  
                         ELSE  ISNULL(DeviceFrequency,0) END AS DeviceFrequency,  
       Case When @UnitType = 1 then Cast(20 * log10(ISNULL(LeakSignalStrength,1)) As Decimal(5,1))  
                         ELSE  ISNULL(LeakSignalStrength,0) END AS LeakSignalStrength   
        FROM Leakage with(nolock) Where BaseLeakageID = @Leakage  
        
)   Leak  order by CASE WHEN @SortID IS NULL THEN DeviceFrequency END ASC ,   
                   case when @SortID = 'LeakSignalStrength ASC' THEN LeakSignalStrength END ASC ,  
                   case when @SortID = 'LeakSignalStrength D' then LeakSignalStrength end DESC,  
       case when @SortID = 'DeviceFrequency ASC' THEN DeviceFrequency END ASC ,  
                   case when @SortID = 'DeviceFrequency D' then DeviceFrequency end DESC  
  
END  
  
  
Set @result = (Select   
               Leak = STUFF(( Select ',' + Cast(ID As Varchar) FROM @Templinktable order by ID asc   
  FOR XML PATH ('')),1,1,''))  
  
Return @result  
END  
  
  
  