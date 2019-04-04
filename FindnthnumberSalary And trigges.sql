Select * from PRODUCT_DETAILS
Select * from UPDATED_DETAILS

insert into PRODUCT_DETAILS 
values (101,'BISCUIT',20.00)

Update PRODUCT_DETAILS Set P_Name = 'CHIPSS' where P_ID = 104

insert into PRODUCT_DETAILS 
values (101,'BISCUIT',20.00)

Create trigger trig_PRODUCT_DETAILS
on PRODUCT_DETAILS
instead of Insert
As Begin

insert into PRODUCT_DETAILS  values(106,'A',26.0)

END

Create trigger trig_PRODUCT_DETAILS_after
on PRODUCT_DETAILS
After Insert
As Begin

insert into PRODUCT_DETAILS  values(106,'A',26.0)

END

Alter trigger trig_PRODUCT_DETAILS_Update_after
on PRODUCT_DETAILS
After Update 
As Begin

insert into PRODUCT_DETAILS  values(107,'B',27.0)

END





--//////duplicate delete recored
--With CtE As
--(
--Select P_ID , row_number() over (partition by P_ID order by P_ID ) N from PRODUCT_DETAILS 
--)
--Delete from CTE where N > 1

---- //////duplicate Record 
Select P_ID, p_price,  ROW_NUMBER() over (order by P_ID ASC) as ROWNUMBER from PRODUCT_DETAILS  group by P_ID,p_price  order by P_ID 

Select P_ID, p_price,  Rank() over (order by P_ID ASC) As [rank] from PRODUCT_DETAILS  group by P_ID,p_price  order by P_ID 

Select P_ID, p_price,  Dense_Rank() over (order by P_ID ASC) As [DenseRank] from PRODUCT_DETAILS  group by P_ID,p_price  order by P_ID 

Select P_ID,count(*) from PRODUCT_DETAILS  group by P_ID having COUNT(P_ID) > 1  order by P_ID 

Select P_ID , Count(*) from PRODUCT_DETAILS group by P_ID having COUNT(1) > 1


///Second
Select  max(p_price) from PRODUCT_DETAILS  where p_price < (Select max(p_price) from PRODUCT_DETAILS)

--//nth salary
Select * from PRODUCT_DETAILS;
with CTE 
As
(
Select P_ID , p_price , RN = ROW_NUMBER() over (order by p_price desc) from PRODUCT_DETAILS
)
Select * from CTE where RN = 3

--//nth salary with rank
Select * from PRODUCT_DETAILS;
with CTE 
As
(
Select P_ID , p_price , RN = Rank() over (order by p_price desc) from PRODUCT_DETAILS
)
Select * from CTE where RN = 3

--//nth salary wth dens
Select * from PRODUCT_DETAILS;
with CTE 
As
(
Select P_ID , p_price , RN = Dense_Rank() over (order by p_price desc) from PRODUCT_DETAILS
)
Select * from CTE where RN = 4

//////
CREATE TRIGGER trgAfterInsert ON [dbo].PRODUCT_DETAILS   
FOR INSERT  
AS  
declare @empid int;  
declare @empname varchar(100);  
declare @empsal decimal(10,2);  
declare @audit_action varchar(100);  
select @empid=i.P_ID from inserted i;   
select @empname=i.P_Name from inserted i;   
select @empsal=i.p_price from inserted i;   
set @audit_action='Inserted Record -- After Insert Trigger.';  
  
insert into PRODUCT_DETAILS  
(P_ID,P_Name,p_price,Audit_Action,Audit_Timestamp)   
values(@empid,@empname,@empsal,@audit_action,getdate());  
  
PRINT 'AFTER INSERT trigger fired.'  
GO 