
SELECT CONNECTIONPROPERTY('local_net_address') AS [IP Address Of SQL Server]

GO
xp_readerrorlog 0, 1, N'Server is listening on'
GO
