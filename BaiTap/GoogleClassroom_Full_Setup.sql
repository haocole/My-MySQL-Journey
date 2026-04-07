DROP DATABASE IF EXISTS Google_classroomDB;
CREATE DATABASE Google_classroomDB;
USE Google_classroomDB;

-- 1  Tạo bảng user 
create table USERS    (
userID int auto_increment primary key,
username varchar(30)not null );
-- 2  Tạo cái bảng vai trò
create table  ROLES (
roleID INT auto_increment primary key,
rolename varchar(30));


-- 3 tạo bảng class
create table CLASSROOM (
classID int auto_increment primary key,
classname varchar(30)not null );

-- 4 tạo bảng USER CLASS ROLE
create table USER_ClASS  (
userID int not null,
classID int not null,
roleID int not null,
foreign key (userID) references  USERS(userID),
foreign key (classID) references CLASSROOM(classID),
foreign key (roleID) references ROLES(roleID));

-- 5 tạo bảng assignment 
create table ASSIGNMENTS (
assID int auto_increment primary key,
assName varchar(50) not null,
createBy int not null,
foreign key (createBy)  references USERS (userID));

-- 6 tạo bảng ass_class 
create table ASSIGNMENT_CLASS (
assID int not null,
classID int not null,
foreign key (assID) references ASSIGNMENTS (assID),
foreign key (classID) references CLASSROOM(classID),
primary key (classID,assID));

-- 7 tạo bảng comments 
create table COMMENTS   (
commentID int auto_increment primary key,
assID int not null,
userID int not null,
comments varchar(100)not null,
foreign key (assID) references ASSIGNMENTS(assID),
foreign key (userID) references USERS(userID));


INSERT INTO USERS (username) VALUES 
('Hao'), ('Tin'), ('Ydinh'), ('Quynh'), ('Thu');

INSERT INTO ROLES (rolename) VALUES
('Teacher'), ('Student');

INSERT INTO CLASSROOM (classname) VALUES
('Database_ClassA'), ('Python'), ('English'), ('Club English'), ('Database_ClassB');

-- Lưu ý: Phải Insert bảng cha xong mới Insert bảng con được
INSERT INTO USER_ClASS (userID, classID, roleID) VALUES
(1,1,1), (1,2,1), (1,3,1), (2,2,2), (2,3,2), (3,4,1), (4,4,1), (2,1,2), (3,1,2);

INSERT INTO ASSIGNMENTS (assName, createBy) VALUES
('HW SQL', 1), ('HW ENGLISH', 1), ('HW PYTHON', 2); 

INSERT INTO ASSIGNMENT_CLASS (assID, classID) VALUES
(1,1), (1,5), (2,3), (2,4);

INSERT INTO COMMENTS (assID, userID, comments) VALUES
(1,2,'Em chua hieu cau 3'),
(1,3,'Bai nay hay a'),
(2,2,'dealine khi nao a'), 
(3,2,'Em nop bai roi'),
(3,2,'Nop truoc Thu 6');

-- 1. Hiển thị comment của người dùng có UserID là 2
SELECT * FROM COMMENTS 
WHERE userID = 2;

-- 2. Hiển thị thông tin của tất cả các bài tập
SELECT * FROM ASSIGNMENTS;

-- 3. Hiển thị thông tin của những bài tập được tạo bởi người dùng có ID là 1
SELECT * FROM ASSIGNMENTS 
WHERE createBy = 1;

-- 4. Hiển thị thông tin của những lớp học Cơ sở dữ liệu
-- (Dùng LIKE để tìm các lớp có tên chứa chữ 'Database')
SELECT * FROM CLASSROOM 
WHERE classname LIKE '%Database%';

-- 5. Trong cơ sở dữ liệu Google classroom, hiện tại có bao nhiêu lớp học
SELECT COUNT(*) AS TongSoLopHoc FROM CLASSROOM;

-- 6. Hiển thị những bài tập được tạo bởi các giáo viên có ID là 1 hoặc 2
SELECT * FROM ASSIGNMENTS 
WHERE createBy IN (1, 2);

-- 7. Hiển thị những bài tập có tên bắt đầu bằng chữ 'HW'
SELECT * FROM ASSIGNMENTS 
WHERE assName LIKE 'HW%';

-- 8. Hiển thị 5 dòng đầu tiên trong bảng USER_CLASS
-- (Lưu ý: Bạn đặt tên bảng là USER_CLASS chứ không phải USER_CLASS_ROLES như trong đề)
SELECT * FROM USER_CLASS 
LIMIT 5;
-- 9. Cập nhật lại thông tin của tất cả các user trong Bảng Users cho đầy đủ họ tên
-- Ví dụ: Hao => A Lang Hao
UPDATE USERS SET username = 'A Lang Hao' WHERE userID = 1;
UPDATE USERS SET username = 'Le Huu Tin' WHERE userID = 2;
UPDATE USERS SET username = 'Ho Thị Y Dinh' WHERE userID = 3;
UPDATE USERS SET username = 'Ho Thi Quynh' WHERE userID = 4;
UPDATE USERS SET username = 'Le Kha Minh Thu' WHERE userID = 5;














































































-- 10. Xóa thông tin của User có ID là 2
-- LƯU Ý QUAN TRỌNG: Vì UserID 2 đã có comment và tham gia lớp học (khóa ngoại), 
-- bạn nên xóa dữ liệu liên quan ở bảng con trước, hoặc chạy lệnh này:
DELETE FROM COMMENTS WHERE userID = 2;
DELETE FROM USER_CLASS WHERE userID = 2;
DELETE FROM USERS WHERE userID = 2;
select * from USERS;