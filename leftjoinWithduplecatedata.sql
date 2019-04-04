  Drop table #tblLeakDatawithSecond
    Drop table #tblLeakDeletionDataSecond
  SELECT       
		   LeakageID,EventTime, 1 test
		 INTO #tblLeakDatawithSecond      
		 FROM       
		   Leakage Leak        
		 
		 WHERE       
	 leakageID in (4094,4404,1497096)  
	
	Select * from #tblLeakDatawithSecond

       
		 SELECT       
Leak.LeakageID,Leak.EventTime, test = case when tb.LeakageID = leak.LeakageID  then 1 else 0 end
		  INTO #tblLeakDeletionDataSecond  
		 FROM       
		   LeakageDeletionHistory Leak     
		   Left Join #tblLeakDatawithSecond Tb on tb.LeakageID = leak.LeakageID   
		   
		 WHERE       
		 leak.leakageID in (4094,4404,1497096)  

		 Select * from #tblLeakDeletionDataSecond
	
		Select * from #tblLeakDatawithSecond
	Union All
	Select * from #tblLeakDeletionDataSecond	 where test = 0