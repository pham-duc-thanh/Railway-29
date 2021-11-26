DROP DATABASE IF EXISTS `Testing_system`;
CREATE DATABASE IF NOT EXISTS `Testing_system`;
USE `Testing_system`;

CREATE TABLE IF NOT EXISTS `Department`(
	DepartmentID		INT,
    DepartmentName		VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS `Position`(
	PositionID			INT,
    PositionName		VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS `Account`(
	AccountID			INT,
    Email				VARCHAR(50),
    Usetname			VARCHAR(50),
    FullName			VARCHAR(50),
    DepartmentID		INT,
    PositionID			INT,
    CreateDate			INT
);

CREATE TABLE IF NOT EXISTS `Group`(
	GroupID				INT,
    GroupName			VARCHAR(50),
    CreatorID			INT,
    CreateDate			INT
);

CREATE TABLE IF NOT EXISTS `GroupAccount`(
	GroupID				INT,
    AccountID			INT,
    JoinDate			INT
);

CREATE TABLE IF NOT EXISTS `TypeQuestion`(
	TypeID				INT,
    TypeName			VARCHAR(50)

);

CREATE TABLE IF NOT EXISTS `CategoryQuestion`(
	CategoryID			INT,
	CategoryName		VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS `Question`(
	QuestionID			INT,
    Content				VARCHAR(50),
    CategoryID			INT,
    TypeID				INT,
    CreatorID			INT,
    CreateDate			INT

);

CREATE TABLE IF NOT EXISTS `Answer`(
	AnswerID 			INT,
    Content				VARCHAR(50),
    QuestionID			INT,
    isCorrect			VARCHAR(50)

);

CREATE TABLE IF NOT EXISTS `Exam`(
	ExamID				INT,
    `Code`   			INT,
    Tile				VARCHAR(50),
    CategoryID			INT,
    Duration			INT,
    CreatorID			INT,
    CreateDate			INT

);

CREATE TABLE IF NOT EXISTS `ExamQuestion`(
	ExamID				INT,
    QuestionID			INT

);





