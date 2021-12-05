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


/*E làm chưa  xong ạ*
