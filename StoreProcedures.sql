USE SmartLybrary
GO

-----------------COUNTRY-------------------------------------------------
CREATE OR ALTER PROC US_Country_Insert(
	@CountryID UNIQUEIDENTIFIER,
	@CountryName NVARCHAR (50),
	@Iso NVARCHAR (3)
)AS 

BEGIN 
	BEGIN TRANSACTION
	BEGIN TRY
		INSERT INTO Person.Country(CountryID, CountryName, Iso)
		VALUES (@CountryID, @CountryName, @Iso)
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION 
		PRINT 'Ocurrió un error US_Country_Insert'
	END CATCH

END
GO

SELECT NEWID()
GO

EXEC US_Country_Insert '255D1A65-8F70-4207-BF44-27BB528FC962', 'Nicaragua', 'Nic'
EXEC US_Country_Insert 'A473AC8F-C6E1-40FA-830C-D517488F1C10', 'Chile', 'Chi'
EXEC US_Country_Insert 'DB7A149D-E6CF-446B-82C6-487CA8F0E60B', 'Costa Rica', 'CR'
EXEC US_Country_Insert 'B5D0695E-029D-4EDA-AB48-2FC0C31DD429', 'Estados Unidos', 'Usa'
EXEC US_Country_Insert 'DD781B70-8E44-4AEE-8C09-EA379880EA17', 'Argentina', 'Arg'

SELECT * FROM Person.Country
GO

-----------------PERSON--------------------------------------------------------------

CREATE OR ALTER PROC US_Person_Insert(
	@PersonID UNIQUEIDENTIFIER,
	@FirstName1 NVARCHAR (50),
	@FirstName2 NVARCHAR (50),
	@LastName1 NVARCHAR (50),
	@LastName2 NVARCHAR (50)
	
)AS 

BEGIN 
	BEGIN TRANSACTION
	BEGIN TRY
		INSERT INTO Person.Person(PersonID, FirstName1, FirstName2, LastName1, LastName2)
		VALUES (@PersonID, @FirstName1, @FirstName2, @LastName1, @LastName2)
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION 
		PRINT 'Ocurrió un error US_Country_Insert'
	END CATCH

END
GO

SELECT NEWID()
GO

EXEC US_Person_Insert 'F04D2D14-0B08-4E79-897C-92C010F91541', 'Laura', 'Maria', 'Lopez','Castillo'
EXEC US_Person_Insert '3F1F84F3-2505-4AF5-A589-894AFCAC083A', 'Ana', 'Carolina', 'Montiel','Gonzales'
EXEC US_Person_Insert '5B0A6C86-6792-4125-9293-21BF14F41CE9', 'Yara', 'Michell', 'Duarte','Aragon'
EXEC US_Person_Insert 'C75E073A-0A55-4633-9DB3-E2BD350DEBC6', 'Gabriel', 'Jose', 'Garcia','Marquez'
EXEC US_Person_Insert '0DD6398D-AF48-4915-A9D5-D2687DB939C9', 'Eliezer', 'Alexander', 'Solís','Solís'
EXEC US_Person_Insert '5E904AAD-44FB-4CC2-843C-37D379CF25F8', 'Massiel', 'Alexandra', 'Sanchez','Ortiz'
EXEC US_Person_Insert '71AF6E69-A99C-4B90-B5E3-D7B611C17F62', 'Anielka', 'Raquel', 'Areas','Larios'

SELECT * FROM Person.Person
GO

-----------------------------AUTOR------------------------------------------------

CREATE OR ALTER PROC US_Autor_Insert(
	@CountryID UNIQUEIDENTIFIER,
	@FirstName1 NVARCHAR (50),
	@FirstName2 NVARCHAR (50),
	@LastName1 NVARCHAR (50),
	@LastName2 NVARCHAR (50)
)AS 

BEGIN 
	BEGIN TRANSACTION
	BEGIN TRY
		DECLARE @IDPerson UNIQUEIDENTIFIER = NEWID()
		INSERT INTO Person.Person(PersonID, FirstName1, FirstName2, LastName1, LastName2)
		VALUES (@IDPerson, @FirstName1, @FirstName2, @LastName1, @LastName2)
		INSERT INTO Person.Autor(AutorID, CountryID , PersonID)
		VALUES (NEWID(), @CountryID, @IDPerson)
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION 
		PRINT 'Ocurrió un error US_Country_Insert'
	END CATCH

END
GO

SELECT NEWID()
GO

EXEC US_Autor_Insert '255D1A65-8F70-4207-BF44-27BB528FC962','Anielka','Raquel', 'Areas', 'Larios'

SELECT * FROM Person.Autor
GO

-----------------------------CLIENTE------------------------------------------------------------------

CREATE OR ALTER PROC US_Cliente_Insert(
	@ClienteID UNIQUEIDENTIFIER,
	@PersonID UNIQUEIDENTIFIER,
	@CountryID UNIQUEIDENTIFIER
)AS 

BEGIN 
	BEGIN TRANSACTION
	BEGIN TRY
		INSERT INTO Person.Cliente(ClienteID, PersonID, CountryID)
		VALUES (@ClienteID, @PersonID, @CountryID)
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION 
		PRINT 'Ocurrió un error US_Country_Insert'
	END CATCH

END
GO

SELECT NEWID()
GO

EXEC US_Cliente_Insert '33ECF329-0DE1-4E28-A823-B99D5CB2F6CB', '5E904AAD-44FB-4CC2-843C-37D379CF25F8', '255D1A65-8F70-4207-BF44-27BB528FC962'
EXEC US_Cliente_Insert 'E4596EE4-0856-4AAE-997F-FB4C7F36FB20', '71AF6E69-A99C-4B90-B5E3-D7B611C17F62', '255D1A65-8F70-4207-BF44-27BB528FC962'

SELECT * FROM Person.Cliente
GO

-------------------------------TIPODOCUMENTO--------------------------------
CREATE OR ALTER PROC US_TipoDocumento_Insert(
	@TipoDocumentID UNIQUEIDENTIFIER,
	@DocumentName NVARCHAR (50)
)AS 

BEGIN 
	BEGIN TRANSACTION
	BEGIN TRY
		INSERT INTO Sales.TipoDocumento(TipoDocumentID, DocumentName)
		VALUES (@TipoDocumentID, @DocumentName)
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION 
		PRINT 'Ocurrió un error US_Country_Insert'
	END CATCH

END
GO

SELECT NEWID()
GO

EXEC US_TipoDocumento_Insert 'C0E39699-6C02-4AB3-BD62-8E4FCDC5DE8B', 'Factura'
EXEC US_TipoDocumento_Insert '0515EB71-CDFE-466E-8E2C-21FCC8ACFF95', 'Factura'
EXEC US_TipoDocumento_Insert '4F2BB426-2BDC-4376-A7C6-969725441817', 'Proforma'
EXEC US_TipoDocumento_Insert '03396924-1A52-4817-9539-C0A86C1CEDE8', 'Factura'
EXEC US_TipoDocumento_Insert '95E5FF7E-06CE-408D-BC10-E602B8F9722B', 'Factura'

SELECT * FROM Sales.TipoDocumento
GO

---------------------------------FACTURA-----------------------------------------
CREATE OR ALTER PROC US_Factura_Insert(
	@FacturaID UNIQUEIDENTIFIER,
	@ClienteID UNIQUEIDENTIFIER,
	@TipoDocumentID UNIQUEIDENTIFIER
)AS 

BEGIN 
	BEGIN TRANSACTION
	BEGIN TRY
		INSERT INTO Sales.Factura(FacturaID, ClienteID, TipoDocumentID)
		VALUES (@FacturaID,@ClienteID, @TipoDocumentID)
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION 
		PRINT 'Ocurrió un error US_Country_Insert'
	END CATCH

END
GO

SELECT NEWID()
GO

EXEC US_Factura_Insert '3FD14CC5-9B64-4DE4-96A1-7406A772AAD0', '33ECF329-0DE1-4E28-A823-B99D5CB2F6CB', 'C0E39699-6C02-4AB3-BD62-8E4FCDC5DE8B'
EXEC US_Factura_Insert '5F7CB048-3374-4842-9FD6-BC64FDAE5027', '33ECF329-0DE1-4E28-A823-B99D5CB2F6CB', '0515EB71-CDFE-466E-8E2C-21FCC8ACFF95'
EXEC US_Factura_Insert 'F449E256-51F3-405A-B440-D92411A3F12B', '33ECF329-0DE1-4E28-A823-B99D5CB2F6CB', '4F2BB426-2BDC-4376-A7C6-969725441817'
EXEC US_Factura_Insert '9A650D85-79D7-45D5-B901-C0647853172F', 'E4596EE4-0856-4AAE-997F-FB4C7F36FB20', '03396924-1A52-4817-9539-C0A86C1CEDE8'
EXEC US_Factura_Insert '7B243F7E-C9AE-402E-9A9B-5449C1BF707C', 'E4596EE4-0856-4AAE-997F-FB4C7F36FB20', '95E5FF7E-06CE-408D-BC10-E602B8F9722B'


SELECT * FROM Sales.Factura
GO

----------------------------GENDER--------------------------------------------------
CREATE OR ALTER PROC US_Gender_Insert(
	@GenderID UNIQUEIDENTIFIER,
	@GenderName NVARCHAR (50)
)AS 

BEGIN 
	BEGIN TRANSACTION
	BEGIN TRY
		INSERT INTO Book.Gender(GenderID, GenderName)
		VALUES (@GenderID, @GenderName)
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION 
		PRINT 'Ocurrió un error US_Country_Insert'
	END CATCH

END
GO

SELECT NEWID()
GO

SELECT * FROM Book.Gender
GO
---------------------------------EDITORIAL---------------------------------
CREATE OR ALTER PROC US_Editorial_Insert(
	@EditorialID UNIQUEIDENTIFIER,
	@EditorialName NVARCHAR (50),
	@CountryID UNIQUEIDENTIFIER
)AS 

BEGIN 
	BEGIN TRANSACTION
	BEGIN TRY
		INSERT INTO Book.Editorial(EditorialID, EditorialName, CountryID)
		VALUES (@EditorialID, @EditorialName,@CountryID)
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION 
		PRINT 'Ocurrió un error US_Country_Insert'
	END CATCH

END
GO

SELECT NEWID()
GO

SELECT * FROM Book.Editorial
GO
-------------------------------------BOOKS---------------------------------------
CREATE OR ALTER PROC US_Books_Insert(
	@BookID UNIQUEIDENTIFIER,
	@GenderID UNIQUEIDENTIFIER,
	@AutorID UNIQUEIDENTIFIER,
	@EditorialID UNIQUEIDENTIFIER
)AS 

BEGIN 
	BEGIN TRANSACTION
	BEGIN TRY
		INSERT INTO Book.Books(BookID, GenderID, AutorID, EditorialID )
		VALUES (@BookID , @GenderID, @AutorID, @EditorialID)
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION 
		PRINT 'Ocurrió un error US_Country_Insert'
	END CATCH

END
GO

SELECT NEWID()
GO

SELECT * FROM Book.Books
GO

-----------------------------------INVOICEDETAILS----------------------------------
CREATE OR ALTER PROC US_InvoiceDetails_Insert(
	@InvoiceDetailsID UNIQUEIDENTIFIER,
	@BookID UNIQUEIDENTIFIER,
	@FacturaID UNIQUEIDENTIFIER,
	@Price DECIMAL,
	@Cuantity INT,
	@Iva DECIMAL,
	@Total DECIMAL
)AS 

BEGIN 
	BEGIN TRANSACTION
	BEGIN TRY
		INSERT INTO Sales.InvoiceDetails(InvoiceDetailsID, BookID, FacturaID, Price, Cuantity, Iva, Total)
		VALUES (@InvoiceDetailsID, @BookID, @FacturaID, @Price, @Cuantity, @Iva, @Total)
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION 
		PRINT 'Ocurrió un error US_Country_Insert'
	END CATCH

END
GO

SELECT NEWID()
GO

SELECT * FROM Sales.InvoiceDetails
GO

----------------------------------------------PERSON/AUTOR-----------------------------------------------------------
SELECT PP.PersonID, PP.FirstName1, PP.FirstName2, PP.LastName1, PP.LastName2, PA.CreationDate, PC.CountryName FROM Person.Person AS PP
INNER JOIN Person.Autor AS PA
ON PA.PersonID = PP.PersonID
INNER JOIN Person.Country AS PC
ON PC.CountryID = PA.CountryID
WHERE PP.IsActive = 1
GO

CREATE OR ALTER PROC US_PersonAutorSelect
AS
BEGIN
	SELECT PP.PersonID, PA.AutorID, PP.FirstName1, PP.FirstName2, PP.LastName1, PP.LastName2, PA.CreationDate, PC.CountryName FROM Person.Person AS PP
	INNER JOIN Person.Autor AS PA
	ON PA.PersonID = PP.PersonID
	INNER JOIN Person.Country AS PC
	ON PC.CountryID = PA.CountryID
	WHERE PP.IsActive = 1
END
GO

EXEC US_PersonAutorSelect
GO
