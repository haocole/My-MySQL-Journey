Use BanHang_DB;
-- BanHang_DB_TruyVan_CoBan_1Bang
-- Phần 1: Bảng Customers
-- 1.	Liệt kê tất cả khách hàng ở thành phố Da Nang. 
SELECT * FROM Customers WHERE City = 'Da Nang';

-- 2.	Liệt kê các khách hàng có Country = 'Viet Nam'. 
SELECT * FROM Customers WHERE Country = 'Viet Nam';

-- 3.	Liệt kê khách hàng có PostalCode = '100000'. 
SELECT * FROM Customers WHERE PostalCode = '100000';

-- 4.	Liệt kê các khách hàng có City IN ('Ha Noi', 'Da Nang'). 
SELECT * FROM Customers WHERE City IN ('Ha Noi', 'Da Nang');

-- 5.	Liệt kê khách hàng có City NOT IN ('Ha Noi', 'Da Nang'). 
SELECT * FROM Customers WHERE City NOT IN ('Ha Noi', 'Da Nang');

-- 6.	Tìm các khách hàng có tên công ty bắt đầu bằng chữ 'Cong ty A' (dùng LIKE). 
SELECT * FROM Customers WHERE CustomerName LIKE 'Cong ty A%';

-- 7.	Liệt kê các khách hàng có ContactName IS NOT NULL. 
SELECT * FROM Customers WHERE ContactName IS NOT NULL;

-- 8.	Liệt kê các khách hàng có ContactName IS NULL. 
SELECT * FROM Customers WHERE ContactName IS NULL;

-- 9.	Hiển thị 5 khách hàng đầu tiên trong bảng Customers.
SELECT * FROM Customers LIMIT 5;

-- Phần 2: Bảng Products
-- 10.	Liệt kê các sản phẩm có Price > 20000. 
SELECT * FROM Products WHERE Price > 20000;

-- 11.	Liệt kê các sản phẩm có Price < 15000. 
SELECT * FROM Products WHERE Price < 15000;

-- 12.	Liệt kê các sản phẩm có Price BETWEEN 10000 AND 30000. 
SELECT * FROM Products WHERE Price BETWEEN 10000 AND 30000;

-- 13.	Liệt kê các sản phẩm có SupplierID = 1.
SELECT * FROM Products WHERE SupplierID = 1; 

-- 14.	Liệt kê các sản phẩm có CategoryID IN (1, 2, 5). 
SELECT * FROM Products WHERE CategoryID IN (1, 2, 5);

-- 15.	Tính tổng giá (SUM) của tất cả sản phẩm trong bảng Products. 
SELECT SUM(Price) AS TongGia FROM Products;

-- 16.	Đếm (COUNT) tổng số sản phẩm trong bảng Products. 
SELECT COUNT(*) AS TongSoSanPham FROM Products;

-- 17.	Liệt kê 5 sản phẩm đầu tiên có giá cao hơn 10000.
SELECT * FROM Products WHERE Price > 10000 LIMIT 5;

-- Phần 3: Bảng Orders
-- 18.	Liệt kê các đơn hàng có OrderDate BETWEEN '2025-03-01' AND '2025-03-05'. 
SELECT * FROM Orders WHERE OrderDate BETWEEN '2025-03-01' AND '2025-03-05';

-- 19.	Đếm (COUNT) số đơn hàng có ShipperID = 1. 
SELECT COUNT(*) AS SoDonHang FROM Orders WHERE ShipperID = 1;

-- 20.	Liệt kê các đơn hàng có EmployeeID NOT IN (1,2,3).
SELECT * FROM Orders WHERE EmployeeID NOT IN (1, 2, 3);