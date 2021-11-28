DROP DATABASE IF EXISTS `Testing_system`;
CREATE DATABASE IF NOT EXISTS `Testing_system`;
USE `Testing_system`;

DROP TABLE IF EXISTS `Department`;
CREATE TABLE IF NOT EXISTS `Department`(
	DepartmentID		TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    DepartmentName		VARCHAR(30)
);

DROP TABLE IF EXISTS `Position`;
CREATE TABLE IF NOT EXISTS `Position`(
	PositionID			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    PositionName		ENUM('Dev','Test','Scrum Master','PM') NOT NULL
    -- CACH viet 2 khoa CHINH 
    -- PRIMARY KEY (PositionID,PositionName)
); 

-- ALTER TABLE  `Position` MODIFY COLUMN PositionName ENUM('Dev','Test','Scrum Master','PM') NOT NULL UNIQUE KEY;
DROP DATABASE IF EXISTS `Account`;
CREATE TABLE IF NOT EXISTS `Account`(
	AccountID			TINYINT  UNSIGNED PRIMARY KEY  AUTO_INCREMENT ,
    Email				VARCHAR(30) UNIQUE KEY,
    Username			VARCHAR(30) UNIQUE KEY,
    FullName			VARCHAR(30) NOT NULL,
    DepartmentID		TINYINT UNSIGNED,
    PositionID			TINYINT UNSIGNED,
    CreateDate			DATE,
    
    -- Tạo RÀNG BUỘC 
    CONSTRAINT fk_dp_id FOREIGN KEY (DepartmentID) REFERENCES `Department`(DepartmentID)  ON DELETE SET NULL ON UPDATE CASCADE
,
    CONSTRAINT fk_ps_id FOREIGN KEY (PositionID) REFERENCES `Position`(PositionID)  ON DELETE SET NULL ON UPDATE CASCADE

);

DROP TABLE IF EXISTS `Group`;
CREATE TABLE IF NOT EXISTS `Group`(
	GroupID				TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    GroupName			VARCHAR(50) NOT NULL,
    CreatorID			TINYINT UNSIGNED UNIQUE KEY ,
    CreateDate			DATETIME DEFAULT NOW(),
    
    -- TAO RANG BUOC
    CONSTRAINT fk_id FOREIGN KEY (CreatorID) REFERENCES `Account`(AccountID) ON DELETE SET NULL ON UPDATE CASCADE
);

DROP TABLE IF EXISTS `GroupAccount`;
CREATE TABLE IF NOT EXISTS `GroupAccount`(
	GroupID				TINYINT UNSIGNED,
    AccountID			TINYINT UNSIGNED,
    JoinDate			DATETIME,
    
    -- TAO KHOA CHINH
    PRIMARY KEY (GroupID,AccountID),
    -- TAO RANG BUOC
    CONSTRAINT fk_dr_id FOREIGN KEY (GroupID) REFERENCES `Group`(GroupID) ,
    CONSTRAINT fk_ac_id FOREIGN KEY (AccountID) REFERENCES `Account`(AccountID) 
);

DROP TABLE IF EXISTS `TypeQuestion`;
CREATE TABLE IF NOT EXISTS `TypeQuestion`(
	TypeID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY ,
    TypeName			ENUM('Essay','Multiple-Choice') NOT NULL

);

DROP TABLE IF EXISTS `CategoryQuestion`;
CREATE TABLE IF NOT EXISTS `CategoryQuestion`(
	CategoryID			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY ,
	CategoryName		VARCHAR(50) UNIQUE NOT NULL
);

DROP TABLE IF EXISTS `Question`;
CREATE TABLE IF NOT EXISTS `Question`(
	QuestionID			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Content				VARCHAR(50),
    CategoryID			TINYINT UNSIGNED ,
    TypeID				TINYINT UNSIGNED ,
    CreatorID			TINYINT UNSIGNED,
    CreateDate			DATETIME DEFAULT NOW(),
	
    -- TAO RANG BUOC
    CONSTRAINT fk_cate_id FOREIGN KEY(CategoryID) REFERENCES `CategoryQuestion`(CategoryID) ON DELETE SET NULL ON UPDATE CASCADE,
	CONSTRAINT fk_tp_id FOREIGN KEY(TypeID) REFERENCES `TypeQuestion`(TypeID) ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT lk_1 FOREIGN KEY (CreatorID) REFERENCES `Account`(AccountID) ON DELETE SET NULL ON UPDATE CASCADE
);

DROP TABLE IF EXISTS `Answer`;
CREATE TABLE IF NOT EXISTS `Answer`(
	AnswerID 			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Content				VARCHAR(50),
    QuestionID			TINYINT UNSIGNED UNIQUE KEY,
    isCorrect			BOOLEAN DEFAULT TRUE,
	
    -- TAO RANG BUOC
    CONSTRAINT fk_ques_id FOREIGN KEY (QuestionID) REFERENCES `Question`(QuestionID) ON DELETE SET NULL ON UPDATE CASCADE
);

DROP TABLE IF EXISTS `Exam`;
CREATE TABLE IF NOT EXISTS `Exam`(
	ExamID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `Code`   			VARCHAR(30) UNIQUE KEY,
    Title				VARCHAR(50) NOT NULL,
    CategoryID			TINYINT UNSIGNED ,
    Duration			ENUM('60','15','120') DEFAULT '15',
    CreatorID			TINYINT UNSIGNED,
    CreateDate			DATETIME DEFAULT NOW(),
    
    -- TAO RANG BUOC
    CONSTRAINT fk_cago_id FOREIGN KEY (CategoryID) REFERENCES `Question`(CategoryID),
    CONSTRAINT lk_2 FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountID)
);

DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE IF NOT EXISTS ExamQuestion (
   ExamID			TINYINT UNSIGNED  ,
   QuestionID		TINYINT UNSIGNED,
   
   -- TAO RANG BUOC
	CONSTRAINT lk_3	FOREIGN KEY (QuestionID) REFERENCES `Question`(QuestionID),
	CONSTRAINT lk_4	FOREIGN KEY (ExamID) REFERENCES `Exam`(ExamID)

);

##Sua lai ten cot 
-- ALTER TABLE `Exam` CHANGE COLUMN Tile Title VARCHAR(50) NOT NULL ; 
-- (không CẦN DÙNG nữa ạ)


-- ****  INSERT INTO 

INSERT INTO `Department`(DepartmentName)
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
						

SELECT * FROM `Department`; 
##select * from Department where DepartmentID=10;

INSERT INTO `Position`(PositionName)
VALUES					('Dev'),
						('Test'),
                        ('Scrum Master'),
                        ('PM');
                      
SELECT * FROM `Position`;

INSERT INTO `Account`(Email,Username,FullName,DepartmentID,PositionID,CreateDate)
VALUES					('VUTHITHAO@gmail.com','VUTHAO','VUTHITHAO',1,2,'2020/10/5'),
						('NGUYENPHUONGANH@gmail.com','NGUYENANH','NGUYENPHUONGANH',2,4,'2019/5/7'),
                        ('TRANTHUHUE@gmail.com','TRANHUE','TRANTHUHUE',4,3,'2020/8/1'),
                        ('TRANPHIHUNG@gmail.com','TRANHUNG','TRANPHIHUNG',3,3,'2019/4/30'),
                        ('LEANHNGOC@gmail.com','LENGOC','LEANHNGOC',3,1,'2020/10/5'),
                        ('PHAMDUCTHANH@gmail.com','PHAMTHANH','PHAMDUCTHANH',1,3,'2019/8/10'),
                        ('TRANVANSON@gmail.com','TRANSON','TRANVANSON',2,4,'2019/2/10'),
                        ('HAMANHTU@gmail.com','HATU','HAMANHTU',4,1,'2020/9/5'),
                        ('PHAMCONGSON@gmail.com','PHAMSON','PHAMCONGSON',3,2,'2019/1/1'),
                        ('DAOVANTHE@gmail.com','DAOTHE','DAOVANTHE',3,1,'2019/10/10');
                        
SELECT * FROM  `Account`;


INSERT INTO `Group`(GroupName,CreatorID,CreateDate)
VALUES              ('SBB11',2,'2019/10/8'),
					('SBB22',3,'2018/1/29'),
                    ('SBB33',4,'2019/1/2'),
                    ('SBB44',1,'2020/12/8'),
                    ('SBB55',5,'2020/5/5'),
                    ('SBB66',6,'2020/12/8'),
                    ('SBB77',7,'2018/3/15'),
                    ('SBB88',8,'2019/10/3'),
                    ('SBB99',10,'2020/9/8'),
                    ('SBB00','9','2021/11/27');
 
SELECT * FROM   `Group`;                 
 
 
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
   
SELECT * FROM `GroupAccount`;

INSERT INTO `TypeQuestion`(TypeName)
VALUES					('Essay'),
						('Multiple-Choice');
                       
 
SELECT * FROM `TypeQuestion`;
 
INSERT INTO `CategoryQuestion`(CategoryName)
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

SELECT * FROM `CategoryQuestion`;
 
INSERT INTO `Question`(Content,CategoryID,TypeID,CreatorID,CreateDate)
VALUES                 ('hỏi java','1','1','5','2019/12/8'),
						('hỏi net','7','2','4','2019/11/10'),
                        ('hỏi mysql','6','2','5','2018/4/7'),
                        ('hỏi postman','10','1','8','2020/1/10'),
                        ('hỏi ruby','9','1','4','2018/3/3'),
                        ('hỏi OXY','5','2','7','2019/3/28'),
                        ('hỏi bigC','1','1','4','2019/7/8'),
                        ('hỏi SONY','5','1','9','2018/7/6'),
                        ('hỏi AB','3','2','3','2018/4/2'),
						('hỏi CD','2','1','4','2020/10/8');
SELECT * FROM `Question`;

INSERT INTO `Answer`(Content,QuestionID)
VALUES			  ('METMOI','5'),
				  ('OMCHAY','3'),
                  ('QUYNGANH','8'),
                  ('THANH','9'),
                  ('GIAOVIEN','7'),
                  ('THANH','4'),
                  ('HELLO','1'),
                  ('HEHE','10'),
                  ('METMOI','2'),
                  ('HEHE','6');
SELECT * FROM Answer;

##Sua lai ten cot 
-- ALTER TABLE `Exam` CHANGE COLUMN Tile Title VARCHAR(50) NOT NULL ;
-- (không CẦN DÙNG nữa ạ)

INSERT INTO `Exam`(`Code`,Title,CategoryID,Duration,CreatorID,CreateDate)
VALUES			('AACC1','HOCBAI11',1,'60','2','2020/10/2'),
				('AACC2','HOCBAI22',10,'120','4','2019/8/7'),
                ('AACC3','HOCBAI11',7,'15','1','2018/12/8'),
                ('AACC4','HOCBAI33',6,'60','7','2019/4/8'),
                ('AACC5','HOCBAI44',9,'15','7','2020/1/8'),
                ('AACC6','HOCBAI55',5,'15','4','2018/11/10'),
                ('AACC7','HOCBAI77',1,'120','9','2019/2/8'),
                ('AACC8','HOCBAI77',5,'15','8','2019/5/5'),
                ('AACC9','HOCBAI33',2,'15','5','2019/1/8'),
                ('AACC10','HOCBAI44',3,'60','5','2020/1/2');


SELECT * FROM `Exam`;

INSERT INTO `ExamQuestion`(ExamID,QuestionID)
VALUES 					('1','1'),
						('2','2'),
                        ('3','7'),
                        ('4','4'),
                        ('5','5'),
                        ('6','7'),
                        ('7','7'),
                        ('8','8'),
                        ('9','9'),
                        ('10','1');
SELECT * FROM `ExamQuestion`;

