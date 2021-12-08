USE `Testing_system`;

#1)Question 1: Tạo view có chứa danh sách nhân viên thuộc phòng ban sale
--- VIEW 

CREATE VIEW v_sale AS
    SELECT 
        A.Email, A.Username, A.FullName, D.DepartmentName
    FROM
        `Account` A
            INNER JOIN
        `Department` D ON A.DepartmentID = D.DepartmentID
    WHERE
        DepartmentName = 'Sale';
        
SELECT * FROM v_sale;

--- CTE

WITH CTE_SALE AS 
  (SELECT 
        A.Email, A.Username, A.FullName, D.DepartmentName
    FROM
        `Account` A
            INNER JOIN
        `Department` D ON A.DepartmentID = D.DepartmentID
    WHERE
        DepartmentName = 'Sale')

SELECT * FROM CTE_SALE;

#2)Question 2: Tạo view có chứa thông tin các account tham gia vào nhiều group nhất
DROP VIEW IF EXISTS v_max;

CREATE VIEW v_max AS
SELECT Email,Username,FullName ,COUNT(A.AccountID) AS `total` 
FROM `Account` A
INNER JOIN GroupAccount GA
ON A.AccountID=GA.AccountID
GROUP BY A.AccountID
HAVING COUNT(A.AccountID)=(SELECT 
        COUNT(A.AccountID) AS `total`
    FROM
        `Account` A
    GROUP BY A.AccountID
    ORDER BY 	`total` DESC
    LIMIT 1);
SELECT * FROM     v_max;
    
/*#3)Question 3: Tạo view có chứa câu hỏi có những content quá dài (content quá 300 từ 
 được coi là quá dài) và xóa nó đi*/
 -- tạo VIEW
 DROP VIEW IF EXISTS v_content;
 CREATE VIEW v_content AS
  SELECT * FROM Question
  WHERE length(content) > 50;
  
SELECT * FROM v_content;

-- XÓA VIEW 
DELETE FROM v_content;

#4)Question 4: Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất

DROP VIEW IF EXISTS v_maxnv;
CREATE VIEW v_maxnv AS 
	SELECT Email,Username,FullName,D.DepartMentName ,COUNT(A.DepartmentID) AS `total` 
	FROM `Account` A
	INNER JOIN Department D 
	ON A.DepartmentID=D.DepartmentID
	GROUP BY A.DepartmentID
	HAVING COUNT(A.DepartmentID)=(SELECT 
			COUNT(A.DepartmentID) AS `total`
		FROM
			`Account` A
		GROUP BY A.DepartmentID
		ORDER BY 	`total` DESC
		LIMIT 1);
        
SELECT * FROM v_maxnv;

#5)Question 5: Tạo view có chứa tất các các câu hỏi do user họ TRAN  tạo
/*SELECT * FROM `Account`;
SELECT * FROM `Question`;*/


DROP VIEW IF EXISTS v_TRANtao;
CREATE VIEW v_TRANtao AS
	SELECT A.Username,A.FullName,Q.Content FROM 
	`Account` A
	JOIN Question Q 
	ON A.AccountID=Q.CreatorID
	WHERE A.FullName LIKE 'TRAN%';
    
SELECT * FROM v_TRANtao;

-- 