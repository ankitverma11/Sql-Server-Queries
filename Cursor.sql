Declare @ID int
Declare EMP_Cusrsor Cursor
local Forward_only For
Select ID from A
Open  EMP_Cusrsor
fetch next From EMP_Cusrsor Into @ID
While @@FETCH_STATUS = 0
BEGIN
Print @ID
fetch next from EMP_Cusrsor into @ID 
END
Close EMP_Cusrsor
Deallocate EMP_Cusrsor
