--When should data be encrypted?

--Data is usually encrypted when a database holds sensitive information. The common example of sensitive data is credit card numbers (CCN) or in the US a Social Security Number (SSN). 
--However, with identity theft on the rise many companies are finding it necessary to protect all of their customer’s personally identifiable information (PII) such as name, address, phone number, etc. 
--Basically any information held in a database that can be used to identify or find an individual is a good candidate for encryption.

CREATE TABLE [dbo].[Employees_encrypted](
[EmpID] [int] IDENTITY(1,1) NOT NULL,
[FirstName] [varchar](60) NULL,
[LastName] [varchar](60) NULL,
[Address] [varchar](60) NULL,
[City] [varchar](30) NULL,
[StateProv] [varchar](3) NULL,
[PostalCode] [varchar](15) NULL,
[SSN] [varchar](12) NULL
) 
ON [PRIMARY]

Create Clustered index [CI_Employee] on [dbo].[Employees_encrypted]
(
[EmpID]
)
On [Primary]

Create NONClustered Index [NCI_Employee_Lname_Fname] on [dbo].[Employees_encrypted]
(
[FirstName],[LastName]
)
On [Primary]

--Insert into Employees_encrypted
--Select 'Ankit','verma','Delhi','Delhi','AA','110092','123456'
--UNION ALL
--Select 'Amit','sharma','gajiyabad','Delhi','AAA','110092','125456' UNION ALL
--Select 'manuj','sharma','gajiyabad','Delhi','B','110093','126456' UNION ALL
--Select 'md','alam','Delhi','noida','BB','110094','123856' UNION ALL
--Select 'deppak','jakh','Delhi','mayur','AAB','110095','122456' UNION ALL
--Select 'sachin','tendu','Delhi','Mumbai','AAC','110096','123856' UNION ALL
--Select 'ankur','verma','Delhi','tanakpur','AAD','110097','129456' 

SET STATISTICS IO ON 
SET STATISTICS TIME ON
SELECT EmpID, FirstName, LastName, StateProv, SSN  FROM [Employees_encrypted] where lastname = 'sharma'

Select 'Encryption'

--Now let’s begin the process to encrypt PII columns. We have to create a database master key, a certificate and a symmetric key with passwords. All have to be opened and the database master key and certificate should be backed up.
								--— Create Database Master Key
												--Create master key Encryption by PASSWORD  = 'Pa$$w0rd_test'

								--— Have to open the master key before you can do anything else.
												--OPEN MASTER KEY DECRYPTION BY PASSWORD = 'Pa$$w0rd_test'

								-- — Backup DMK
												--BACKUP MASTER KEY

												--TO FILE = 'C:\KeyBkup_test\ExportedMK.dmk'

												--ENCRYPTION BY PASSWORD = 'Sq1&x!123456';
								-- — Create cert for column encryption

CREATE CERTIFICATE ABCoCert
			WITH SUBJECT = 'Cert for Column Level Encryption';

								-- Backup cert
								BACKUP CERTIFICATE ABCoCert

TO FILE = 'C:\KeyBkup_test\Certbkup.cer'

WITH PRIVATE KEY

(FILE = 'C:\KeyBkup_test\Certbkup.pvk',

ENCRYPTION BY PASSWORD = 'St40ngPw6!');

-- Create symmetric key

			CREATE SYMMETRIC KEY ABCoSymKey
			WITH ALGORITHM = AES_256
			ENCRYPTION BY CERTIFICATE ABCoCert

-- — Open the symmetric key

USE CustomerDB

GO

OPEN SYMMETRIC KEY ABCoSymKey DECRYPTION
BY CERTIFICATE ABCoCert

GO

--Alter table [Employees_encrypted] Add FName  varbinary(128) null
--GO
--ALTER TABLE dbo.[Employees_encrypted] ADD LName varbinary(128) NULL

--Alter table [Employees_encrypted] Add FnameDeryprt varchar(28) null
--Alter table [Employees_encrypted] Add LnameDeryprt varchar(28) null

Alter table Employees_encrypted Add Addr varbinary(128) null

UPDATE Employees_encrypted
SET FName = ENCRYPTBYKEY(KEY_GUID('ABCoSymKey'),CONVERT(varbinary, FirstName) )
GO

UPDATE Employees_encrypted
SET LName = ENCRYPTBYKEY(KEY_GUID('ABCoSymKey'),CONVERT(varbinary, LastName) )
GO

Update Employees_encrypted
Set FnameDeryprt = CONVERT(VARCHAR(50),DECRYPTBYKEY(FName))

Update Employees_encrypted
Set LnameDeryprt = CONVERT(VARCHAR(50),DECRYPTBYKEY(LName))

UPDATE Employees_encrypted
SET Addr = CONVERT(varbinary, FirstName)
GO


Select * from Employees_encrypted

--— Remove encryption keys

USE CustomerDB

GO

CLOSE SYMMETRIC KEY ABCoSymKey

GO

DROP SYMMETRIC KEY ABCoSymKey

GO

DROP CERTIFICATE ABCoCert

GO

DROP MASTER KEY

GO