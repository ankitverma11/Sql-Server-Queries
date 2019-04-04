Select top 2 LeakageID,CreatedOn from Leakage for json auto

Select top 2 LeakageID  , CreatedOn from Leakage for json path 

Select top 2 LeakageID  , CreatedOn from Leakage for json path , root('leakage')

Select top 2 LeakageID AS 'leakage.LeakageID', CreatedOn As 'leakage.CreatedOn' from Leakage for json path , root('leakage')

[{"LeakageID":4094,"CreatedOn":"2009-09-22T12:03:30.713"},
{"LeakageID":4101,"CreatedOn":"2009-09-22T13:06:36.790"}]

{"leakage":[{"LeakageID":4094,"CreatedOn":"2009-09-22T12:03:30.713"},
{"LeakageID":4101,"CreatedOn":"2009-09-22T13:06:36.790"}]}


[{"LeakageID":4094,"CreatedOn":"2009-09-22T12:03:30.713"},
{"LeakageID":4101,"CreatedOn":"2009-09-22T13:06:36.790"}]

[{"leakage":{"LeakageID":4094,"CreatedOn":"2009-09-22T12:03:30.713"}},
{"leakage":{"LeakageID":4101,"CreatedOn":"2009-09-22T13:06:36.790"}}]

Declare @JsonData varchar(max) = '[{"LeakageID":4094,"CreatedOn":"2009-09-22T12:03:30.713"},{"LeakageID":4101,"CreatedOn":"2009-09-22T13:06:36.790"}]'

Select * from OpenJson(@JsonData) with (LeakageID int , CreatedOn datetime)