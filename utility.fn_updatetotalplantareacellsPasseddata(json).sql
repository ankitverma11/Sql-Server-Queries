-- FUNCTION: utility.fn_updatetotalplantareacellsPasseddata(json)

-- DROP FUNCTION utility.fn_updatetotalplantareacellsPasseddata(json);

CREATE OR REPLACE FUNCTION utility.fn_updatetotalplantareacellsPasseddata(
    cellspassed json)
    
    RETURNS void
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$

Declare _exec_error varchar;

BEGIN


IF (SELECT Count(0)  FROM json_to_recordset(cellspassed) as jsondata(totalplantareaid bigint)) > 1
Then            
Update public.totalplantareacellspassed  set  pgsqltosql = 2
    where totalplantareaid in ( 
	SELECT totalplantareaid
                        FROM json_to_recordset(cellspassed)
                         as jsondata(totalplantareaid bigint));
  END IF;  
Exception When Others Then
		_exec_error := SQLERRM;
	Insert Into public."postgiserrorlog" ("id","errormessage","idtype") VALUES (0,_exec_error,'fn_updatetotalplantareacellsPasseddata'); 

END

$BODY$;

--Delete from  public."postgiserrorlog" where idtype='fn_updatetotalplantareacellsdata'
--Select * from public."postgiserrorlog" where idtype='fn_updatetotalplantareacellsdata'

ALTER FUNCTION utility.fn_updatetotalplantareacellsPasseddata(json)
    OWNER TO postgres;