Declare 
@ExportTemplateID INT = 2022,
 @CustomerID INT = 81, 
 @UserID INT = 16011    

BEGIN
    SET NOCOUNT ON;
    --Getting Saved Template Info  
    DECLARE @CorporateId AS INT;
    DECLARE @DivisionId AS INT;
    DECLARE @RegionId AS INT;
    DECLARE @UserTypeID AS INT; -- Added By Hari
    SELECT @UserTypeID = UserTypeID
    FROM   [User]
    WHERE  userid = @UserID; -- Added By Hari 

    IF (ISNULL(@CustomerID, 0) = 0)
        BEGIN
            IF EXISTS (SELECT 1
                       FROM   [User]
                       WHERE  UserID = @UserID)
                BEGIN
                    SELECT @CorporateId = CorporateId,
                           @DivisionId = DivisionId,
                           @RegionId = RegionId
                    FROM   [User]
                    WHERE  UserID = @UserID;
                END
            ELSE
                BEGIN
                    SET @CorporateId = -1;
                    SET @DivisionId = -1;
                    SET @RegionId = -1;
                END
           
            Select @CorporateId   , @DivisionId D, @RegionId R

			            SELECT ExportTemplates.ExportTemplateID,
                   ExportTemplates.UserID,
                   ExportTemplates.TemplateName,
                   ExportTemplates.FileDelimeter,
                   ExportTemplates.SortFieldID,
                   ExportTemplates.ExportGroupID,
                   ExportTemplates.CreatedBy,
                   ExportTemplates.ModifiedBy,
                   ExportTemplates.IsLocked
            FROM   ExportTemplates
            WHERE  ExportTemplates.IsActive = 1 --AND UserID = @UserID 
                   AND UserID IN (SELECT UserID
                                  FROM   [User]
                                  WHERE  (ISNULL(@CorporateId, 0) = 0
                                          OR CorporateId = @CorporateId)
                                         AND (ISNULL(@DivisionId, 0) = 0
                                              OR DivisionId = @DivisionId)
                                         AND (ISNULL(@RegionId, 0) = 0
                                              OR RegionId = @RegionId)
                                         AND CustomerID IS NULL)

                   AND (ISNULL(@ExportTemplateID, 0) = 0  OR ExportTemplateID = @ExportTemplateID);

				    IF ISNULL(@RegionId,'') <> ''
					 BEGIN 
                      Select @DivisionId = ISNULL(DivisionID,0) ,@CorporateId = ISNULL(CorporateID,0) from Region Where RegionID = @RegionId and IsActive = 1
					   END
					    ELSE  IF ISNULL(@DivisionId,'') <> ''
					     BEGIN
						   Select @CorporateId = ISNULL(CorporateID,0) from Division Where DivisionID = @DivisionId and IsActive = 1
						     END
							  
							  Select @CorporateId , @DivisionId
							   -- Set  @CorporateId  = 1
								  --Set  @DivisionId  = 3
			--Select * from Division Where DivisionID = 3

			Select	   ET.ExportTemplateID,
					   ET.UserID,
					   ET.TemplateName,
					   ET.FileDelimeter,
					   ET.SortFieldID,
					   ET.ExportGroupID,
					   ET.CreatedBy,
					   ET.ModifiedBy,
					   ET.IsLocked
			 FROM	   ExportTemplates ET
			INNER JOIN [USER]  U On U.UserID = ET.UserID 
			Where      ET.IsActive = 1 and
			           ( U.CorporateId = @CorporateId OR U.DivisionId = @DivisionId OR U.RegionId = @RegionId ) 
					   AND CustomerID IS NULL 
			           AND (ISNULL(@ExportTemplateID, 0) = 0  OR ExportTemplateID = @ExportTemplateID);


        END
    ELSE
        BEGIN
            DECLARE @tmpTable TABLE (
                ExportTemplateID INT          ,
                UserID           INT          ,
                TemplateName     VARCHAR (MAX),
                FileDelimeter    VARCHAR (2)  ,
                SortFieldID      INT          ,
                ExportGroupID    INT          ,
                CreatedBy        INT          ,
                ModifiedBy       INT          ,
                IsLocked         BIT          );


            SELECT @CorporateId = ISNUll(CorporateID,0),
			       @DivisionId = ISNULL(DivisionId,0) ,
				   @RegionId = ISNULL(RegionID,0)
            FROM   CustomerSetup
            WHERE  CUSTOMERID = @CustomerID;

			Select @CorporateId , @DivisionId , @RegionId

            INSERT INTO @tmpTable (ExportTemplateID, UserID, TemplateName, FileDelimeter, SortFieldID, ExportGroupID, CreatedBy, ModifiedBy, IsLocked)
            SELECT ExportTemplates.ExportTemplateID,
                   ExportTemplates.UserID,
                   ExportTemplates.TemplateName,
                   ExportTemplates.FileDelimeter,
                   ExportTemplates.SortFieldID,
                   ExportTemplates.ExportGroupID,
                   ExportTemplates.CreatedBy,
                   ExportTemplates.ModifiedBy,
                   ExportTemplates.IsLocked
            FROM   ExportTemplates
                  INNER JOIN [USER] U  ON U.UserID = ExportTemplates.UserID
                    WHERE    (ISNULL(@ExportTemplateID, 0) = 0   OR ExportTemplateID = 0) AND U.IsActive = 1 AND ExportTemplates.IsActive  = 1 
					  AND CustomerID = @CustomerID  OR (CorporateId = @CorporateId OR DivisionId = @DivisionId  OR RegionId = @RegionId)

						--Select * from @tmpTable
            IF @DivisionId = 3
                BEGIN
                    INSERT INTO @tmpTable (ExportTemplateID, UserID, TemplateName, FileDelimeter, SortFieldID, ExportGroupID, CreatedBy, ModifiedBy, IsLocked)
                    SELECT ExportTemplates.ExportTemplateID,
                           ExportTemplates.UserID,
                           ExportTemplates.TemplateName,
                           ExportTemplates.FileDelimeter,
                           ExportTemplates.SortFieldID,
                           ExportTemplates.ExportGroupID,
                           ExportTemplates.CreatedBy,
                           ExportTemplates.ModifiedBy,
                           ExportTemplates.IsLocked
                    FROM   ExportTemplates
                    WHERE  ExportTemplateID = 505;
                END
			--Get ExportTemplate Name changes SuperUser
            IF (@UserTypeID = 97)
                BEGIN
                    SELECT *
                    FROM   @tmpTable
                    UNION
                    SELECT ExportTemplates.ExportTemplateID,
                           ExportTemplates.UserID,
                           ExportTemplates.TemplateName,
                           ExportTemplates.FileDelimeter,
                           ExportTemplates.SortFieldID,
                           ExportTemplates.ExportGroupID,
                           ExportTemplates.CreatedBy,
                           ExportTemplates.ModifiedBy,
                           ExportTemplates.IsLocked
                    FROM   ExportTemplates
                    WHERE  UserID = @UserID;
                END
            ELSE
                BEGIN
                    --HARI END
                    SELECT *
                    FROM   @tmpTable order by ExportTemplateID;
                END
        END
END

