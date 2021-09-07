SELECT FirstName
FROM Teacher
UNION ALL
SELECT FirstName 
FROM Student
GO

SELECT LastName
FROM Teacher
UNION
SELECT LastName 
FROM Student
GO

SELECT FirstName
FROM Teacher
INTERSECT
SELECT FirstName 
FROM Student
GO