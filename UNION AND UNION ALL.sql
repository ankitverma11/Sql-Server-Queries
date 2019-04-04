--Create Table emp
--(
--id int null
--)

--Create Table emp1
--(
--id int null
--)

--insert into emp values (1)
--insert into emp values (2)
--insert into emp values (3)
--insert into emp values (4)
--insert into emp values (null)


--insert into emp1 values (1)
--insert into emp1 values (8)
--insert into emp1 values (9)
--insert into emp1 values (null)
--insert into emp1 values (2)
--insert into emp1 values (null)

Select * from emp
Select * from emp1

--Select id from emp
--UNION
--Select id from emp1

--Select id from emp
--UNION ALL
--Select id from emp1

Select * from emp  -- inner join
INNER JOIN emp1 on emp.id = emp1.id

Select * from emp  -- inner join
Select * from emp1
Select emp.* from emp 
where emp.id not (select id from emp1)


Select * from emp  --self
, emp1 where emp.id = emp1.id

Select * from emp left outer join emp1 on emp.id = emp1.id

Select * from emp right outer join emp1 on emp.id = emp1.id

Select * from emp Full outer join emp1 on emp.id = emp1.id

select id from emp
Except
select id from emp1

--select emp.id , count(*)
--  from   films
--  group  by title, uk_release_date
--  having count(*) > 1; 

