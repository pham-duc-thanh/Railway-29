USE `Testing_System_1`;

/*Question 1: Tạo store để người dùng nhập vào tên phòng ban và in ra tất cả các 
 account thuộc phòng ban đó*/
 
 
DROP PROCEDURE IF EXISTS getAccountByDepartmentName;

DELIMITER $$
	CREATE PROCEDURE getAccountByDepartmentName(IN inDepartmentName VARCHAR(100))
    BEGIN
			
            SELECT A.*, D.DepartmentName FROM Department D 
            INNER JOIN `Account` A
            ON D.DepartmentID = A.DepartmentID
            WHERE D.DepartmentName = inDepartmentName;
            
		
            
	END $$ 
DELIMITER ;

CALL getAccountByDepartmentName('Sale');

#2)Question 2: Tạo store để in ra số lượng account trong mỗi group

DROP PROCEDURE IF EXISTS getAccountByGroup;

DELIMITER $$
	CREATE PROCEDURE getAccountByGroup()
    BEGIN
			
            	SELECT G.GroupID,GroupName,COUNT(GA.GroupID) AS `so_luong` FROM GroupAccount GA 
				RIGHT JOIN `Group` G
				ON G.GroupID=GA.GroupID
				GROUP BY G.GroupID;
            
		
            
	END $$ 
DELIMITER ;

CALL getAccountByGroup();

/*#3)Question 3: Tạo store để thống kê mỗi type question có bao nhiêu question được tạo 
 trong tháng hiện tại*/


DROP PROCEDURE IF EXISTS getTypeQuestionAllQuestion;
DELIMITER $$
CREATE PROCEDURE getTypeQuestionAllQuestion()
BEGIN
	SELECT TQ.*,count(Q.QuestionID) AS `Tatol` FROM TypeQuestion TQ 
    LEFT JOIN Question Q 
    ON TQ.TypeID=Q.TypeID
    WHERE Month(Q.CreateDate) = month(now()) AND Year(Q.CreateDate) = Year(now()) 
	GROUP BY TQ.TypeID;
END$$
DELIMITER ;

CALL getTypeQuestionAllQuestion();

#4)Question 4: Tạo store để trả ra id của type question có nhiều câu hỏi nhất

DROP PROCEDURE IF EXISTS getTypeQuestionIDAllQuestion1;
DELIMITER $$
CREATE PROCEDURE getTypeQuestionIDAllQuestion1(OUT out_typeid TINYINT)
BEGIN
	SELECT TQ.*,count(Q.QuestionID) AS `Tatol` FROM TypeQuestion TQ 
    JOIN Question Q 
    ON TQ.TypeID=Q.TypeID
	GROUP BY TQ.TypeID
    HAVING COUNT(Q.QuestionID) = (SELECT count(Q.QuestionID) AS `Tatol`
    FROM TypeQuestion TQ 
    JOIN Question Q 
    ON TQ.TypeID=Q.TypeID
	GROUP BY TQ.TypeID 
    ORDER BY `Tatol` DESC LIMIT 1);
END$$
DELIMITER ;

SET @typeid = 0;
CALL getTypeQuestionIDAllQuestion1(@typeid);
SELECT @typeid;

#5)Question 5: Sử dụng store ở question 4 để tìm ra tên của type question 

DROP PROCEDURE IF EXISTS getTypeQuestionIByQuestion789;
DELIMITER $$
CREATE PROCEDURE getTypeQuestionIByQuestion789()
BEGIN
	SELECT TQ.*,count(Q.QuestionID) AS `Tatol` FROM TypeQuestion TQ 
    JOIN Question Q 
    ON TQ.TypeID=Q.TypeID
	GROUP BY TQ.TypeID
    HAVING COUNT(Q.QuestionID) = (SELECT count(Q.QuestionID) AS `Tatol`
    FROM TypeQuestion TQ 
    JOIN Question Q 
    ON TQ.TypeID=Q.TypeID
	GROUP BY TQ.TypeID 
    ORDER BY `Tatol` DESC LIMIT 1);
END$$
DELIMITER ;


CALL getTypeQuestionIByQuestion789();





/*#6)Question 6: Viết 1 store cho phép người dùng nhập vào 1 chuỗi và IN RA group có tên 
 chứa chuỗi của người dùng nhập vào hoặc IN RA user có username chứa 
 chuỗi của người dùng nhập vào*/

DROP PROCEDURE getGroupIDOrAccountID;
DELIMITER $$
	CREATE PROCEDURE getGroupIDOrAccountID(IN n VARCHAR(50))
    BEGIN
		DECLARE idG, idA INT;
        SELECT GroupID INTO idG FROM `Group` WHERE GroupName = n;
        IF(idG IS NOT NULL)
			THEN SELECT * FROM `Group` WHERE GroupID = idG;
		END IF;
		SELECT AccountID INTO idA FROM `Account` WHERE UserName = n;
        IF(idA IS NOT NULL)
			THEN SELECT * FROM `Account` WHERE AccountID = idA;
		END IF;
    END $$
DELIMITER ;

CALL getGroupIDOrAccountID();


 /*Question 7: Viết 1 store cho phép người dùng nhập vào thông tin fullName, email và 
 trong store sẽ tự động gán:
username sẽ giống email nhưng bỏ phần @..mail đi
positionID: sẽ có default là developer
departmentID: sẽ được cho vào 1 phòng chờ
 Sau đó in ra kết quả tạo thành công*/
 
 DROP PROCEDURE IF EXISTS getInformationAccount;
DELIMITER $$
CREATE PROCEDURE getInformationAccount( IN in_Email VARCHAR(100),IN in_Fullname VARCHAR(50))

BEGIN
	DECLARE v_Username VARCHAR(50) DEFAULT SUBSTRING_INDEX(in_Email, '', 3);
	DECLARE idDepartmentID TINYINT UNSIGNED ;
	DECLARE idPositionID TINYINT UNSIGNED DEFAULT 1;
	DECLARE v_CreateDate DATETIME DEFAULT now();
    
	INSERT INTO `account` (Email, Username, FullName,
	DepartmentID, PositionID, CreateDate)
	VALUES (in_Email, v_Username, in_Fullname,
	idDepartmentID, idPositionID, v_CreateDate);
END$$
DELIMITER ;
Call getInformationAccount('thanhdeptrai.com','thanh duc pham');
 
/*Question 8: Viết 1 store cho phép người dùng nhập vào Essay hoặc Multiple-Choice
 để thống kê câu hỏi essay hoặc multiple-choice nào có content dài nhất*/


 
/*Question 9: Viết 1 store cho phép người dùng xóa exam dựa vào ID*/

DROP PROCEDURE IF EXISTS getDeleteExam;
DELIMITER $$
CREATE PROCEDURE getDeleteExam(IN in_examid TINYINT UNSIGNED)
	BEGIN
		DELETE FROM ExamQuestion WHERE ExamID = in_examid;
		DELETE FROM Exam WHERE ExamID = in_examid;
	END$$
DELIMITER ;
CALL getDeleteExam(5);

/*Question 10: Tìm ra các exam được tạo từ 3 năm trước và xóa các exam đó đi (sử 
 dụng store ở câu 9 để xóa)
 Sau đó in số lượng record đã remove từ các table liên quan trong khi 
 removing*/
 
 
/*Question 11: Viết store cho phép người dùng xóa phòng ban bằng cách người dùng 
 nhập vào tên phòng ban và các account thuộc phòng ban đó sẽ được 
 chuyển về phòng ban default là phòng ban chờ việc 
 id1 -> lưu id của phòng mà mình nhập tên
id2 -> lưu id của phòng chờ
update account có departmentID = id1 => chuyển thành departmentId = id2
xoa department có departmentId = id1*/

DROP PROCEDURE IF EXISTS getAccountByName;
DELIMITER $$
	CREATE PROCEDURE getAccountByName(IN in_DepartmentName VARCHAR(50))
	BEGIN
		DECLARE idDepartmentID VARCHAR(100) ;
		SELECT D.DepartmentID INTO idDepartmentID FROM Department D WHERE D.DepartmentName
		= in_DepartmentName;
		UPDATE `Account` A SET A.DepartmentID = '12' WHERE A.DepartmentID = idDepartmentID;
		DELETE FROM Department D WHERE D.DepartmentName = in_DepartmentName;
	END$$
DELIMITER ;
Call getAccountByName('hành chính');
 
 
/*Question 12: Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong năm 
 nay*/

