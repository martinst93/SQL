--Create new procedure called CreateGrade
--Procedure should create only Grade header info (not Grade Details) 
--Procedure should return the total number of grades in the system for the Student on input (from the CreateGrade)
--Procedure should return second resultset with the MAX Grade of all grades for the Student and Teacher on input (regardless the Course)
 
CREATE PROCEDURE dbo.CreateGrade (@StudentID int, @CourseID smallint, @TeacherID smallint, 
								  @Grade tinyint, @Comment nvarchar(100), @CreatedDate datetime)

AS
BEGIN

	INSERT INTO [dbo].[Grade] ([StudentID], [CourseID], [TeacherID], [Grade], [Comment], [CreatedDate])
	VALUES (@StudentID, @CourseID, @TeacherID, @Grade, @Comment, @CreatedDate)

	SELECT COUNT(*) as TotalNumberOfGrades
	FROM [dbo].[Grade]
	WHERE StudentID = @StudentID

	SELECT MAX(g.Grade) as MaxGrade
	FROM [dbo].[Grade] G
	WHERE StudentID = @StudentID AND TeacherID = @TeacherID

END
GO

EXEC dbo.CreateGrade @StudentID = 10, @CourseID = 3, @TeacherID = 6, @Grade = 10, @Comment = 'Dobar', @CreatedDate = '2000-03-07'


--Create new procedure called CreateGradeDetail
--Procedure should add details for specific Grade (new record for new AchievementTypeID, Points, MaxPoints, Date for specific Grade)
--Output from this procedure should be resultset with SUM of GradePoints calculated with 
--formula AchievementPoints/AchievementMaxPoints*ParticipationRate for specific Grade

drop procedure if exists dbo.CreateGradeDetail
GO

CREATE OR ALTER PROCEDURE dbo.CreateGradeDetail (@GradeID int, @AchievementTypeID tinyint, @AchievementPoints tinyint,
												 @AchievementMaxPoints tinyint, @AchievementDate datetime)

AS
BEGIN
	
	DECLARE @ParticipationRate tinyint

	SELECT @ParticipationRate = ParticipationRate
	FROM [dbo].[AchievementType] 
	WHERE ID =  @AchievementTypeID

	INSERT INTO dbo.GradeDetails ([GradeID], [AchievementTypeID], [AchievementPoints], [AchievementMaxPoints], [AchievementDate])
	VALUES (@GradeID, @AchievementTypeID, @AchievementPoints, @AchievementMaxPoints, @AchievementDate)

	SELECT SUM((cast(gd.AchievementPoints as decimal)/cast(gd.AchievementMaxPoints as decimal)) * @ParticipationRate) as GradePoints
	FROM[dbo].[GradeDetails] gd
	WHERE gd.GradeID = @GradeID

END
GO

EXEC dbo.CreateGradeDetail @GradeID = 6, @AchievementTypeID = 2, @AchievementPoints = 5, @AchievementMaxPoints = 88 ,@AchievementDate = '2014-06-03'