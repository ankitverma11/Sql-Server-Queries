--Select * from ImportPlantCoverageCommunity where CustomerID = 112

Select CC.CommunityID from CustomerCommunity CC Inner Join Communitymapping CM On CC.CommunityID = Cm.CommunityID Where Cm.CommunityUnitID = 5463 and CC.ISActive = 1 --order by CC.CommunityID
EXCEPT
Select ImportID from ImportPlantCoverageCommunity where ImportID  in (
Select CC.CommunityID from CustomerCommunity CC Inner Join Communitymapping CM On CC.CommunityID = Cm.CommunityID Where Cm.CommunityUnitID = 5463 and CC.ISActive = 1)   --273405

Select * from ImportPlantCoverageCommunity where ImportID  in (
Select CC.CommunityID from CustomerCommunity CC Inner Join Communitymapping CM On CC.CommunityID = Cm.CommunityID Where Cm.CommunityUnitID = 5463 and CC.ISActive = 1) 
Order by importID

Select * from CustomerCommunity CC Inner Join Communitymapping CM On CC.CommunityID = Cm.CommunityID Where Cm.CommunityUnitID = 5463 and CC.ISActive = 1 order by CC.CommunityID

Select Sum(Mileage) from ImportPlantCoverageCommunity where ImportID in (
Select CC.CommunityID from CustomerCommunity CC Inner Join Communitymapping CM On CC.CommunityID = Cm.CommunityID Where Cm.CommunityUnitID = 5463 and CC.ISActive = 1) 

--Select * from CustomerCommunity CC Inner Join Communitymapping CM On CC.CommunityID = Cm.CommunityID Where Cm.CommunityUnitID = 5463 and CC.ISActive = 1 order by CC.CommunityID

Select CU.name,* from ImportPlantCoverageCommunityUnit I inner join CommunityUnit CU on 
I.ImportID = CU.CommunityUnitID    where ID = 41 and I.CustomerID = 112 order by CU.name
--Select * from ImportPlantCoverageCommunityUnit I Where ID = 41

Select P.PSID,* from ImportPlantCoveragePSID I inner join PSID P
On I.ImportID = P.PhysicalSystemID  where I.CustomerID = 112 And ID = 15 order by P.PSID

--Select * from ImportPlantCoveragePSID I Where ID = 15


