use BanHang_DB;

--  Lấy dữ liệu từ hai bảng có tính toán
-- 1.	Liệt kê tổng số đơn hàng của từng khách hàng (hiển thị CustomerName và tổng số đơn hàng).
select Customers.CustomerName, 
count(Orders.OrderID) as TotalOrders
from Orders
join Customers on Orders.CustomerID = Customers.CustomerID
group by Customers.CustomerName;

-- 2.	Tính tổng số lượng sản phẩm đã bán theo từng sản phẩm (hiển thị ProductName  và tổng Quantity).
select Products.ProductName,
sum(OrderDetails.Quantity) as TotalQuantity
from OrderDetails
join Products on OrderDetails.ProductID = Products.ProductID
group by  Products.ProductName;

-- 3.	Tính tổng doanh thu của từng sản phẩm (hiển thị ProductName và tổng tiền).
select Products.ProductName,
-- Tổng doanh thu từng sản phẩm (Số lượng * Giá)
sum(OrderDetails.Quantity*Pructs.Price) as TotalTien
from OrderDetails
join Products on OrderDetails.ProductID = Products.ProductID
group by Products.ProductName;
 
-- 4.	Tính giá trung bình (AVG) của sản phẩm theo từng danh mục (hiển thị CategoryName và giá trung bình).
select Categories.CategoryName,
avg(Products.Price) AveragePrice
from Products
join Categories on Products.CategoryID = Categories.CategoryID
group by Categories.CategoryName;

-- 5.	Tìm giá cao nhất (MAX) của sản phẩm theo từng danh mục (hiển thị CategoryName và giá cao nhất).
select Categories.CategoryName,
max(Products.Price) MaxPrice
from Products
join Categories on Products.CategoryID = Categories.CategoryID
group by Categories.CategoryName;

-- 6.	Tìm giá thấp nhất (MIN) của sản phẩm theo từng danh mục (hiển thị CategoryName và giá thấp nhất).
select Categories.CategoryName,
min(Products.Price) MinPrice
from Products
join Categories on Products.CategoryID = Categories.CategoryID
group by Categories.CategoryName;

-- 7.	Tính tổng doanh thu theo từng đơn hàng (hiển thị OrderID và tổng tiền).
select OrderDetails.OrderID,
sum(OrderDetails.Quantity*Products.Price) TotalOrderValue
from OrderDetails
join Products on OrderDetails.ProductID = Products.ProductID
group by  OrderDetails.OrderID;

-- 8.	Đếm số sản phẩm trong từng danh mục (hiển thị CategoryName và số lượng sản phẩm).
select Categories.CategoryID,
count(Products.ProductID) as TotalProducts
from Products
join Categories on Products.CategoryID = Categories.CategoryID
group by Categories.CategoryID;

-- 9.	Tính tổng số đơn hàng mà mỗi nhân viên phụ trách (hiển thị FirstName, LastName và tổng số đơn).
select Employees.FirstName,Employees.LastName,
sum(Orders.OrderID)
from Orders
join Employees on Orders.EmployeeID = Employees.EmployeeID
group by Employees.FirstName,Employees.LastName;

-- 10.	Tính số lượng sản phẩm khác nhau mà mỗi nhà cung cấp cung cấp (hiển thị SupplierName và số lượng sản phẩm).
select Suppliers.SupplierName,
count(Products.ProductID) as TotalProducts
from Products
join Suppliers on Products.SupplierID = Suppliers.SupplierID
group by  Suppliers.SupplierName;
