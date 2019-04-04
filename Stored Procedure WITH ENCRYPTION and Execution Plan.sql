--It is very clear from above example that Encrypted SP does not show the actual execution plan as from Actual Execution Plan user can figure out the logic behind the SP. 
--To avoid this issue for encrypted SP Management Studio does not display the execution plan.

--Keyword WITH ENCRYPTION is used to encrypt the text of the Stored Procedure. One SP are encrypted it is not possible to get original text of the SP from SP itself.
-- User who created SP will need to save the text to be used to create SP somewhere safe to reuse it again.

Drop procedure #RegularSP
Drop procedure #EncryptSP
CREATE PROCEDURE #RegularSP
AS
SELECT TOP 10 LeakageID
FROM leakage
GO
/* Create SP with Encryption */

CREATE PROCEDURE #EncryptSP
WITH ENCRYPTION
AS
SELECT TOP 10 LeakageID
FROM leakage
GO
/* Execute SP - Execution Plan Tab shows up */
EXEC #RegularSP
GO

EXEC #EncryptSP
GO


