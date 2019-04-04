SELECT @@VERSION  -- Microsoft SQL Server 2008 R2 (SP1) - 10.50.2550.0 (X64)    -- Local Server
	
--Microsoft SQL Server 2008 R2 (SP3) - 10.50.6000.34 (X64) 
--	Aug 19 2014 12:21:34 
--	Copyright (c) Microsoft Corporation
	-- Standard Edition (64-bit) on Windows NT 6.1 <X64> (Build 7601: Service Pack 1)




--the total size limitation across all databases was 10GB.

--10GB is the per-database, data-file size limit
--If you have more than one data file in your SQL Express database, the size limit is applied to the total size across all such data files
--Log files are not subject to this limit


--Differences in the Express product include: Maximum database size of 10 GB per database in SQL Server 2016, 
--SQL Server 2014, SQL Server 2012, and 2008 R2 Express (4 GB for SQL Server 2008 Express and earlier; compared to 2 GB in the former MSDE).