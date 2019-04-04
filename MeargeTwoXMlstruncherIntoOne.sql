Declare @a XML  =
(SELECT top 2 
LeakageID , CommunityID ,UDPMasterID , CustomerID , DeviceID , VehicleID, Speed ,LeakSignalStrength from Leakage  
FOR XML PATH('Leaks'), ROOT('MainLeaks') ) 

declare @b xml  =
(SELECT top 1 
LeakageID ,UDPMasterID ,LeakSignalStrength from Leakage  
FOR XML PATH('Leak'), ROOT('LinkedLeak'))

         


select @a, @b for xml path ('LeakData')


SELECT top 2 
     DistanceSetting ,Latitude ,Longitude ,
	(
	Select
	   (
        SELECT  top 2
		LeakageID ,UDPMasterID ,LeakSignalStrength
		FROM Leakage p
		--WHERE o.LeakageID = p.BaseLeakageID
		FOR XML PATH('Leaks') ,type	
		) FOR XML PATH('LinkedLeaks') ,type	
   ) AS "*" From Leakage o
FOR XML PATH('Workorder'), root('Workorders')
