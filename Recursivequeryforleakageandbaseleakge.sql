 WITH CTE AS (
-- This is end of the recursion: Select items with no parent
    Select   Leakageid,baseleakageid,DeviceFrequency,LeakSignalStrength,createdon from Leakage
        WHERE Leakageid = 2120580
    UNION ALL
-- This is the recursive part: It joins to CTE
        SELECT l1.Leakageid,l1.baseleakageid,l1.DeviceFrequency,l1.LeakSignalStrength,l1.createdon  from Leakage l1
        INNER JOIN CTE c ON l1.baseleakageid = c.Leakageid
    )
    SELECT * FROM CTE --where baseleakageid is not null
    ORDER BY Leakageid


	--Delete from Leakage where LeakageID in (2120591),2120592)
	--update Leakage set baseleakageid = null where LeakageID in (2120591)


	Select * from Workorders where LeakageID in (2120580,
2120581,
2120582,
2120586)