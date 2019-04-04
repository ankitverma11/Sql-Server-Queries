Select * from  CustomerLookUp 

sp_help CustomerLookUp  -- Alt + F1

select *
from INFORMATION_SCHEMA.COLUMNS
where TABLE_NAME='CustomerLookUp'

sp_columns 'CustomerLookUp'


Alter table CustomerLookUp Add  StartValuedbuvm decimal(8,8) 
Alter table CustomerLookUp Add  EndValuedbuvm decimal(8,8) 
Alter table CustomerConfiguration Add MinThersholdValuedbunm decimal (8,8)
Alter table CustomerConfiguration Add LF_MinThresholdValuedbuvm  decimal (8,8) 
Alter table CustomerConfiguration Add MinWorkOrderThresholdValuedbuvm  decimal (8,8)
Alter table CustomerConfiguration Add LTELeakageSensitivitydbuvm  decimal (8,8) 
Alter table Device  Add MinThresholdValuedbuvm  decimal (8,8)
Alter table Device  Add LF_MinThresholdValuedbuvm  decimal (8,8) 
Alter table CustomerDeviceConfig  Add GQSMinLvlThreshold1dbuvm  decimal (8,8) 
Alter table CustomerDeviceConfig  Add GQSMinLvlThreshold2dbuvm  decimal (8,8)
Alter table CustomerDeviceConfig  Add GQSMinLvlThreshold3dbuvm  decimal (8,8) 
Alter table DeviceConfiguration   Add GQSMinLvlThreshold1dbuvm  decimal (8,8) 
Alter table DeviceConfiguration   Add GQSMinLvlThreshold2dbuvm  decimal (8,8)
Alter table DeviceConfiguration   Add GQSMinLvlThreshold3dbuvm  decimal (8,8) 

