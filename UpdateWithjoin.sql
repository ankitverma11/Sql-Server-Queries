--	Create table AAAAA 
--	(
--	Leakageid int ,
--	BaseLeakageID int 
--	)

--	Insert into AAAAA values (1,null)
--		Insert into AAAAA values (2,1)
--			Insert into AAAAA values (3,1)

--Create table BBBBB 
--	(
--	Leakageid int ,
--	WorkOrderStatus int 
--	)

	
--	Insert into BBBBB values (2,1)
--		Insert into BBBBB values (3,1)
--Alter table AAAAA Add IsWorkorderCreated int
Select * from AAAAA
Select * from BBBBB


  -- Declare @currentBaseLeakageID int = 1 Update AAAAA Set IsWorkorderCreated = 1 where BaseLeakageID in (@currentBaseLeakageID)
 -- Declare @currentBaseLeakageID int = 1 update BBBBB Set WorkOrderStatus = 1 where LeakageID in (Select leakageID from AAAAA Where BaseLeakageID = @currentBaseLeakageID)

 Declare @currentBaseLeakageID int = 1
	Update BB 
	       Set BB.WorkOrderStatus =  0 
	         from BBBBB BB
	          Inner Join AAAAA AA On BB.LeakageID = AA.LeakageID
             	Where AA.BaseLeakageID in (@currentBaseLeakageID)

	Declare @currentBaseLeakageID int = 1;
	Update BBBBB , AAAAA 
	       Set BBBBB.WorkOrderStatus =  0 , AAAAA.IsWorkorderCreated = 0
		   from BBBBB B1 , AAAAA A1
	           Where B1.LeakageID = A1.LeakageID and A1.BaseLeakageID in (@currentBaseLeakageID)