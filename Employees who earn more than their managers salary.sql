
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



	  Select * from Employeeee

	  Select e1.name from Employeeee e1 inner join Employeeee e2
	  on e1.managerid = e2.empid  and e1.salary > e2.salary

	  select a.name from Employeeee a where a.salary > (select b.salary from Employeeee b where b.EmpId=a.ManagerId)

