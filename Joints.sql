create schema Sales;
use sys;
use Sales;
-- Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Country VARCHAR(100)
);

--  Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2)
);

-- OrderDetails Table
CREATE TABLE OrderDetails (
    OrderID INT,
    ProductID INT,
    Quantity INT,
    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Insert Data into Customers Table
INSERT INTO Customers (CustomerID, CustomerName, Country) VALUES
(1, 'Adithiya Sekar', 'Chennai'),
(2, 'Arun Kumar', 'Madurai'),
(3, 'Barath Kumar', 'Trichy');

-- Insert Data into Orders Table
INSERT INTO Orders (OrderID, OrderDate, CustomerID) VALUES
(101, '2025-01-15', 1),
(102, '2025-01-20', 3),
(103, '2025-01-25', 1);

-- Insert Data into Products Table
INSERT INTO Products (ProductID, ProductName, Price) VALUES
(201, 'Iphone 16 ', 79999),
(202, 'Mac book pro', 185000);

-- Insert Data into OrderDetails Table
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES
(101, 201, 2),
(101, 202, 1),
(102, 202, 3),
(103, 201, 1);

SELECT 
    Customers.CustomerName,
    SUM(Products.Price * OrderDetails.Quantity) AS TotalSales
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
JOIN Products ON OrderDetails.ProductID = Products.ProductID
GROUP BY Customers.CustomerName;

