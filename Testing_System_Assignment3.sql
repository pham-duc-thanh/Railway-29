USE `Testing_system`;

-- Exercise 1: Tiếp tục với Database Testing System
#1) Question 1: Thêm ít nhất 10 record vào mỗi table
/*
E đã thêm 10 bản ghi ở bài 2 rồi ạ
*/
#2) Question 2: lấy ra tất cả các phòng ban
SELECT * FROM `Department`;

#3) Question 3: lấy ra id của phòng ban "Sale"
SELECT * FROM `Department`
WHERE DepartmentName="Sale";

#4) Question 4: lấy ra thông tin account có full name dài nhất
-- CÁCH 1 
SELECT AccountID,FullName, character_length(FullName) FROM `Account`FullName;
SELECT  AccountID,FullName,character_length(FullName) AS `so_luong` FROM  `Account` ORDER BY `so_luong` DESC ;


SELECT character_length(FullName) AS 'so_luong' 
FROM  `Account` 
ORDER BY 'so_luong' 
DESC LIMIT 1;

SELECT AccountID,FullName, character_length(FullName) AS `SL` FROM `Account`
WHERE character_length(FullName)=
(SELECT character_length(FullName) AS `so_luong` FROM  `Account` ORDER BY `so_luong` DESC LIMIT 1); 

-- CÁCH 2 

#5)Question 5: Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id= 3
SELECT AccountID,FullName,DepartmentID, character_length(FullName) AS `SL` FROM `Account`
WHERE character_length(FullName)=
((SELECT character_length(FullName) AS `so_luong` FROM  `Account` ORDER BY `so_luong` DESC LIMIT 1)
AND DepartmentID=3) ; 

#6)Question 6: Lấy ra tên group đã tham gia trước ngày 20/12/2019

SELECT GroupName
FROM `Group`
WHERE  CreateDate <'2019/12/20';

#7)Question 7: Lấy ra ID của question có >= 4 câu trả lời
SELECT * FROM `Answer` ORDER BY QuestionID;
SELECT QuestionID,count(*) AS `so_luong` FROM `Answer` GROUP BY (QuestionID)
HAVING COUNT(*)>=4;

/*#8)Question 8:Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày 
 20/12/2019*/
SELECT `Code`
FROM `Exam`
WHERE Duration>='60' AND  CreateDate <'2019/12/20';

#9)Question 9: Lấy ra 5 group được tạo gần đây nhất
SELECT GroupName 
FROM `group`
ORDER BY CreateDate DESC LIMIT 5;

#10)Question 10: Đếm số nhân viên thuộc department có id = 2
--- C1; e thấy không đúng lắm lấy ra 3 hàng
SELECT DepartmentID,FullName,count(*) AS `so_luong` FROM `Account` GROUP BY (DepartmentID)
HAVING COUNT(*)=2;
-- C2
SELECT DepartmentID,COUNT(AccountID) AS 'SL'
FROM `Account`
WHERE DepartmentID=2;

#11)Question 11: Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o"
SELECT FullName
FROM `Account`
WHERE FullName LIKE 'P%H';

#12)Question 12: Xóa tất cả các exam được tạo trước ngày 20/12/2019
DELETE 
FROM `Exam`
WHERE CreateDate <'2019/12/20';
/*Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.
E k pit lí do là gì ạ*/

#13)Question 13: Xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi"
SELECT * FROM `Question`;

DELETE 
FROM `Question`
WHERE Content IN('hỏi CD');
/*vẫn sai giông câu 12 ạ*/

/*#14)Question 14: Update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" và 
 email thành loc.nguyenba@vti.com.vn*/
UPDATE `Account`
SET AccountID=5
WHERE FullName="Nguyễn Bá Lộc" AND Email="loc.nguyenba@vti.com.vn";
 



