CREATE TABLE [dbo].[Employee] (  
    [Id]      INT           IDENTITY (1, 1) NOT NULL,  
    [Name]    NVARCHAR (50) NOT NULL,  
    [Address] NVARCHAR (50) NOT NULL,  
    [Country] NVARCHAR (50) NOT NULL,  
    [City]    NVARCHAR (50) NOT NULL,  
    [Mobile]  NVARCHAR (10) NOT NULL,  
    PRIMARY KEY CLUSTERED ([Id] ASC)  
);  


CREATE PROCEDURE sp_InsUpdDelEmployee  
    @id INT ,  
    @name NVARCHAR(50) ,  
    @address NVARCHAR(50) ,  
    @country NVARCHAR(50) ,  
    @city NVARCHAR(50) ,  
    @mobile NVARCHAR(50) ,  
    @type VARCHAR(10)  
AS   
    BEGIN  
        IF ( @type = 'Ins' )   
            BEGIN  
                INSERT  INTO Employee  
                VALUES  ( @name, @address, @country, @city, @mobile )  
            END  
        IF ( @type = 'Upd' )   
            BEGIN  
                UPDATE  Employee  
                SET     Name = @name ,  
                        [Address] = @address ,  
                        Country = @country ,  
                        City = @city ,  
                        Mobile = @mobile  
                WHERE   Id = @id  
            END  
        IF ( @type = 'Del' )   
            BEGIN  
                DELETE  FROM Employee  
                WHERE   Id = @id  
            END   
        IF ( @type = 'GetById' )   
            BEGIN  
                SELECT  *  
                FROM    Employee  
                WHERE   Id = @id  
            END  
        SELECT  *  
        FROM    Employee  
    END  
