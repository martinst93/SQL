--Declare scalar variable for storing FirstName values
--Assign value ‘Antonio’ to the FirstName variable
--Find all Students  having FirstName  same as the variable

DECLARE @FirstName nvarchar(100)
	SET @FirstName = 'Antonio'

SELECT @FirstName as StudentsNamedAntonio
FROM [dbo].[Student]
GO

--Declare table variable that will contain StudentId, StudentNameand DateOfBirth
--Fill the  table variable with all Female  students

DECLARE @StudentList TABLE
	(StudentId int, StudentName nvarchar(100), DateOfBirth date)

INSERT INTO @StudentList
	SELECT ID, FirstName, DateOfBirth from [dbo].[Student]
	WHERE Gender = 'F' 

SELECT * FROM @StudentList

--Declare temp table that will contain LastNameand EnrolledDatecolumns
--Fill the temp table with all Male students having First Name starting with ‘A’
--Retrieve  the students  from the  table which last name  is with 7 characters

DROP TABLE #TempTable

CREATE TABLE #TempTable
	(LastName nvarchar(100), EnrolledDate date)

INSERT INTO #TempTable
	SELECT LastName, EnrolledDate FROM [dbo].[Student]
	WHERE Gender = 'M' AND LEFT(FirstName, 1) = 'A' AND LEN(FirstName) = 7

	SELECT * FROM #TempTable

--Find all teachers whose FirstName length is less than 5 and
--the first 3 characters of their FirstName  and LastNameare the same

SELECT *
	FROM [dbo].[Teacher] 
	WHERE LEN(FirstName) < 5 AND LEFT(FirstName, 3) = LEFT(LastName, 3)
GO

--Declare scalar function (fn_FormatStudentName) for retrieving the Student
--description for specific StudentIdin the following format:
--StudentCardNumberwithout “sc-”
--“ –“
--First character  of student  FirstName
--“.”
--Student LastName

--select * from [dbo].[Student]

DROP FUNCTION IF EXISTS dbo.fn_FormatStudentName

CREATE FUNCTION dbo.fn_FormatStudentName (@StudentID int)
RETURNS nvarchar(2000)
AS 
BEGIN
	DECLARE @Output nvarchar(2000)

	SELECT @Output = SUBSTRING(StudentCardNumber, 4, 6) + ' - ' + RIGHT(FirstName, 1) + '.' + LastName
	FROM dbo.Student 
	WHERE ID = @StudentID
	RETURN @Output
END
GO

SELECT S.ID, S.FirstName, S.LastName, S.DateOfBirth, S.EnrolledDate, S.Gender, S.NationalIDNumber, S.StudentCardNumber, dbo.fn_FormatStudentName(ID) as 'Function Output'
FROM [dbo].[Student] S
GO