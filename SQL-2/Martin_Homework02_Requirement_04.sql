ALTER TABLE GradeDetails
ADD CONSTRAINT DF_GradeDetails_AchievementMaxPoints
DEFAULT 100 FOR AchievementMaxPoints
GO

ALTER TABLE GradeDetails WITH CHECK
ADD CONSTRAINT DF_GradeDetails_AchievementPoints
CHECK ([AchievementPoints] <= [AchievementMaxPoints]);
GO

ALTER TABLE AchievementType WITH CHECK
ADD CONSTRAINT UC_AchievementType_Name UNIQUE (Name)
GO
