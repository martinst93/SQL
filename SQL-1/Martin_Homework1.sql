USE [master]
GO

USE Martin
GO

CREATE TABLE [Student](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[EnrolledDate] [date] NOT NULL,
	[Gender] [char](1) NOT NULL,
	[NationalIDNumber] [nvarchar](30) NOT NULL,
	[StudentCardNumber] [nvarchar](30) NOT NULL,
CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED
(
	[ID] ASC
))
GO

CREATE TABLE [Teacher](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[AcademicRank] [nvarchar](50) NOT NULL,
	[HireDate] [date] NOT NULL,
CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED
(
	[ID] ASC
))
GO

CREATE TABLE [Grade](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NOT NULL,
	[CourseID] [smallint] NOT NULL,
	[TeacherID] [smallint] NOT NULL,
	[Grade] [tinyint] NOT NULL,
	[Comment] [nvarchar](100) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
CONSTRAINT [PK_Grade] PRIMARY KEY CLUSTERED
(
	[ID] ASC
))
GO

CREATE TABLE [Course](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[Credit] [smallint] NOT NULL,
	[AcademicYear] [smallint] NOT NULL,
	[Semester] [nvarchar](30) NOT NULL,
CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED
(
	[ID] ASC
))
GO

CREATE TABLE [AchievementType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[ParticipationRate] [smallint] NOT NULL,
CONSTRAINT [PK_AchievementType] PRIMARY KEY CLUSTERED
(
	[ID] ASC
))
GO

CREATE TABLE [GradeDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GradeID] [int] NOT NULL,
	[AchievementTypeID] [smallint] NOT NULL,
	[AchievementPoints] [smallint] NOT NULL,
	[AchievementMaxPoints] [smallint] NOT NULL,
	[AchievementDate] [datetime] NOT NULL,
CONSTRAINT [PK_GradeDetails] PRIMARY KEY CLUSTERED
(
	[ID] ASC
))
GO