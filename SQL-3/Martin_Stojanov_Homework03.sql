--Calculate the count of all grades in the system

SELECT COUNT(*) as Total
FROM [dbo].[Grade]
GO

--Calculate the count of all grades per Teacher in the system

SELECT be.[FirstName], COUNT(Grade) as GradesByTeacher
FROM [dbo].[Grade] as g
inner join [dbo].[Teacher] as BE on be.ID = g.Grade
GROUP BY [Grade]
GO

--Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100)

SELECT SUM(Grade) as GradesOfFirst100Students
FROM [dbo].[Grade]
WHERE StudentID < 100
GO

--Find the Maximal Grade, and the Average Grade per Student on all grades in the system

SELECT  MAX(Grade) [MaximumGrade], AVG(Grade) [AverageGrade]
FROM [dbo].[Grade] as g
inner join [dbo].[Student] as ST on st.ID = g.StudentID
GROUP BY [StudentID]
GO

--Calculate the count of all grades per Teacher in the system and filter only grade count greater then 200

SELECT COUNT(*) as AllGrades
FROM [dbo].[Grade] as g
inner join [dbo].[Teacher] as TE on te.ID = g.Grade
WHERE [Grade] > 200
GO

--Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100)
--and filter teachers with more than 50 Grade count

SELECT  COUNT(*) as AllGrades
FROM [dbo].[Grade] as g
inner join [dbo].[Teacher] as TC on tc.ID = g.StudentID
WHERE StudentID < 100
GROUP BY StudentID
HAVING TeacherID > COUNT(Grade > 50) AND COUNT(Grade < 100)