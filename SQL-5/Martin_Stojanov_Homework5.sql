CREATE FUNCTION dbo.fn_Return (@TeacherID INT, @CourseID INT)
RETURNS @Output TABLE (FirstName NVARCHAR(100), LastName NVARCHAR(100), Grade TINYINT, CreatedDate DATETIME)

AS

BEGIN

	INSERT INTO @Output
	SELECT s.FirstName as StudentsFirstName, s.LastName as StudentsLastName, g.Grade as Grade, g.CreateDate
	FROM [dbo].[Student] s
	inner join [dbo].[Grade] as G on S.ID = g.ID
	WHERE g.CourseID = @CourseID and g.TeacherID = @TeacherID
	GROUP BY s.FirstName, s.LastName, g.Grade, g.CreateDate

RETURN
END
GO

SELECT * FROM dbo.fn_Return(10, 11)


CREATE FUNCTION dbo.fn_Return2 (@Teacher2ID INT)
RETURNS @Output2 TABLE (FirstName NVARCHAR(100), LastName NVARCHAR(100), Grade TINYINT)

AS

BEGIN

	INSERT INTO @Output2
	SELECT s.FirstName as StudentsFirstName, s.LastName as StudentsLastName, AVG(g.Grade) as AVGGrade
	FROM [dbo].[Student] s
	inner join [dbo].[Grade] as G on S.ID = g.ID
	inner join [dbo].[Teacher] as T on s.ID = t.ID
	WHERE g.TeacherID = @Teacher2ID
	GROUP BY s.FirstName, s.LastName

RETURN
END
GO


SELECT * FROM dbo.fn_Return2(9)

ALTER TABLE [dbo].[Grade]
ADD ForReward nvarchar(10) 

ALTER FUNCTION dbo.fn_Return2 (@Teacher2ID INT, @RewardThreshold NVARCHAR(100))
RETURNS @Output2 TABLE (FirstName NVARCHAR(100), LastName NVARCHAR(100), Grade TINYINT)

AS

BEGIN

	INSERT INTO @Output2
	SELECT s.FirstName as StudentsFirstName, s.LastName as StudentsLastName, AVG(g.Grade) as AVGGrade 
	FROM [dbo].[Student] s
	inner join [dbo].[Grade] as G on S.ID = g.ID
	inner join [dbo].[Teacher] as T on s.ID = t.ID
	WHERE g.TeacherID = @Teacher2ID
	GROUP BY s.FirstName, s.LastName
	HAVING  AVG(g.Grade) < 9 ForReward = 'No' AND AVG(g.Grade) > 9 ForReward = 'Yes' 

RETURN
END
GO