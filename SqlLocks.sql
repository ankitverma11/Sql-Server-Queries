SELECT TOP 100 object_name(sqltext.objectid) as objectname,
req.status,
req.start_time,
req.cpu_time,
req.total_elapsed_time,
req.wait_type,
req.last_wait_type,
req.wait_time,
sqltext.TEXT,
req.command,
req.session_id,
req.blocking_session_id,
req.wait_resource,
db_name(req.database_id) as Databasename,
req.reads,
req.writes,
req.logical_reads
FROM 
      sys.dm_exec_requests req
CROSS APPLY 
      sys.dm_exec_sql_text(sql_handle) AS sqltext
ORDER BY req.cpu_time DESC
