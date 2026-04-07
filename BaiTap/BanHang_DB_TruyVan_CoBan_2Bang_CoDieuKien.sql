use BanHang_DB;
-- *Truy vấn từ 2 bảng kèm điều kiện với where
-- 1.	Liệt kê các đơn hàng có OrderDate sau ngày '2025-03-05' kèm tên khách hàng (hiển thị OrderID, CustomerName, OrderDate).
SELECT OrderID, OrderDate, 
    (SELECT CustomerName 
     FROM Customers 
     WHERE Customers.CustomerID = Orders.CustomerID) AS CustomerName
FROM Orders
WHERE OrderDate > '2025-03-05';

-- 2.	Liệt kê các sản phẩm có Price lớn hơn 30000 kèm tên nhà cung cấp.
select ProductName, Price,
(select SupplierName from Suppliers where Suppliers.SupplierID = Products.SupplierID) as SupplierName 
from Products
where Price > 30000;

-- 3.	Liệt kê các sản phẩm thuộc danh mục Do hop có giá nhỏ hơn 35000.
select * from Products 
where Price < 35000 
and CategoryID in  (select CategoryID from Categories where CategoryName = 'Do hop');

-- 4.	Liệt kê các đơn hàng do nhân viên có FirstName = 'An' phụ trách.
select * from Orders
where EmployeeID in ( select EmployeeID from Employees where FirstName = 'An');

-- 5.	Liệt kê các đơn hàng được giao bởi đơn vị vận chuyển có ShipperName = 'Giao hang nhanh A'.
select *from Orders
where ShipperID in (select ShipperName from Shippers where ShipperName = 'Giao hang nhanh A');
-- 6.	Liệt kê các sản phẩm của nhà cung cấp có City = 'Da Nang'.
select * from Products
where SupplierID in ( select SupplierID from Suppliers where City = 'Da Nang');

-- 7.	Liệt kê các đơn hàng của khách hàng có City IN ('Ha Noi', 'Da Nang').
select * from Orders
where CustomerID in ( select CustomerID from Customers where City in ('Ha Noi ','Da Nang'));

-- 8.	Liệt kê các sản phẩm có Price BETWEEN 10000 AND 25000 kèm tên danh mục.
select ProductName, Price,
( select CategoryID from Categories where Categories.CategoryID = Products.CategoryID) as CategoryName
from Products
where Price between 10000 and 25000;

-- 9.	Liệt kê các đơn hàng của khách hàng có CustomerName LIKE 'Cong ty A%'.
select * from Orders
where CustomerID in ( select CustomerID from Customers where CustomerName like 'Cong ty A%');

-- 10.	Đếm số đơn hàng của khách hàng có Country = 'Viet Nam'.
select count(*) as SoDonHang
from Orders
where CustomerID in (select CustomerID from Customers where Country = 'Viet Nam');
