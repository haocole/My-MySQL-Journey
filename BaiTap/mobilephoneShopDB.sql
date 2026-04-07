-- Yêu cầu 1: Tạo cấu trúc
CREATE DATABASE IF NOT EXISTS MobileShopDB;
USE MobileShopDB;

CREATE TABLE  PRODUCTS (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL, -- Thêm độ dài (100) và NOT NULL
    Brand VARCHAR(50),
    Price DECIMAL(15, 2), -- Dùng DECIMAL cho tiền tệ để chính xác hơn
    Stock INT
);

-- Yêu cầu 2: Nạp dữ liệu (Insert)
-- Vì ProductID tự động tăng nên chúng ta bỏ qua cột đó khi INSERT
INSERT INTO PRODUCTS (ProductName, Brand, Price, Stock) VALUES
('iPhone 15', 'Apple', 25000000, 10),
('Galaxy S24', 'Samsung', 22000000, 5),
('Xiaomi 14', 'Xiaomi', 15000000, 8),
('Oppo Reno 11', 'Oppo', 10000000, 12),
('iPhone 13', 'Apple', 14000000, 3);


select * from PRODUCTS;
