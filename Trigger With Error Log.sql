
CREATE TABLE ErrorLog 
(
   ErrorLogID INT IDENTITY(1,1),
   ErrorDate DATETIME DEFAULT (GETUTCDATE()),
   ErrorMsg VARCHAR(MAX), 
   ErrorNumber INT, 
   ErrorProc sysname, 
   ErrorLine INT 
)

ALTER TRIGGER [Inventory].[StockUpdationOnIssue]
ON              [Inventory].[StockIssueDetails]
AFTER           INSERT  
AS
BEGIN
    BEGIN TRY
        BEGIN TRAN
                    INSERT INTO TableA 
                        (col1, col2,col3
                        )
                    SELECT      I.col1,I.col2,si.col3
                    FROM        inserted I
                    INNER JOIN  Inventory.StockIssue SI
                    ON          SI.StockIssueId = I.StockIssueId

                    INSERT INTO TableB
                        (col1, col2,col3
                        )
                    SELECT      I.col1,I.col2,si.col3
                    FROM        inserted I
                    INNER JOIN  Inventory.StockIssue SI
                    ON          SI.StockIssueId = I.StockIssueId

        COMMIT TRAN
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMsg VARCHAR(MAX), @ErrorNumber INT, @ErrorProc sysname, @ErrorLine INT 

        SELECT @ErrorMsg = ERROR_MESSAGE(), @ErrorNumber = ERROR_NUMBER(), @ErrorProc = ERROR_PROCEDURE(), @ErrorLine = ERROR_LINE();
        RollBack Tran;

        INSERT INTO ErrorLog (ErrorMsg,  ErrorNumber,  ErrorProc,  ErrorLine)
        VALUES               (@ErrorMsg, @ErrorNumber, @ErrorProc, @ErrorLine)
    END CATCH
END
Being table ErrorLog like:
