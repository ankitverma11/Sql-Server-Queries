CREATE TABLE Parent(id int IDENTITY);

CREATE TABLE Child(id int IDENTITY(100,1));

GO

CREATE TRIGGER Parentins ON Parent FOR INSERT

AS

BEGIN

   INSERT Child DEFAULT VALUES

END;

GO

--End of trigger definition--
--Truncate table Child
Select * from Parent
Select * from Child

SELECT id FROM Parent;
--id is empty.

SELECT id FROM Child;
--ID is empty. 

--Do the following in Session 1
INSERT Parent DEFAULT VALUES;
SELECT @@IDENTITY; 
/*Returns the value 100. This was inserted by the trigger.*/  --it returns the last identity value generated for any table in the current session, across all scopes.

SELECT SCOPE_IDENTITY();  
/* Returns the value 1. This was inserted by the 
INSERT statement two statements before this query.*/  --It returns the last identity value generated for any table in the current session and the current scope.

SELECT IDENT_CURRENT('Child');

/* Returns value inserted into Child, that is in the trigger.*/

SELECT IDENT_CURRENT('Parent');

/* Returns value inserted into Parent. 
This was the INSERT statement four statements before this query.*/ 

-- Do the following in Session 2.

SELECT @@IDENTITY;

/* Returns NULL because there has been no INSERT action
up to this point in this session.*/ 

SELECT SCOPE_IDENTITY();

/* Returns NULL because there has been no INSERT action
up to this point in this scope in this session.*/

SELECT IDENT_CURRENT('Child');
                 
--	            Session	    Scope
--@@IDENTITY	Same Session	Global scope value
--SCOPE_IDENTITY()	Same Session	Local scope value
--IDENT_CURRENT()	May be different	Depends on table name passed in parameter