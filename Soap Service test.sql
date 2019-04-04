Select * from CustomerSetUp where IsSoapEnabled <> 0 And ISActive = 1 And CustomerID = 2  --Companyname like '%Comcast%' and DivisionID = 53
Select * from [user]  where Isactive = 1 And loginname like '%Comcast%'
Select * from userType


Select * from  CustomerSetUp Where userID = 3180

c0mca5tw3st

Select * from DeviceType
Select * from [Lookup] L Inner JOIn [Lookuptype] LT ON L.LookUpTypeID = LT.LookUpTypeID AND LT.LookUpTypeKey  = 'DeviceType'

Select * from Device Where DeviceTypeID in (1,2,3)
http://216.12.92.185/Genacis/SOAPInterface/GenacisSOAPService.asmx

Select DeviceID from Device  Where DEVICETYPEID = (Select LookUpValue from [Lookup] L Inner JOIn [Lookuptype] LT ON L.LookUpTypeID = LT.LookUpTypeID AND LT.LookUpTypeKey  = 'DeviceType' AND L.LookUpKey = 'GQS III' AND L.ISACTIVE = 1 )


SELECT UserTypeID	
	FROM
		 [UserType]
	WHERE
		 UserTypeKey='SuperUser'
		 
		 SELECT UserTypeID,UserId
	FROM
		[USER]
	WHERE
		LoginName='ComcastWestDiv' 