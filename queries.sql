-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT productname
, categoryName 
FROM product 
JOIN category ON product.CategoryId = category.Id

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT [Order].id,
       shipper.CompanyName
  FROM [Order]
       JOIN
       shipper ON [Order].ShipVia = shipper.Id
       WHERE orderdate < '2012-08-09'

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT Product.ProductName,
       OrderDetail.Quantity
  FROM [Order]
       JOIN
       OrderDetail ON [Order].id = orderdetail.OrderId
       JOIN
       Product ON orderDetail.ProductId = product.Id
 WHERE [Order].id = 10251
 ORDER BY ProductName ASC

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
SELECT [Order].Id,
       customer.CompanyName,
       employee.LastName
  FROM [Order]
       JOIN
       customer ON [Order].CustomerId = customer.Id
       JOIN
       employee ON [Order].EmployeeId = employee.Id;

--Stretch ONE
 --Displays CategoryName and a new column called Count that shows how many products are in each category. Shows 8 records.
 
SELECT CategoryName, Count() as Count
FROM [Categories]
JOIN [Products] on [products].CategoryId = categories.categoryid
Group By categoryName

--Stretch Two
--Display OrderID and a column called ItemCount that shows the total number of products placed on the order. Shows 196 records.

SELECT [Orders].OrderID, Count() AS ItemCount FROM [Orders]
JOIN OrderDetails AS OD ON [Orders].OrderID = OD.OrderID
 GROUP BY [Orders].OrderID; 