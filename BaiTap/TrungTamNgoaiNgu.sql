-- ĐẬP ĐI XÂY LẠI
DROP DATABASE IF EXISTS QuanLyTrungTamNgoaiNgu;
CREATE DATABASE QuanLyTrungTamNgoaiNgu;
USE QuanLyTrungTamNgoaiNgu;

-- ==========================================
-- 1. NHÓM BẢNG CHA
-- ==========================================

CREATE TABLE ADDRESSES (
    addressID VARCHAR(10) PRIMARY KEY,
    addressname VARCHAR(50) NOT NULL
);

CREATE TABLE COURSES (
    courseID VARCHAR(10) PRIMARY KEY,
    coursename VARCHAR(50) NOT NULL,
    level VARCHAR(50),
    duration INT,
    tuitionfee DECIMAL(12,0)
);

CREATE TABLE TEACHERS (
    teacherID VARCHAR(10) PRIMARY KEY,
    teacherName VARCHAR(50) NOT NULL,
    specialization VARCHAR(50)
);

-- ==========================================
-- 2. NHÓM BẢNG CON CẤP 1
-- ==========================================

CREATE TABLE STUDENTS (
    studentID VARCHAR(10) PRIMARY KEY,
    studentName VARCHAR(50) NOT NULL,
    DateOfBirth DATE,
    Gender CHAR(1),
    addressID VARCHAR(10),
    FOREIGN KEY (addressID) REFERENCES ADDRESSES(addressID)
);

CREATE TABLE CLASSES (
    classID VARCHAR(10) PRIMARY KEY,
    courseID VARCHAR(10),
    room VARCHAR(50),
    startDate DATE,
    endDate DATE,
    FOREIGN KEY (courseID) REFERENCES COURSES(courseID)
);

-- ==========================================
-- 3. NHÓM BẢNG CHI TIẾT & TRUNG GIAN
-- ==========================================

-- Đăng ký học
CREATE TABLE ENROLLMENTS (
    enrollmentID VARCHAR(10) PRIMARY KEY,
    studentID VARCHAR(10),
    classID VARCHAR(10),
    enrollmentdate DATE,
    FOREIGN KEY (studentID) REFERENCES STUDENTS(studentID),
    FOREIGN KEY (classID) REFERENCES CLASSES(classID)
);

-- Thanh toán (đúng chính tả trong ảnh của bạn là PLAYMENTS)
CREATE TABLE PLAYMENTS (
    paymentID VARCHAR(10) PRIMARY KEY,
    enrollmentID VARCHAR(10),
    paymentDate DATE,
    amount DECIMAL(12,0),
    FOREIGN KEY (enrollmentID) REFERENCES ENROLLMENTS(enrollmentID)
);

-- Phân công giáo viên
CREATE TABLE CLASS_TEACHERS (
    teacherID VARCHAR(10),
    classID VARCHAR(10),
    PRIMARY KEY (teacherID, classID),
    FOREIGN KEY (teacherID) REFERENCES TEACHERS(teacherID),
    FOREIGN KEY (classID) REFERENCES CLASSES(classID)
);

-- Email sinh viên
CREATE TABLE STUDENT_EMAILS (
    emailID INT AUTO_INCREMENT PRIMARY KEY,
    studentID VARCHAR(10),
    email VARCHAR(50),
    FOREIGN KEY (studentID) REFERENCES STUDENTS(studentID)
);

-- Điện thoại sinh viên
CREATE TABLE STUDENT_PHONES (
    phoneID INT AUTO_INCREMENT PRIMARY KEY,
    studentID VARCHAR(10),
    phone VARCHAR(15), -- Trong Excel ghi là Phone, trong ERD ghi là phonenumber
    FOREIGN KEY (studentID) REFERENCES STUDENTS(studentID)
);

-- Điện thoại giáo viên
CREATE TABLE TEACHER_PHONES (
    phoneID INT AUTO_INCREMENT PRIMARY KEY,
    teacherID VARCHAR(10),
    phonenumber VARCHAR(15),
    FOREIGN KEY (teacherID) REFERENCES TEACHERS(teacherID)
);

-- Địa chỉ
INSERT INTO ADDRESSES (addressID, addressname) VALUES 
('A01', 'Da Nang'),
('A02', 'Hue'),
('A03', 'Quang Nam');

-- Khóa học
INSERT INTO COURSES (courseID, coursename, level, duration, tuitionfee) VALUES 
('C01', 'IELTS Foundation', 'Basic', 3, 8000000),
('C02', 'TOEIC Intensive', 'Intermediate', 2, 6000000),
('C03', 'English Communication', 'Basic', 4, 7000000);

-- Giáo viên
INSERT INTO TEACHERS (teacherID, teacherName, specialization) VALUES 
('T01', 'Tran Thi Mai', 'IELTS'),
('T02', 'Nguyen Hoang Nam', 'TOEIC'),
('T03', 'Le Thanh Ha', 'Communication');

-- Sinh viên
INSERT INTO STUDENTS (studentID, studentName, DateOfBirth, Gender, addressID) VALUES 
('S01', 'Nguyen Van A', '2002-03-10', 'M', 'A01'),
('S02', 'Le Thi B', '2001-07-21', 'F', 'A01'),
('S03', 'Pham Van C', '2003-11-02', 'M', 'A02'),
('S04', 'Do Thi D', '2002-05-18', 'F', 'A03'),
('S05', 'Hoang Van E', '2000-09-09', 'M', 'A01'),
('S06', 'Nguyen Thi F', '2004-01-12', 'F', 'A02'),
('S07', 'Tran Van G', '2001-04-30', 'M', 'A01'),
('S08', 'Phan Thi H', '2003-06-06', 'F', 'A03');

-- Lớp học (Dựa trên CourseID)
INSERT INTO CLASSES (classID, courseID, room, startDate, endDate) VALUES 
('CL01', 'C01', 'R101', '2026-01-10', '2026-04-10'),
('CL02', 'C02', 'R102', '2026-02-01', '2026-04-01'),
('CL03', 'C03', 'R103', '2026-03-01', '2026-07-01');

-- Đăng ký học (Enrollments)
INSERT INTO ENROLLMENTS (enrollmentID, studentID, classID, enrollmentdate) VALUES 
('E01', 'S01', 'CL01', '2025-12-20'),
('E02', 'S02', 'CL01', '2025-12-22'),
('E03', 'S03', 'CL02', '2026-01-15');

-- Thanh toán (Dựa trên EnrollmentID)
INSERT INTO PLAYMENTS (paymentID, enrollmentID, paymentDate, amount) VALUES 
('P01', 'E01', '2025-12-20', 4000000),
('P02', 'E01', '2026-01-20', 4000000),
('P03', 'E02', '2025-12-22', 8000000);

-- Email sinh viên
INSERT INTO STUDENT_EMAILS (studentID, email) VALUES 
('S01', 'a@gmail.com'),
('S02', 'b@gmail.com'),
('S02', 'b2@gmail.com');

-- Số điện thoại sinh viên
INSERT INTO STUDENT_PHONES (studentID, phone) VALUES 
('S01', '888888888'),
('S01', '777777777'),
('S02', '909000002'),
('S03', '909000003'),
('S04', '909000004'),
('S05', '909000005'),
('S06', '909000006'),
('S07', '909000007'),
('S08', '909000002');

-- Số điện thoại giáo viên
INSERT INTO TEACHER_PHONES (teacherID, phonenumber) VALUES 
('T01', '988000001'),
('T02', '988110000'),
('T03', '988000003');

-- Phân công giáo viên vào lớp
INSERT INTO CLASS_TEACHERS (teacherID, classID) VALUES 
('T01', 'CL01'),
('T02', 'CL02'),
('T03', 'CL03');

