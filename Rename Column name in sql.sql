Select * from MPLLeakageVerification
Select * from MPLLeakageVerificationCommand
Select * from MPLLeakageVerificationHistory
Select * from QAMMeasurementDetailForMPLLeakVerification

SP_RENAME 'MPLLeakageVerification.MPLVarificationID' , 'MPLVerificationID', 'COLUMN'
SP_RENAME 'MPLLeakageVerificationCommand.MPLVarificationID' , 'MPLVerificationID', 'COLUMN'
SP_RENAME 'MPLLeakageVerificationHistory.MPLVarificationID' , 'MPLVerificationID', 'COLUMN'

MPLVarificationID
