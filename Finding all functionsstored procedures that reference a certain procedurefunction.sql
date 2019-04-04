SELECT 
    o.name AS ReferencingObject, 
    sd.referenced_entity_name AS ReferencedObject
FROM sys.sql_expression_dependencies  AS sd
INNER JOIN sys.objects AS o
    ON o.object_id = sd.referencing_id
WHERE sd.referenced_entity_name = 'fn_LinkedLeakDatawithSorting';

SELECT [Scehma]=schema_name(o.schema_id), o.Name, o.type 
FROM sys.sql_modules m
INNER JOIN sys.objects o
ON o.object_id = m.object_id
WHERE m.definition like '%Replaced%'

