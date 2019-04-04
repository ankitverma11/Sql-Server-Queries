Create table tblEmployee (
EmployeeID int Identity(1,1) Not Null,
name varchar(20) null,
City varchar(20) NULL,    
    Department varchar(20) NULL,    
    Gender varchar(6) NULL    
)

Create procedure spAddEmployee     
(    
    @Name VARCHAR(20),     
    @City VARCHAR(20),    
    @Department VARCHAR(20),    
    @Gender VARCHAR(6)    
)    
as     
Begin     
    Insert into tblEmployee (Name,City,Department, Gender)     
    Values (@Name,@City,@Department, @Gender)     
End  

Create procedure spUpdateEmployee      
(      
   @EmpId INTEGER ,    
   @Name VARCHAR(20),     
   @City VARCHAR(20),    
   @Department VARCHAR(20),    
   @Gender VARCHAR(6)    
)      
as      
begin      
   Update tblEmployee       
   set Name=@Name,      
   City=@City,      
   Department=@Department,    
   Gender=@Gender      
   where EmployeeId=@EmpId      
End  

Create procedure spDeleteEmployee     
(      
   @EmpId int      
)      
as       
begin      
   Delete from tblEmployee where EmployeeId=@EmpId      
End   

Create procedure spGetAllEmployees    
as    
Begin    --02230455247 meenaksi
    select *    
    from tblEmployee    
End  