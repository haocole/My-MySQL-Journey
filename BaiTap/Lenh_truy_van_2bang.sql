USE BanHang_DB;
-- BanHang_DB_TruyVan_CoBan_2Bang
-- 1. Liệt kê đơn hàng kèm tên khách hàng (OrderID, CustomerName, OrderDate)
SELECT OrderID, 
(SELECT CustomerName FROM Customers 
WHERE Customers.CustomerID = Orders.CustomerID) AS CustomerName, OrderDate
FROM Orders;

-- 2. Liệt kê sản phẩm kèm tên nhà cung cấp (ProductName, SupplierName)
SELECT ProductName, 
(SELECT SupplierName FROM Suppliers 
WHERE Suppliers.SupplierID = Products.SupplierID) AS SupplierName
FROM Products;

-- 3. Liệt kê sản phẩm kèm tên danh mục (ProductName, CategoryName)
SELECT ProductName, 
(SELECT CategoryName FROM Categories 
WHERE Categories.CategoryID = Products.CategoryID) AS CategoryName
FROM Products;

-- 4. Liệt kê đơn hàng kèm tên nhân viên (OrderID, FirstName, LastName)
SELECT OrderID, 
(SELECT FirstName FROM Employees 
WHERE Employees.EmployeeID = Orders.EmployeeID) AS FirstName,
(SELECT LastName FROM Employees 
WHERE Employees.EmployeeID = Orders.EmployeeID) AS LastName
FROM Orders;

-- 5. Liệt kê đơn hàng kèm tên đơn vị vận chuyển (OrderID, ShipperName)
SELECT OrderID, 
(SELECT ShipperName FROM Shippers 
WHERE Shippers.ShipperID = Orders.ShipperID) AS ShipperName
FROM Orders;

-- 6. Liệt kê chi tiết đơn hàng kèm tên sản phẩm (OrderID, ProductName, Quantity)
SELECT OrderID, 
(SELECT ProductName FROM Products 
WHERE Products.ProductID = OrderDetails.ProductID) AS ProductName, Quantity
FROM OrderDetails;

-- 7. Sản phẩm giá > 20000 kèm tên danh mục
SELECT ProductName, Price,
(SELECT CategoryName FROM Categories 
WHERE Categories.CategoryID = Products.CategoryID) AS CategoryName
FROM Products
WHERE Price > 20000;

-- 8. Đơn hàng của khách ở Da Nang (OrderID, CustomerName, City)
SELECT OrderID, 
(SELECT CustomerName FROM Customers 
WHERE Customers.CustomerID = Orders.CustomerID) AS CustomerName,
(SELECT City FROM Customers 
WHERE Customers.CustomerID = Orders.CustomerID) AS City
FROM Orders
WHERE CustomerID IN (SELECT CustomerID FROM Customers WHERE City = 'Da Nang');

-- 9. Sản phẩm thuộc danh mục "Do uong"
SELECT ProductName, Price
FROM Products
WHERE CategoryID = (SELECT CategoryID FROM Categories WHERE CategoryName = 'Do uong');