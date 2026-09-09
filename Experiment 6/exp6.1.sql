CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);

CREATE TABLE Order_Details (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
``
INSERT INTO Products VALUES
(1, 'Laptop', 'Electronics', 60000),
(2, 'Mouse', 'Electronics', 1000),
(3, 'Chair', 'Furniture', 5000),
(4, 'Keyboard', 'Electronics', 2000);

INSERT INTO Order_Details VALUES
(101, 1, 1, 2),
(102, 2, 3, 1);

CREATE VIEW Unsold_Items AS
SELECT p.ProductName, p.Category
FROM Products p
WHERE p.ProductID NOT IN (
    SELECT od.ProductID
    FROM Order_Details od
);

Select * FROM Unsold_Items