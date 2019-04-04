--SELECT * FROM SPATIALDRIVEPATH with (nolock) 
--  WHERE DrivePathID = 15188107 IN (13660888,13659873) --and customerid=195

Select * from DRIVEPATH with (nolock) 
  WHERE DrivePathID in (13335963)


Select * from SPATIALDRIVEPATH with (nolock) 
  WHERE DrivePathID in (13335963) order by Customerid 





with CTE (DrivePathID,CustomerID,Custid,MCustomerid)
AS 
(
    Select 
     A.DrivePathID ,A.CustomerID,B.CustomerID  As Custid ,D.CustomerID As MCustomerid
     from SPATIALDRIVEPATH A with (NOLOCK)
	 inner join  SPATIALDRIVEPATH B with (NOLOCK) on A.DrivePathID = B.DrivePathID
	  right join DrivePath D on D.DrivePathID = A.DrivePathID
        where A.CustomerID <> B.CustomerID
          and A.DrivePathID = B.DrivePathID
           Group by A.DrivePathID,A.CustomerID,B.CustomerID    ,D.CustomerID
		   having  COUNT(*) > 1    
)
Select * from CTE 


with CTE (DrivePathID,CustomerID,Custid,MCustomerid)
AS 
(
    Select 
     A.DrivePathID ,A.CustomerID,B.CustomerID  As Custid ,D.CustomerID As MCustomerid
     from SPATIALDRIVEPATH A with (NOLOCK)
	 inner join  SPATIALDRIVEPATH B with (NOLOCK) on A.DrivePathID = B.DrivePathID
	  right join DrivePath D on D.DrivePathID = A.DrivePathID
        where A.CustomerID <> B.CustomerID
          and A.DrivePathID = B.DrivePathID
           Group by A.DrivePathID,A.CustomerID,B.CustomerID    ,D.CustomerID
		   having  COUNT(*) > 1    
)
Select * from CTE where Customerid not in (Select Customerid from CTE where Mcustomerid = 316 and DrivePathID = 13335963 )


-------Self join
--Select 
--     A.DrivePathID ,A.CustomerID,B.CustomerID  As C 
--     from SPATIALDRIVEPATH A with (NOLOCK) , SPATIALDRIVEPATH B with (NOLOCK)
--        where A.CustomerID <> B.CustomerID
--          and A.DrivePathID = B.DrivePathID
--           Group by A.DrivePathID,A.CustomerID,B.CustomerID    
--		   having  COUNT(*) > 1   