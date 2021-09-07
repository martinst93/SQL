SELECT c.Name AS CourseName, a.Name AS AchievementName
FROM Course AS c
CROSS JOIN AchievementType AS a
GO

SELECT DISTINCT t.FirstName, t.LastName
FROM Teacher AS t
INNER JOIN Grade AS g ON t.ID = g.TeacherID
GO

SELECT DISTINCT t.FirstName, t.LastName
FROM Teacher AS t
LEFT JOIN Grade AS g ON t.ID = g.TeacherID
WHERE g.ID is null
GO

SELECT s.*
FROM Grade AS g
RIGHT JOIN Student AS s ON g.StudentID = s.ID
where g.StudentID is null
GO

SELECT s.*
FROM Student AS s 
LEFT JOIN Grade AS g ON s.ID = g.StudentID
WHERE g.StudentID is null
GO