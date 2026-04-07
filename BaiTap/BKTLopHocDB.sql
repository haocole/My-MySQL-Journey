-- 1. PHÁ NHÀ CŨ (Dọn dẹp để không bị lỗi trùng lặp)
DROP DATABASE IF EXISTS LOPHOCDB;
CREATE DATABASE LOPHOCDB;
USE LOPHOCDB;

-- 2. XÂY MÓNG (Tạo bảng theo chuẩn 3NF)

-- Bảng Sinh viên
CREATE TABLE STUDENTS (
    MaSV VARCHAR(10) PRIMARY KEY,
    TenSV VARCHAR(50) NOT NULL,
    NgaySinh DATE,
    GioiTinh CHAR(1)
);

-- Bảng Môn học
CREATE TABLE COURSE (
    MaMH VARCHAR(10) PRIMARY KEY,
    TenMH VARCHAR(50) NOT NULL,
    HocPhi DECIMAL(12,0) NOT NULL
);

-- Bảng Lớp học (Nối với Môn học)
CREATE TABLE CLASSES (
    MaLop VARCHAR(10) PRIMARY KEY,
    MaMH VARCHAR(10) NOT NULL,
    PhongHoc VARCHAR(10),
    NgayBatDau DATE,
    NgayKetThuc DATE,
    FOREIGN KEY (MaMH) REFERENCES COURSE(MaMH)
);

-- Bảng Đăng ký (Nối Sinh viên với Lớp học)
CREATE TABLE ENROLLMENT (
    EnrollmentID INT AUTO_INCREMENT PRIMARY KEY,
    MaSV VARCHAR(10) NOT NULL,
    MaLop VARCHAR(10) NOT NULL,
    NgayDangKy DATE,
    FOREIGN KEY (MaSV) REFERENCES STUDENTS(MaSV),
    FOREIGN KEY (MaLop) REFERENCES CLASSES(MaLop)
);

-- 3. ĐƯA DỮ LIỆU VÀO (Lấy chính xác từ ảnh đề bài)

-- Nhập Sinh viên
INSERT INTO STUDENTS (MaSV, TenSV, NgaySinh, GioiTinh) VALUES 
('S01', 'Nguyen Van A', '2002-03-10', 'M'),
('S02', 'Le Thi B', '2001-07-21', 'F'),
('S03', 'Pham Van C', '2003-11-02', 'M');

-- Nhập Môn học
INSERT INTO COURSE (MaMH, TenMH, HocPhi) VALUES 
('C01', 'IELTS', 8000000),
('C02', 'TOEIC', 6000000);

-- Nhập Lớp học
INSERT INTO CLASSES (MaLop, MaMH, PhongHoc, NgayBatDau, NgayKetThuc) VALUES 
('CL01', 'C01', 'R101', '2026-01-10', '2026-04-10'),
('CL02', 'C02', 'R102', '2026-02-01', '2026-04-01');

-- Nhập Đăng ký (Dữ liệu quan trọng nhất: S01 học 2 lớp)
INSERT INTO ENROLLMENT (MaSV, MaLop, NgayDangKy) VALUES 
('S01', 'CL01', '2025-12-20'),
('S02', 'CL01', '2025-12-22'),
('S03', 'CL02', '2026-01-15'),
('S01', 'CL02', '2026-01-16'); -- Sinh viên A học thêm lớp TOEIC

-- Xem danh sách sinh viên và lớp các bạn ấy đang học
SELECT s.TenSV, c.TenMH, l.MaLop, l.PhongHoc
FROM STUDENTS s
JOIN ENROLLMENT e ON s.MaSV = e.MaSV
JOIN CLASSES l ON e.MaLop = l.MaLop
JOIN COURSE c ON l.MaMH = c.MaMH;