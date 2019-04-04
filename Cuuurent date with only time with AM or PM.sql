Select getdate()

Select Convert(varchar,getdate(),100)

Select Convert(varchar,getdate(),110)

SELECT RIGHT('0'+LTRIM(RIGHT(CONVERT(varchar,getDate(),100),8)),7) as 'Time'

SELECT REPLACE(REPLACE(RIGHT('0'+LTRIM(RIGHT(CONVERT(varchar,getdate(),100),7)),7),'AM',' AM'),'PM',' PM')
