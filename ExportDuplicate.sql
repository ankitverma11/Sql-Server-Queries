--Select WO.WorkorderNo,Leak.[Address],* from Leakage  Leak  LEFT JOIN WorkOrders WO ON Leak.LeakageID = WO.LeakageID  Where WO.WorkorderNo = '19633' AND Leak.Createdon > '2017-05-17 10:36:49.900'

Select WO.WorkorderNo,Leak.[Address],REPLACE(CU.Name, ',', ' - ') As CommunityUnitName, * from Leakage  Leak 
LEFT JOIN CustomerCommunity CC ON Leak.CommunityID = CC.CommunityID AND Leak.CustomerID = CC.CustomerID
				LEFT JOIN CommunityMapping CM ON CC.CommunityID = CM.CommunityID  AND CM.IsActive=1
				INNER JOIN CommunityUnit CU ON CM.CommunityUnitID = CU.CommunityUnitID AND CU.IsActive=1 
LEFT JOIN WorkOrders WO ON Leak.LeakageID = WO.LeakageID Where WO.WorkorderNo = '19613' AND Leak.leakageID = '6084113' AND Leak.Createdon > '2017-05-17 10:36:49.900' --AND CM.CustomerID = 210  --6084113

Select * from CommunityMapping Where CommunityID = '152949'

Select * from CommunityMapping Where CommunityID = '152949'

