
Create Table Employeeee 
(
EmpId int,
name varchar(200),
salary int,
managerid int

)

 insert into Employeeee Values (1,'A',70000  ,3)
  insert into Employeeee Values (2,'B',80000  ,4)
   insert into Employeeee Values (3,'C',60000  ,null)
    insert into Employeeee Values (4,'D',90000,null  )
	 insert into Employeeee Values (1,'D',100000,null  )
	 	 insert into Employeeee Values (3,'k',1000000,null  )
		 	 	 insert into Employeeee Values (4,'Dk',10000000,null  )


Select EmpId , Row_number() over (Order by EmpId) from Employeeee

Select EmpId , Row_number() over (Partition by EmpId  Order by EmpId) from Employeeee

Select EmpId , Rank() over (Order by EmpId) from Employeeee

Select EmpId , Dense_Rank() over (Order by EmpId) from Employeeee

Select * from Employeeee


;With CTE 
AS
(
Select EmpID , Row_number() over (partition by EmpID Order by EmpID) Rn from Employeeee
)
Select * from CTE

;With CTE As
(
Select EID , SALARy , Row_Number() over(order by SALARy Desc) RN from Employeeee
)

;With CTE
AS
(
Select EmpId , Salary , Row_Number() Over (Order by Salary DESC) RN from Employeeee
)
Select * from  CTE Where RN = 2

Select EmpId , Count(EmpId) from Employeeee Group by EmpId having Count(EmpId) > 1

	  Select * from Employeeee ORDER BY Salary DESC

	  
	  Select e1.name from Employeeee e1 inner join Employeeee e2
	  on e1.managerid = e2.empid  and e1.salary > e2.salary

	  select a.name from Employeeee a where a.salary > (select b.salary from Employeeee b where b.EmpId=a.ManagerId)

	  -------------Remove duplicate data
	  ;With CTE 
	  AS
	  (
	  Select EmpID,  ROW_NUMBER() Over (partition by EmpID Order by  EmpID ) RN from Employeeee
	  )
        Delete  from CTE Where RN > 1

		--- nth Number of salary
	WITH CTE AS
     (
         SELECT EmpID, Salary, RN = ROW_NUMBER() OVER (ORDER BY Salary DESC )   FROM Employeeee
     )
          SELECT EmpID,Salary FROM CTE WHERE RN = 6

		  --Comma seprated value
		  Select Distinct  STUFF(
		                 (Select ', ' +  [Name] from Employeeee Where EmpID = 1 for XML path('')),1,1,'') 
							    As [name] from Employeeee  Where EmpID = 1

		  --COALESCE function can be used to get comma separated (delimited) values from Table in the following SQL Server versions i.e. 2005, 2008, 2008R2, 2012 and 2014.
		  		  Select EmpID, COALESCE([Name] + ',' , '' ) + [Name] from Employeeee Where EmpID = 1 