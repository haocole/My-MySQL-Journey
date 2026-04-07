-- BanHang_DB_TruyVan_CoBan_1Bang_Ham_GroupBy_OrderBy_Limit_Where.sql
use BanHang_DB;
-- 1.	Đếm tổng số khách hàng trong bảng Customers (hiển thị: TotalCustomers).
SELECT COUNT(*) AS TotalCustomers FROM Customers;

-- 2.	Đếm số khách hàng ở thành phố Da Nang trong bảng Customers (hiển thị: TotalCustomers).
select count(*) as TotalCustomers 
from Customers 
where City = 'Da Nang';

-- 3.	Tìm số lượng khách hàng theo từng thành phố trong bảng Customers, sắp xếp giảm dần theo số lượng (hiển thị: City, TotalCustomers).
select City, count(CustomerID) as TotalCustomers 
from Customers 
group by City 
order by TotalCustomers desc;

-- 4.	Tìm số lượng khách hàng theo từng quốc gia trong bảng Customers, chỉ hiển thị 3 quốc gia có nhiều khách hàng nhất (hiển thị: Country, TotalCustomers).
select Country, count(CustomerID) as TotalCustomers
from Customers 
group by Country
order by TotalCustomers desc 
limit 3;

-- 5.	Đếm số khách hàng có ContactName không null trong bảng Customers (hiển thị: TotalCustomers).
select count(ContactName) as TotalCustomers
from Customers
where ContactName is not  null;

-- 6.	Đếm số khách hàng có ContactName null trong bảng Customers (hiển thị: TotalCustomers).
select count(ContactName) as TotalCustomers
from Customers
where ContactName is null;

-- 7.	Đếm tổng số sản phẩm trong bảng Products (hiển thị: TotalProducts).
select count(ProductID) as TotalProducts
from Products;

-- 8.	Tính giá trung bình của tất cả sản phẩm trong bảng Products (hiển thị: AveragePrice).
select avg(Price ) as AveragePrice
from Products;

-- 9.	Tìm 5 sản phẩm có giá cao nhất trong bảng Products (hiển thị: ProductName, Price).
select ProductName, Price
from  Products
order by Price desc 
limit 5;

-- 10.	Tìm giá thấp nhất của sản phẩm trong bảng Products (hiển thị: MinPrice).
select min(Price) as MinPrice
from Products;

-- 11.	Tính tổng giá của các sản phẩm có giá lớn hơn 20000 trong bảng Products (hiển thị: TotalPrice).
select sum(Price) as TotalPrice
from Products
where Price > 20000;

-- 12.	Tính giá trung bình của sản phẩm theo từng danh mục trong bảng Products, sắp xếp tăng dần theo giá trung bình (hiển thị: CategoryID, AveragePrice).
select CategoryID, avg(Price) as AveragePrice
from Products
group by CategoryID
order by AveragePrice asc;
-- 13.	Tìm số lượng sản phẩm theo từng nhà cung cấp trong bảng Products, chỉ hiển thị 5 nhà cung cấp có nhiều sản phẩm nhất (hiển thị: SupplierID, TotalProducts).
select SupplierID, count(ProductID) as TotalProducts
from Products
group by SupplierID
order by TotalProducts desc
limit 5;
-- 14.	Tìm giá cao nhất của sản phẩm theo từng nhà cung cấp trong bảng Products, chỉ xét các sản phẩm có giá lớn hơn 10000 và sắp xếp giảm dần theo giá (hiển thị: SupplierID, MaxPrice).
select SupplierID, max(Price) as MaxPrice
from Products
where Price > 10000 
group by SupplierID
order by MaxPrice desc;
-- 15 .	Đếm số đơn hàng theo từng nhân viên trong bảng Orders, sắp xếp giảm dần theo số đơn hàng (hiển thị: EmployeeID, TotalOrders).
select EmployeeID, count(OrderID) as TotalOrders
from Orders
group by EmployeeID
order by TotalOrders desc
























