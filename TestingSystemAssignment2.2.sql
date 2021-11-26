DROP DATABASE IF EXISTS TestingSystemAssignment2;
CREATE DATABASE TestingSystemAssignment2;
USE TestingSystemAssignment2;

DROP  TABLE IF EXISTS Department;
CREATE TABLE Department(
DepartmentID		TINYINT AUTO_INCREMENT PRIMARY KEY,
DepartmentName		CHAR(30) NOT NULL
);

DROP  TABLE IF EXISTS `Position`;
CREATE TABLE `Position`(
PositionID    		TINYINT AUTO_INCREMENT PRIMARY KEY,
PositionName		VARCHAR(50) NOT NULL
);
DROP  TABLE IF EXISTS `Account`;
CREATE TABLE `Account`(
    AccountID 		TINYINT AUTO_INCREMENT PRIMARY KEY ,
    Email 			VARCHAR(30) UNIQUE,
    Username        VARCHAR(30) UNIQUE,
    Fullname        VARCHAR(30),
    DepartmentID	TINYINT NOT NULL,
    PositionID		TINYINT NOT NULL,
    CreateDate      DATETIME default NOW(),
    
 FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
 FOREIGN KEY (PositionID) REFERENCES `Position`(PositionID)
);

DROP  TABLE IF EXISTS `Group` ;
CREATE TABLE `Group`(
	GroupID    		TINYINT AUTO_INCREMENT PRIMARY KEY,
    GroupName       VARCHAR(30) unique KEY ,
	CreatorID		TINYINT NOT NULL,
    CreateDate	    DATETIME DEFAULT NOW(),
 FOREIGN KEY (CreatorID) REFERENCES `Account`(AccountID)
);


DROP TABLE IF EXISTS `GroupAccount` ;
create TABLE `GroupAccount`(
    GroupID			TINYINT,
	AccountID		TINYINT,
    JoinDate 		DATE,
    
FOREIGN KEY (GroupID) REFERENCES `Group`(GroupID),
FOREIGN KEY (AccountID) REFERENCES `Account`(AccountID)
);

DROP  TABLE IF EXISTS TypeQuestion;
CREATE TABLE TypeQuestion (
	TypeID			TINYINT AUTO_INCREMENT PRIMARY KEY,
	TypeName		VARCHAR(50) NOT NULL
);

DROP  TABLE IF EXISTS CategoryQuestion;
CREATE TABLE CategoryQuestion (
	CategoryID		TINYINT  AUTO_INCREMENT PRIMARY KEY,
    CategoryName	VARCHAR(50)
); 
-- trên này không có unsigned nên ở dưới cũng dc có anh nhé
DROP  TABLE IF EXISTS `Question`;
CREATE TABLE `Question` (
	QuestionID		TINYINT AUTO_INCREMENT PRIMARY KEY,
    Content			VARCHAR(50) NOT NULL,
   	CategoryID		TINYINT ,
    TypeID			TINYINT ,
    CreatorID		TINYINT  ,
    CreateDate      DATETIME DEFAULT NOW(),
FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion(CategoryID),
FOREIGN KEY (CreatorID) REFERENCES `Account`(AccountID)
);
 
DROP  TABLE IF EXISTS Answer;
CREATE TABLE Answer (
	AnswerID		TINYINT AUTO_INCREMENT PRIMARY KEY,
	Content			TINYINT NOT NULL,
    QuestionID		TINYINT,
    isCorrect		TINYINT NOT NULL,
FOREIGN KEY (QuestionID) REFERENCES `Question`(QuestionID)
);

DROP  TABLE IF EXISTS Exam;
CREATE TABLE Exam (
	ExamID			TINYINT AUTO_INCREMENT PRIMARY KEY,
    `Code`			VARCHAR(30) UNIQUE KEY, 
    Title			VARCHAR(100) UNIQUE KEY,
    CategoryID		TINYINT NOT NULL,
    Duration		enum('60','15','120') default '15',
    CreatorID		TINYINT,
    CreateDate 		date ,
FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion(CategoryID),
FOREIGN KEY (CreatorID) REFERENCES `Account`(AccountID)
);

-- đây là bảng trung gian giữa bảng exam và question nên có 2 khoá chính anh nhé
DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE ExamQuestion (
   ExamID			TINYINT ,
   QuestionID		TINYINT,
FOREIGN KEY (QuestionID) REFERENCES `Question`(QuestionID),
FOREIGN KEY (ExamID) REFERENCES Exam(ExamID)

); 

INSERT INTO Department(DepartmentName)
VALUES                   ('Sale'),
						('marketing'),
                        ('lễ tân'),
                        ('hành chính'),
                        ('phòng chờ việc'),
                        ('kế toán'),
                        ('kinh doanh'),
                        ('nhân sự'),
                        ('tài chính'),
                        ('kiểm toán');
						

-- select * from Department; 
-- select * from Department where DepartmentID=10;

INSERT INTO `Position`(PositionName)
VALUES					('dev'),
						('test'),
                        ('seeun master'),
                        ('pm'),
                        ('director'),
                        ('ceo'),
                        ('cio'),
                        ('cfo'),
                        ('coo'),
                        ('founder');


INSERT INTO `Account`(Email,Username,FullName,DepartmentID,PositionID,CreateDate)
VALUES					('VUTHITHAO@gmail.com','VUTHAO','VUTHITHAO',1,2,'2020/10/5'),
						('NGUYENPHUONGANH@gmail.com','NGUYENANH','NGUYENPHUONGANH',2,4,'2019/5/7'),
                        ('TRANTHUHUE@gmail.com','TRANHUE','TRANTHUHUE',4,8,'2020/8/1'),
                        ('TRANPHIHUNG@gmail.com','TRANHUNG','TRANPHIHUNG',3,9,'2019/4/30'),
                        ('LEANHNGOC@gmail.com','LENGOC','LEANHNGOC',3,2,'2020/10/5'),
                        ('PHAMDUCTHANH@gmail.com','PHAMTHANH','PHAMDUCTHANH',1,5,'2019/8/10'),
                        ('TRANVANSON@gmail.com','TRANSON','TRANVANSON',2,2,'2019/2/10'),
                        ('HAMANHTU@gmail.com','HATU','HAMANHTU',4,8,'2020/9/5'),
                        ('PHAMCONGSON@gmail.com','PHAMSON','PHAMCONGSON',3,7,'2019/1/1'),
                        ('DAOVANTHE@gmail.com','DAOTHE','DAOVANTHE',3,1,'2019/10/10');
                        
--- select * from  `Account`;


INSERT INTO `Group`(GroupName,CreatorID,CreateDate)
VALUES              ('SB1',2,'2019/10/8'),
					('SB2',3,'2018/1/29'),
                    ('SB3',4,'2019/1/2'),
                    ('SB4',1,'2020/12/8'),
                    ('BS5',5,'2020/5/5'),
                    ('SX6',5,'2020/12/8'),
                    ('SX7',4,'2018/3/15'),
                    ('HS9',2,'2019/10/3'),
                    ('SV10',4,'2020/9/8');
 -- select * from   `Group`;                 
 
 
   INSERT INTO  `GroupAccount`(GroupID,AccountID,JoinDate)
   VALUES						(1,2,'2019/11/2'),
                                (5,6,'2020/1/2'),
                                (4,3,'2018/12/1'),
                                (2,8,'2018/6/7'),
                                (1,3,'2019/7/9'),
                                (3,7,'2018/2/12'),
                                ('4',5,'2020/8/7'),
                                ('8',2,'2018/1/1'),
                                ('2',3,'2019/11/2'),
                                ('7',4,'2020/10/5');
   
-- select * from `GroupAccount`;

INSERT INTO TypeQuestion(TypeName)
VALUES					('Essay'),
						('Multiple-Choice'),
                        ('Multiple-Choice'),
                        ('Multiple-Choice'),
                        ('Essay'),
                        ('Essay'),
                        ('Multiple-Choice'),
                        ('Essay'),
                        ('Essay'),
                        ('Multiple-Choice');
 
 -- select * from TypeQuestion;
 
 INSERT INTO CategoryQuestion(CategoryName)
 VALUES					('java'),
						('net'),
                        ('SQL'),
                        ('postman'),
                        ('ruby'),
                        ('bigC'),
                        ('OXY'),
                        ('SONY'),
                        ('AB'),
                        ('CD');

--- select * from CategoryQuestion;
 
 INSERT INTO `Question`(Content,CreateDate)
 VALUES                 ('hỏi java','2019/12/8'),
						('hỏi net','2019/11/10'),
                        ('hỏi mysql','2018/4/7'),
                        ('hỏi postman','2020/1/10'),
                        ('hỏi ruby','2018/3/3'),
                        ('hỏi OXY','2019/3/28'),
                        ('hỏi bigC','2019/7/8'),
                        ('hỏi SONY','2018/7/6'),
                        ('hỏi AB','2018/4/2'),
						('hỏi CD','2020/10/8');
-- select * from `Question`;

INSERT INTO Answer(Content,QuestionID,isCorrect)
VALUES			  ('1','5','1'),
				  ('2','3','2'),
                  ('3','8','2'),
                  ('4','9','1'),
                  ('5','7','1'),
                  ('6','4','2'),
                  ('7','1','1'),
                  ('8','10','1'),
                  ('9','2','1'),
                  ('10','2','2');
-- select * from Answer;

INSERT INTO Exam(`Code`,Title,CategoryID,CreatorID,CreateDate)
VALUES			('A1','JAVA',4,'2','2020/10/2'),
				('A2','NET',2,'5','2019/8/7'),
                ('A3','mySQL',3,'5','2018/12/8'),
                ('A4','POSTMAN',2,'8','2019/4/8'),
                ('A5','RUBY',6,'7','2020/1/8'),
                ('A6','OXY',7,'8','2018/11/10'),
                ('A7','bigC',9,'9','2019/2/8'),
                ('A8','SONY',10,'8','2019/5/5'),
                ('A9','AB',5,'6','2019/1/8'),
                ('A10','CD',7,'5','2020/1/2');


-- select * from Exam;

INSERT INTO examquestion(ExamID,QuestionID)
VALUES 					('10','2'),
						('8','3'),
                        ('9','3'),
                        ('4','2'),
                        ('4','5'),
                        ('6','4'),
                        ('1','4'),
                        ('8','3'),
                        ('3','1'),
                        ('2','4');
--- select * from examquestion;


