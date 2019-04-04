--Create table PRODUCT_DETAILS (P_ID int,P_Name varchar(100),P_Price float)

--Create table UPDATED_DETAILS (P_ID int,P_Name varchar(100),P_Price float)

--insert into PRODUCT_DETAILS 
--values (103,'BISCUIT',20.00)

--insert into UPDATED_DETAILS 
--Values (101,'Tea',10.00)

--insert into UPDATED_DETAILS 
--Values (102,'Coffee',25.00)

--insert into UPDATED_DETAILS 
--Values (104,'Chips',22.00)

--Now, as we can see if we want to make changes in PRODUCT_DETAILS table according to the UPDATED_DETAILS table we will have to use 
--INSERT statement for P_ID 104, 
--UPDATE statement for P_ID 102 and
--DELETE statement for P_ID 103 so for using all these three statements together we can use one single statement MERGE. Let’s find out below:
Select * from PRODUCT_DETAILS
Select * from UPDATED_DETAILS

Merge PRODUCT_DETAILS As TARGET
Using UPDATED_DETAILS As SOURCE

On (TARGET.P_ID = SOURCE.P_ID)

WHEn MATCHED THEN
UPDATE SET TARGET.P_Name = SOURCE.P_NAME ,
TARGET.P_PRICE = SOURCE.P_PRICE 

WHEN NOT MATCHED BY TARGET THEN 
INSERT (P_ID,P_NAME,P_PRICE)          
VALUES (SOURCE.P_ID,SOURCE.P_NAME,SOURCE.P_PRICE);

WHEN NOT MATCHED BY SOURCE THEN    
Delete;

