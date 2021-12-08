USE `Testing_system`;

#1)Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ
SELECT 
    D.*, A.*
FROM
    `Department` D
        JOIN
    `Account` A ON D.DepartmentID = A.DepartmentID;

#2)Question 2: Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010
SELECT 
    AccountID, FullName
FROM
    `Account`
WHERE
    CreateDate > '2019/12/20';

#3)Question 3: Viết lệnh để lấy ra tất cả các developer
SELECT 
    A.Email, A.FullName, A.Username, PositionName
FROM
    `Account` A
        INNER JOIN
    Position P ON A.PositionID = P.PositionID
WHERE
    PositionName = 'Dev';

#4)Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên
SELECT D.* ,COUNT(*) AS 'so_luong' 
FROM `Account` A 
JOIN Department D ON A.DepartmentID=D.DepartmentID 
GROUP BY DepartmentID 
HAVING 'so_luong'>3;

/*#5)Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều 
 nhất*/
/*SELECT * FROM Question;
SELECT * FROM ExamQuestion;

SELECT QuestionID, COUNT(QuestionID) AS 'Total' 
FROM ExamQuestion
GROUP BY QuestionID
ORDER BY 'Total' DESC LIMIT 1;
*/

SELECT 
    EQ.QuestionID, Q.Content, COUNT(Q.QuestionID) AS 'so_luong'
FROM
    ExamQuestion EQ
        INNER JOIN
    Question Q ON Q.QuestionID = EQ.QuestionID
GROUP BY EQ.QuestionID
HAVING COUNT(EQ.QuestionID) = (SELECT 
        MAX(countQuestion) AS maxcountQuestion
    FROM
        (SELECT 
            COUNT(EQ.QuestionID) AS countQuestion
        FROM
            ExamQuestion EQ
        GROUP BY EQ.QuestionID) AS countTable);
        
 
 /*- vế trước từ group by trở lên:thì lọc ra số lương được sử dụng
 - vế HAVING thì tìm ra số lượng nhiều nhất
 */


#6)Question 6: Thông kê mỗi category Question được sử dụng trong bao nhiêu Question
 -- Cách 1
SELECT 
    CA.CategoryID, CA.CategoryName, COUNT(*) AS 'SO_LUONG'
FROM
    `CategoryQuestion` CA
        LEFT JOIN
    `question` Q ON CA.CategoryID = Q.CategoryID
GROUP BY CategoryID
ORDER BY CategoryID;

-- cách 2 dùng UNION 
(SELECT 
    CQ.CategoryID, CQ.CategoryName, COUNT(*) AS `SL`
FROM
    CategoryQuestion CQ
        JOIN
    Question Q USING (CategoryID)
GROUP BY CategoryID) UNION (SELECT 
    CategoryID, CategoryName, '0'
FROM
    CategoryQuestion
WHERE
    CategoryID NOT IN (SELECT DISTINCT
            CategoryID
        FROM
            Question));

#7)Question 7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam
SELECT 
    Q.QuestionID,
    Q.Content,
    Q.CategoryID,
    COUNT(EQ.QuestionID) AS 'so_luong'
FROM
    Question Q
        LEFT JOIN
    ExamQuestion EQ ON Q.QuestionID = EQ.QuestionID
GROUP BY QuestionID;

#8)Question 8: Lấy ra Question có nhiều câu trả lời nhất
SELECT 
    A.QuestionID, Q.Content, COUNT(Q.QuestionID) AS 'so_luong'
FROM
    Answer A
        INNER JOIN
    Question Q ON Q.QuestionID = A.QuestionID
GROUP BY A.QuestionID
HAVING COUNT(A.QuestionID) = (SELECT 
        MAX(countQuestion) AS maxcountQuestion
    FROM
        (SELECT 
            COUNT(A.QuestionID) AS countQuestion
        FROM
            ExamQuestion EQ
        GROUP BY A.QuestionID) AS countTable);

#9)Question 9: Thống kê số lượng account trong mỗi group
SELECT 
    G.GroupID, G.GroupName, COUNT(GA.AccountID) AS 'so_luong'
FROM
    GroupAccount GA
        JOIN
    `Group` G ON G.GroupID = GA.GroupID
GROUP BY G.GroupID
ORDER BY G.GroupID ASC;

#10)Question 10: Tìm chức vụ có ít người nhất
SELECT 
    P.PositionID,
    P.PositionName,
    A.FullName,
    COUNT(A.PositionID) AS 'so_luong'
FROM
    `Account` A
        INNER JOIN
    `Position` P ON P.PositionID = A.PositionID
GROUP BY A.PositionID
HAVING COUNT(A.PositionID) = (SELECT 
        MIN(countPosition) AS mincountPosition
    FROM
        (SELECT 
            COUNT(A.PositionID) AS countPosition
        FROM
            `Account` A
        GROUP BY A.PositionID) AS countTable);
        
#11)Question 11: Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM

SELECT 
    DP.DepartmentID,
    DP.PositionID,
    DP.DepartmentName,
    DP.PositionName,
    COUNT(AccountID) AS `Total`
FROM
    (SELECT 
        *
    FROM
        Department
    CROSS JOIN Position) DP
        LEFT JOIN
    `Account` A ON DP.DepartmentID = A.DepartmentID
        AND DP.PositionID = A.PositionID
GROUP BY DP.DepartmentID , DP.PositionID
ORDER BY DP.DepartmentID , DP.PositionID;


/*#12)Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của 
 question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, …*/

SELECT 
    Q.QuestionID, Q.Content, TQ.TypeName, A.FullName, AN.Content
FROM
    Question Q
        JOIN
    `Account` A ON Q.CreatorID = A.AccountID
        JOIN
    TypeQuestion TQ ON Q.TypeID = TQ.TypeID
        JOIN
    Answer AN ON Q.QuestionID = AN.QuestionID
        JOIN
    CategoryQuestion CQ ON Q.CategoryID = CQ.CategoryID
ORDER BY Q.QuestionID;

#13)Question 13: Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm

SELECT * FROM TypeQuestion;
SELECT * FROM Question;

SELECT TQ.*,Q.Content,count(Q.TypeID) AS 'Tatol'
FROM Question Q
JOIN TypeQuestion TQ 
ON Q.TypeID=TQ.TypeID
GROUP BY Q.TypeID;

#14)Question 14:Lấy ra group không có account nào
-- cach 1
SELECT 
    *
FROM
    `Group` G
        LEFT JOIN
    GroupAccount GA ON G.GroupID = GA.GroupID
WHERE
    GA.AccountID IS NULL;
    
-- cach 2
SELECT 
    *
FROM
    `Group`
WHERE
    GroupID NOT IN (SELECT 
            GroupID
        FROM
            GroupAccount);
            
#16)Question 16: Lấy ra question không có answer nào
-- cach 1
SELECT 
    A.QuestionID
FROM
    Answer A
        RIGHT JOIN
    Question q ON A.QuestionID = Q.QuestionID
WHERE
    A.QuestionID IS NULL;
    
-- cach 2

SELECT 
    *
FROM
    Question
WHERE
    QuestionID NOT IN (SELECT 
            QuestionID
        FROM
            Answer);
		
/*Exercise 2: Union*/
#17)Question 17:

-- a) Lấy các account thuộc nhóm thứ 1
SELECT * FROM `Account`;

SELECT * FROM `GroupAccount`;

SELECT A.Username,A.FullName FROM `Account` A
JOIN GroupAccount GA
USING(AccountID)
WHERE GA.GroupID=1;

-- b) Lấy các account thuộc nhóm thứ 2

SELECT A.Username,A.FullName FROM `Account` A
JOIN GroupAccount GA
USING(AccountID)
WHERE GA.GroupID=2;

-- c) Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau

/*CACH 1*/
SELECT A.Username,A.FullName FROM `Account` A
JOIN GroupAccount GA
USING(AccountID)
WHERE GA.GroupID=1

UNION

SELECT A.Username,A.FullName FROM `Account` A
JOIN GroupAccount GA
USING(AccountID)
WHERE GA.GroupID=2;

/*CACH 2 sử dụng VIEW*/



#18)Question 18: 
-- a) Lấy các group có lớn hơn 5 thành viên
SELECT G.GroupName,G.CreatorID,COUNT(GA.GroupID) AS `tatol`
FROM GroupAccount GA
JOIN `Group` G ON GA.GroupID=G.GroupID
GROUP BY G.GroupID
HAVING `tatol` >5;

-- b) Lấy các group có nhỏ hơn 7 thành viên

SELECT G.GroupName,G.CreatorID,COUNT(GA.GroupID) AS `tatol`
FROM GroupAccount GA
JOIN `Group` G ON GA.GroupID=G.GroupID
GROUP BY G.GroupID
HAVING `tatol` <7;

-- c) Ghép 2 kết quả từ câu a) và câu b)

SELECT G.GroupName,G.CreatorID,COUNT(GA.GroupID) AS `tatol`
FROM GroupAccount GA
JOIN `Group` G ON GA.GroupID=G.GroupID
GROUP BY G.GroupID
HAVING `tatol` >5

UNION

SELECT G.GroupName,G.CreatorID,COUNT(GA.GroupID) AS `tatol`
FROM GroupAccount GA
JOIN `Group` G ON GA.GroupID=G.GroupID
GROUP BY G.GroupID
HAVING `tatol` <7;

/* E LÀM XONG RỒI Ạ*/

