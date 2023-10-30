CREATE DATABASE Product

use Product



CREATE TABLE Roles (
    RoleID INT PRIMARY KEY,
    [Name] VARCHAR(255)
)

CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Username VARCHAR(255),
    [Password] VARCHAR(255),
    RoleID INT,
    FOREIGN KEY (RoleID) REFERENCES Roles(RoleID)
)

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    [Name] VARCHAR(255)
)

CREATE TABLE Colors (
    ColorID INT PRIMARY KEY,
    [Name] VARCHAR(255)
)

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    [Name] VARCHAR(255),
    Price DECIMAL,
    Cost DECIMAL,
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
)

CREATE TABLE ProductColors (
    ProductColorID INT PRIMARY KEY,
    ProductID INT,
    ColorID INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (ColorID) REFERENCES Colors(ColorID)
)

SELECT p.[Name] AS ProductName, c.[Name] AS CategoryName, CONCAT(co.[Name] ,' , ') AS ColorNames
FROM Products p
INNER JOIN Categories c ON p.CategoryID = c.CategoryID
LEFT JOIN ProductColors pc ON p.ProductID = pc.ProductID
LEFT JOIN Colors co ON pc.ColorID = co.ColorID
GROUP BY p.ProductID, c.CategoryID;
