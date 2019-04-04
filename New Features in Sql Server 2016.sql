 New features in Sql Server 2016

 1. Always Encrypted
The Always Encrypted feature protects data and enables the SQL Server to perform encrypted data operations so that the owners can protect their confidential data by using an encryption key.
This feature ensures that your important data stored in the cloud managed database remains encrypted and protected.

We can use -- With Encryption in SP 


2. Dynamic Data Masking
This feature gives an obscured version of your confidential data to some people and allows only authorized users to view it by defining masking rules. It is popularly used for managing credit card information and similar databases.
Dynamic Data Masking is a new security feature introduced in SQL Server 2016 that limits the access of unauthorized users to sensitive data at the database layer.

Example - Example is the call center employee who will access the customer’s information to help him in his request, but the critical financial data, such as the bank account number or the credit card full number, will be masked to that person.

3. Stretch Database
The Stretch Database permits you to extend your database to Azure where the data that is not accessed regularly are moved to the cloud so that you can enjoy high-performance applications while benefiting from the low-cost Azure store as only the frequently accessed data stays on premise.

4- Live Query Statistics – allows the execution plan to be viewed live as the query is executing – nice!

5- Multiple TempDB Files – adding additional tempdb files is not a new feature as such and has been good practice to implement on multi-core machines. What has been added is the ability to do this upon installation of SQL Server.

6- JSON Support – JSON data can be parsed and stored in relational format. Functions are included which allow for JSON to be queried and output results from queries can also be formatted as JSON.

7- Backup to Azure – on premise backups can be made to Azure blob storage.

8 -Polybase
This feature works as a connector between SQL Server and Hadoop so that your regular data processing involving large text files can be stored conveniently in Azure Blob Storage or Hadoop. This technology bridges the gap between SQL Server and Hadoop to make data storage easy.