Select  * from CustomerCommunity with (NOLOCK) where CustomerID = 195  and CommunityID in (41523,41525,94743,94742,94909,94908,94644,94730,94659,94657,94655,94651,94646,94649,94650,94648) order by CommunityID 

Select  * from CustomerCommunity_dummy with (NOLOCK) where CustomerID = 195  and CommunityID in (41523,41525,94743,94742,94909,94908,94644,94730,94659,94657,94655,94651,94646,94649,94650,94648) order by CommunityID 

Insert into CustomerCommunity_dummy ( CommunityID,CommunityLatLong ,CommunityCenterLat,CommunityCenterLong,IsEdited,MinLat,MinLong,MaxLat,MaxLong,modifiedon   )
Select CommunityID,CommunityLatLong ,CommunityCenterLat,CommunityCenterLong,IsEdited,MinLat,MinLong,MaxLat,MaxLong,modifiedon from [216.12.92.186].[GenacisLive].[dbo].[CustomerCommunity]  
where CustomerID = 195 and 
CommunityID in (41523,41525,94743,94742,94909,94908,94644,94730,94659,94657,94655,94651,94646,94649,94650,94648)


SELECT *
from [216.12.92.186].[GenacisLive].[dbo].[CustomerCommunity] 


EXEC sp_addlinkedserver @server='216.12.92.186'



