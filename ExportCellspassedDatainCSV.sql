Export from pgsql 
COPY (Select totalplantareaid,datepassed,createdon,customerid from totalplantareacellspassed where customerid = 436 limit 10)
To 'E:\tmpnew\totalplantareacellspassed_436.csv' DELIMITER ',' CSV HEADER;

COPY (Select totalplantareaid,datepassed,createdon,customerid from totalplantareacellspassed where customerid = 435)
To 'E:\tmpnew\totalplantareacellspassed_435.csv' DELIMITER ',' CSV HEADER;

COPY (Select totalplantareaid,datepassed,createdon,customerid from totalplantareacellspassed where customerid = 436)
To 'E:\tmpnew\totalplantareacellspassed_436.csv' DELIMITER ',' CSV HEADER;

COPY (Select totalplantareaid,datepassed,createdon,customerid from totalplantareacellspassed where customerid = 439)
To 'E:\tmpnew\totalplantareacellspassed_439.csv' DELIMITER ',' CSV HEADER;

COPY (Select totalplantareaid,datepassed,createdon,customerid from totalplantareacellspassed where customerid = 445)
To 'E:\tmpnew\totalplantareacellspassed_445.csv' DELIMITER ',' CSV HEADER;

COPY (Select totalplantareaid,datepassed,createdon,customerid from totalplantareacellspassed where customerid = 446)
To 'E:\tmpnew\totalplantareacellspassed_446.csv' DELIMITER ',' CSV HEADER;

COPY (Select totalplantareaid,datepassed,createdon,customerid from totalplantareacellspassed where customerid = 45)
To 'E:\tmpnew\totalplantareacellspassed_45.csv' DELIMITER ',' CSV HEADER;

COPY (Select totalplantareaid,datepassed,createdon,customerid from totalplantareacellspassed where customerid = 458)
To 'E:\tmpnew\totalplantareacellspassed_458.csv' DELIMITER ',' CSV HEADER;

COPY (Select totalplantareaid,datepassed,createdon,customerid from totalplantareacellspassed where customerid = 460)
To 'E:\tmpnew\totalplantareacellspassed_460.csv' DELIMITER ',' CSV HEADER;

COPY (Select totalplantareaid,datepassed,createdon,customerid from totalplantareacellspassed where customerid = 464)
To 'E:\tmpnew\totalplantareacellspassed_464.csv' DELIMITER ',' CSV HEADER;

COPY (Select totalplantareaid,datepassed,createdon,customerid from totalplantareacellspassed where customerid = 465)
To 'E:\tmpnew\totalplantareacellspassed_465.csv' DELIMITER ',' CSV HEADER;

COPY (Select totalplantareaid,datepassed,createdon,customerid from totalplantareacellspassed where customerid = 466)
To 'E:\tmpnew\totalplantareacellspassed_466.csv' DELIMITER ',' CSV HEADER;

COPY (Select totalplantareaid,datepassed,createdon,customerid from totalplantareacellspassed where customerid = 467)
To 'E:\tmpnew\totalplantareacellspassed_467.csv' DELIMITER ',' CSV HEADER;

COPY (Select totalplantareaid,datepassed,createdon,customerid from totalplantareacellspassed where customerid = 474)
To 'E:\tmpnew\totalplantareacellspassed_474.csv' DELIMITER ',' CSV HEADER;

---- Import in sql
    BULK Insert  totalplantareaCellsPassed112 
FROM 'E:\tmpnew\totalplantareaCellsPassed_112.csv'
   WITH (
    FIRSTROW = 2,
      FIELDTERMINATOR = ',',
      ROWTERMINATOR = '\n'
);




