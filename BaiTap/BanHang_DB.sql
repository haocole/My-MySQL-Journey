-- 1. Làm mới Database
DROP DATABASE IF EXISTS BanHang_DB;
CREATE DATABASE BanHang_DB;
USE BanHang_DB;

-- 2. Tạo các bảng không có khóa ngoại trước
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(255),
    ContactName VARCHAR(255),
    Address VARCHAR(255),
    City VARCHAR(100),
    PostalCode VARCHAR(20),
    Country VARCHAR(100)
);

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY AUTO_INCREMENT,
    CategoryName VARCHAR(255),
    Description VARCHAR(255)
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    LastName VARCHAR(100),
    FirstName VARCHAR(100),
    BirthDate DATE,
    Photo VARCHAR(255),
    Notes TEXT
);

CREATE TABLE Shippers (
    ShipperID INT PRIMARY KEY AUTO_INCREMENT,
    ShipperName VARCHAR(255),
    Phone VARCHAR(50)
);

CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY AUTO_INCREMENT,
    SupplierName VARCHAR(255),
    ContactName VARCHAR(255),
    Address VARCHAR(255),
    City VARCHAR(100),
    PostalCode VARCHAR(20),
    Country VARCHAR(100),
    Phone VARCHAR(50)
);

-- 3. Tạo các bảng có khóa ngoại
CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(255),
    SupplierID INT,
    CategoryID INT,
    Unit VARCHAR(100),
    Price DECIMAL(10, 2),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    EmployeeID INT,
    OrderDate DATE,
    ShipperID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (ShipperID) REFERENCES Shippers(ShipperID)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- 4. Chèn dữ liệu đầmenuy đủ
INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country) VALUES
('Cong ty Anh Duong', 'Nguyen Van A', '12 Le Loi', 'Da Nang', '550000', 'Viet Nam'),
('Cong ty Binh Minh', 'Tran Thi B', '45 Hai Ba Trung', 'Ha Noi', '100000', 'Viet Nam'),
('Cong ty Hoang Gia', 'Le Van C', '78 Nguyen Hue', 'Hue', '530000', 'Viet Nam'),
('Cong ty Thanh Cong', 'Pham Thi D', '22 Tran Phu', 'Da Nang', '550000', 'Viet Nam'),
('Cong ty Dai Phat', 'Hoang Van E', '90 Ly Thuong Kiet', 'Hai Phong', '180000', 'Viet Nam'),
('Cong ty Minh Chau', 'Do Thi F', '11 Vo Nguyen Giap', 'Da Nang', '550000', 'Viet Nam'),
('Cong ty Phu Quy', 'Nguyen Van G', '67 Cach Mang Thang 8', 'Can Tho', '900000', 'Viet Nam'),
('Cong ty Thien Phuc', 'Tran Van H', '39 Hung Vuong', 'Quang Nam', '560000', 'Viet Nam'),
('Cong ty Kim Long', 'Le Thi I', '120 Nguyen Tat Thanh', 'Da Nang', '550000', 'Viet Nam'),
('Cong ty Gia Hung', 'Pham Van K', '15 Le Duan', 'Ha Noi', '100000', 'Viet Nam');

INSERT INTO Categories (CategoryName, Description) VALUES
('Do uong', 'Cac loai nuoc giai khat'),
('Banh keo', 'Cac loai banh va keo'),
('Thuc pham tuoi', 'Rau cu va trai cay'),
('Hai san', 'Tom cua ca bien'),
('Do hop', 'Thuc pham dong hop'),
('Gia vi', 'Nuoc mam muoi duong'),
('Sua', 'Cac loai sua'),
('Do dong lanh', 'Thuc pham dong lanh'),
('Do kho', 'Mi nui gao'),
('Thuc an nhanh', 'Xuc xich do chien');

INSERT INTO Employees (LastName, FirstName, BirthDate) VALUES
('Nguyen', 'An', '1990-05-10'),
('Tran', 'Binh', '1988-03-21'),
('Le', 'Cuong', '1992-07-15'),
('Pham', 'Dung', '1995-09-30'),
('Hoang', 'Hanh', '1987-12-11'),
('Vo', 'Khanh', '1993-04-05'),
('Dang', 'Linh', '1991-08-18'),
('Bui', 'Minh', '1989-06-25'),
('Do', 'Nam', '1994-02-14'),
('Phan', 'Quang', '1990-11-09');

INSERT INTO Suppliers (SupplierName, ContactName, Address, City, PostalCode, Country, Phone) VALUES
('Nha cung cap An Phat', 'Nguyen Van T', '12 Le Duan', 'Ha Noi', '100000', 'Viet Nam', '0905000001'),
('Nha cung cap Binh An', 'Tran Van U', '33 Tran Phu', 'Da Nang', '550000', 'Viet Nam', '0905000002'),
('Nha cung cap Thanh Dat', 'Le Van V', '44 Hung Vuong', 'Hue', '530000', 'Viet Nam', '0905000003'),
('Nha cung cap Minh Tam', 'Pham Van W', '55 Le Loi', 'Da Nang', '550000', 'Viet Nam', '0905000004'),
('Nha cung cap Phu Loc', 'Hoang Van X', '66 Nguyen Hue', 'Hai Phong', '180000', 'Viet Nam', '0905000005'),
('Nha cung cap Kim Ngan', 'Vo Van Y', '77 Hai Ba Trung', 'Can Tho', '900000', 'Viet Nam', '0905000006'),
('Nha cung cap Gia Bao', 'Dang Van Z', '88 Ly Thuong Kiet', 'Quang Nam', '560000', 'Viet Nam', '0905000007'),
('Nha cung cap Tien Loi', 'Bui Van M', '99 Cach Mang Thang 8', 'Da Nang', '550000', 'Viet Nam', '0905000008'),
('Nha cung cap Thanh Ha', 'Do Van N', '21 Nguyen Tat Thanh', 'Ha Noi', '100000', 'Viet Nam', '0905000009'),
('Nha cung cap Bao Chau', 'Phan Van P', '13 Vo Nguyen Giap', 'Da Nang', '550000', 'Viet Nam', '0905000010');

INSERT INTO Shippers (ShipperName, Phone) VALUES
('Giao hang nhanh A', '0906000001'),
('Giao hang nhanh B', '0906000002'),
('Giao hang tiet kiem C', '0906000003'),
('Van tai Minh Anh', '0906000004'),
('Van tai Thanh Cong', '0906000005'),
('Giao hang 24h', '0906000006'),
('Van chuyen Phu Quy', '0906000007'),
('Van chuyen Bao Tin', '0906000008'),
('Giao hang Hoa Phat', '0906000009'),
('Van tai An Khang', '0906000010');

INSERT INTO Products (ProductName, SupplierID, CategoryID, Unit, Price) VALUES
('Nuoc ngot cola', 1, 1, 'Chai', 10000),
('Nuoc cam ep', 2, 1, 'Chai', 15000),
('Banh quy bo', 3, 2, 'Hop', 25000),
('Keo dua', 4, 2, 'Goi', 5000),
('Ca ngu dong hop', 5, 5, 'Hop', 30000),
('Tom tuoi', 6, 4, 'Kg', 200000),
('Sua tuoi hop', 7, 7, 'Hop', 12000),
('Xuc xich chien', 8, 10, 'Goi', 18000),
('Mi goi tom chua cay', 9, 9, 'Thung', 90000),
('Rau cai xanh', 10, 3, 'Kg', 15000),
('Duong trang', 1, 6, 'Kg', 20000),
('Kem vani', 2, 8, 'Hop', 35000),
('Banh mi sandwich', 3, 10, 'Tui', 22000),
('Sua chua hop', 4, 7, 'Hop', 8000),
('Ca thu dong hop', 5, 5, 'Hop', 32000);

INSERT INTO Orders (CustomerID, EmployeeID, OrderDate, ShipperID) VALUES
(1, 1, '2025-03-01', 1),
(2, 2, '2025-03-02', 2),
(3, 3, '2025-03-03', 3),
(4, 4, '2025-03-04', 4),
(5, 5, '2025-03-05', 5),
(6, 6, '2025-03-06', 6),
(7, 7, '2025-03-07', 7),
(8, 8, '2025-03-08', 8),
(9, 9, '2025-03-09', 9),
(10, 10, '2025-03-10', 10),
(1, 2, '2025-03-11', 1),
(2, 3, '2025-03-12', 2);

INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES
(1,1,5), (1,3,2), (2,2,3), (3,4,10), (3,5,1),
(4,6,2), (4,7,5), (4,8,3), (5,9,1), (6,10,4),
(6,11,2), (7,12,2), (8,13,3), (8,14,6), (9,15,2),
(10,1,1), (10,2,2), (11,3,4), (12,4,5), (12,5,2);


