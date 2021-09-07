SELECT * 
FROM Student
WHERE FirstName = 'Antonio';
GO

SELECT *
FROM Student
WHERE DateOfBirth >= '1999.01.01';
GO

SELECT *
FROM Student
WHERE Gender = 'M';
GO

SELECT *
FROM Student
WHERE LastName like 'T%';
GO

SELECT *
FROM Student
WHERE EnrolledDate >= '1998.01.01' AND EnrolledDate < '1998.02.01';
GO

SELECT *
FROM Student
WHERE LastName like 'J%' AND EnrolledDate >= '1998.01.01' AND EnrolledDate < '1998.02.01';
GO