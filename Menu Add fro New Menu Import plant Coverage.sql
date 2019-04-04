-- Menu Add fro New Menu Import plant Coverage

 --Select * from [Function]  -- 150 For Import plant Coverage

Insert into [dbo].[Function]([FunctionKey]
      ,[FunctionName]
      ,[Description]
      ,[IsActive]
      ,[CreatedBy]
      ,[CreatedOn]
      ,[RestrictedPermissions]
      ,[RestrictedUserTypes]
      ,[PageControlId]
      ,[ModifiedBy]
      ,[ModifiedOn])
      Values('ImportPlantCoverage','Import Plant Coverage','Import Plant Coverage',1,NULL,getdate(),NULL,'SuperAdmin,CorporateUser,Divisional,Regional',NULL,NULL,NULL)
      
      --Select * from [Module]  -- 1 moduleID For Import

      --Select * from ModuleFunctionMapping   -- 215 For Import
      
		Insert into ModuleFunctionMapping (ModuleID , FunctionID , CreatedOn) values(1,150,GETDATE())

         --Select * from [MenuModuleMapping] where ModuleID = 1  -- ParentMenuID 45 For Imports

			Insert into [dbo].[MenuModuleMapping](
				  [MenuName]
				  ,[ParentMenuID]
				  ,[MenuPage]
				  ,[ModuleID]
				  ,[ModuleFunction]
				  ,[ParentMenuOrder]
				  ,[MenuOrder]
				   )
			  Values('Import Plant Coverage',6,'../Community/ImportPlantCoverage.aspx',1,150,NULL,null)
  
  insert into usertypemodulemapping(usertypeid,moduleid,functionid,permission,CustomerID)
	  values(2,1,150,'0,1,2,3',1)
insert into usertypemodulemapping(usertypeid,moduleid,functionid,permission,CustomerID)
	  values(2,1,150,'0,1,2,3',2)
insert into usertypemodulemapping(usertypeid,moduleid,functionid,permission,CustomerID)
	  values(97,1,150,'0,1,2,3',1)
insert into usertypemodulemapping(usertypeid,moduleid,functionid,permission,CustomerID)
	  values(97,1,150,'0,1,2,3',2)
	  insert into usertypemodulemapping(usertypeid,moduleid,functionid,permission,CustomerID)
	  values(2,1,150,'0,1,2,3',null)
insert into usertypemodulemapping(usertypeid,moduleid,functionid,permission,CustomerID)
	  values(97,1,150,'0,1,2,3',null)