/*
  TTTTTTT  EEEEE  CCCCC  H   H       SSSSS  H   H  OOOOO  PPPPP  
     T     E      C      H   H       S      H   H  O   O  P   P 
     T     EEEEE  C      HHHHH       SSSSS  HHHHH  O   O  PPPPP  
     T     E      C      H   H           S  H   H  O   O  P      
     T     EEEEE  CCCCC  H   H       SSSSS  H   H  OOOOO  P      

               T E C H   S H O P   D A T A B A S E
               ==================================
               
         Database: TechShop
         Version : 1.0
         Author  : KRISHNAY MUDGAL
         Date    : 30/09/2024
         Purpose : To manage data related to customers, products, orders, 
                   order details, and inventory for an electronic gadgets store.
                   
         Tables:
         - Customers
         - Products
         - Orders
         - OrderDetails
         - Inventory
*/
create database TechShopDB;
go

use TechShopDB;

--Creating Tables
create table Customers(
CustomerId int PRIMARY KEY,
FirstName varchar(10),
LastName varchar(10),
Email varchar(15),
Phone varchar(15),
[Address] varchar(255),
constraint ck_email_format
check (Email Like '%_@__%.__%')
);

Alter table Customers
Alter column Email varchar(50);


sp_help Customers;

create table Products(
ProductId int PRIMARY KEY,
ProductName varchar(20),
[Description] varchar(255),
Price money
);

sp_help Products;

create table Orders(
OrderId int PRIMARY KEY,
CustomerId int NOT NULL FOREIGN KEY REFERENCES Customers(CustomerId),
OrderDate Date NOT NULL,
TotalAmount Decimal(10,2) NOT NULL
);


sp_help Orders;

create table OrderDetails(
OrderDetailId int PRIMARY KEY,
OrderId int NOT NULL FOREIGN KEY REFERENCES Orders(OrderId),
ProductId int NOT NULL FOREIGN KEY REFERENCES Products(ProductId),
Quantity int NOT NULL
);

sp_help OrderDetails;

create table Inventory(
InventoryId int PRIMARY KEY,
ProductId int NOT NULL FOREIGN KEY REFERENCES Products(ProductId),
QuantityInStock int NOT NULL,
LastStockUpdate DATETIME NOT NULL
);

sp_help Inventory;


--  TASK 1  Inserting Data in Tables
INSERT INTO Customers (CustomerId, FirstName, LastName, Email, Phone, [Address])
VALUES (1, 'John', 'Doe', 'john.doe@example.com', '1234567890', '123 Elm St, New York, NY');

INSERT INTO Customers (CustomerId, FirstName, LastName, Email, Phone, [Address])
VALUES (2, 'Jane', 'Smith', 'jane.smith@example.com', '0987654321', '456 Oak St, Los Angeles, CA');

INSERT INTO Customers (CustomerId, FirstName, LastName, Email, Phone, [Address])
VALUES (3, 'Mike', 'Johnson', 'mike.johnson@example.com', '1112223333', '789 Pine St, Chicago, IL');

INSERT INTO Customers (CustomerId, FirstName, LastName, Email, Phone, [Address])
VALUES (4, 'Emily', 'Davis', 'emily.davis@example.com', '4445556666', '321 Maple St, Houston, TX');

INSERT INTO Customers (CustomerId, FirstName, LastName, Email, Phone, [Address])
VALUES (5, 'David', 'Wilson', 'david.wilson@example.com', '7778889999', '654 Cedar St, Phoenix, AZ');

INSERT INTO Customers (CustomerId, FirstName, LastName, Email, Phone, [Address])
VALUES (6, 'Sarah', 'Lee', 'sarah.lee@example.com', '2223334444', '987 Birch St, San Francisco, CA');

INSERT INTO Customers (CustomerId, FirstName, LastName, Email, Phone, [Address])
VALUES (7, 'Chris', 'Brown', 'chris.brown@example.com', '5556667777', '111 Ash St, Dallas, TX');

INSERT INTO Customers (CustomerId, FirstName, LastName, Email, Phone, [Address])
VALUES (8, 'Lisa', 'Moore', 'lisa.moore@example.com', '8889990000', '222 Spruce St, Denver, CO');

INSERT INTO Customers (CustomerId, FirstName, LastName, Email, Phone, [Address])
VALUES (9, 'Tom', 'Anderson', 'tom.anderson@example.com', '3334445555', '333 Walnut St, Seattle, WA');

INSERT INTO Customers (CustomerId, FirstName, LastName, Email, Phone, [Address])
VALUES (10, 'Laura', 'Clark', 'laura.clark@example.com', '6667778888', '444 Cherry St, Miami, FL');

select * from Customers;

----------------------------------------------

INSERT INTO Products (ProductId, ProductName, [Description], Price)
VALUES (1, 'Smartphone', 'Latest model with 64GB storage and 4GB RAM', 599.99);

INSERT INTO Products (ProductId, ProductName, [Description], Price)
VALUES (2, 'Laptop', '15-inch screen, Intel i5, 8GB RAM, 256GB SSD', 999.99);

INSERT INTO Products (ProductId, ProductName, [Description], Price)
VALUES (3, 'Smartwatch', 'Water-resistant smartwatch with fitness tracking', 199.99);

INSERT INTO Products (ProductId, ProductName, [Description], Price)
VALUES (4, 'Tablet', '10-inch tablet with 32GB storage, Wi-Fi, and 4G', 349.99);

INSERT INTO Products (ProductId, ProductName, [Description], Price)
VALUES (5, 'Bluetooth Speaker', 'Portable speaker with 10 hours battery life', 79.99);

INSERT INTO Products (ProductId, ProductName, [Description], Price)
VALUES (6, 'Wireless Headphones', 'Noise-canceling over-ear headphones', 129.99);

INSERT INTO Products (ProductId, ProductName, [Description], Price)
VALUES (7, 'Smart TV', '55-inch 4K UHD Smart TV with streaming apps', 799.99);

INSERT INTO Products (ProductId, ProductName, [Description], Price)
VALUES (8, 'Gaming Console', 'Next-gen console with 1TB storage and 4K support', 499.99);

INSERT INTO Products (ProductId, ProductName, [Description], Price)
VALUES (9, 'Camera', '24MP DSLR camera with lens kit', 649.99);

INSERT INTO Products (ProductId, ProductName, [Description], Price)
VALUES (10, 'External Hard Drive', '2TB USB 3.0 external hard drive', 89.99);

INSERT INTO Products (ProductId, ProductName, [Description], Price)
VALUES (11, 'Fitness Tracker', 'Fitness tracker with heart rate monitor', 149.99);

INSERT INTO Products (ProductId, ProductName, [Description], Price)
VALUES (12, 'Bluetooth Earbuds', 'True wireless earbuds with charging case', 69.99);

INSERT INTO Products (ProductId, ProductName, [Description], Price)
VALUES (13, 'Wireless Mouse', 'Ergonomic wireless mouse with 1600 DPI', 29.99);

INSERT INTO Products (ProductId, ProductName, [Description], Price)
VALUES (14, 'Mechanical Keyboard', 'Backlit mechanical keyboard with customizable keys', 109.99);

INSERT INTO Products (ProductId, ProductName, [Description], Price)
VALUES (15, 'Portable Charger', '10000mAh power bank with fast charging', 49.99);

INSERT INTO Products (ProductId, ProductName, [Description], Price)
VALUES (16, 'Drone', 'Quadcopter drone with 1080p camera and GPS', 399.99);

INSERT INTO Products (ProductId, ProductName, [Description], Price)
VALUES (17, 'VR Headset', 'Virtual reality headset compatible with gaming consoles', 299.99);

INSERT INTO Products (ProductId, ProductName, [Description], Price)
VALUES (18, 'Smart Home Hub', 'Smart home hub with voice assistant', 129.99);

INSERT INTO Products (ProductId, ProductName, [Description], Price)
VALUES (19, 'Robot Vacuum', 'Wi-Fi connected robot vacuum with auto-recharge', 449.99);

INSERT INTO Products (ProductId, ProductName, [Description], Price)
VALUES (20, 'Action Camera', '4K action camera with waterproof housing', 199.99);

select * from Products;

--------------------------------------------------------------------------------

INSERT INTO Orders (OrderId, CustomerId, OrderDate, TotalAmount)
VALUES (1, 1, '2024-01-10', 199.99);

INSERT INTO Orders (OrderId, CustomerId, OrderDate, TotalAmount)
VALUES (2, 2, '2024-01-15', 799.99);

INSERT INTO Orders (OrderId, CustomerId, OrderDate, TotalAmount)
VALUES (3, 3, '2024-02-05', 349.99);

INSERT INTO Orders (OrderId, CustomerId, OrderDate, TotalAmount)
VALUES (4, 1, '2024-02-10', 129.99);

INSERT INTO Orders (OrderId, CustomerId, OrderDate, TotalAmount)
VALUES (5, 4, '2024-02-20', 999.99);

INSERT INTO Orders (OrderId, CustomerId, OrderDate, TotalAmount)
VALUES (6, 5, '2024-02-25', 79.99);

INSERT INTO Orders (OrderId, CustomerId, OrderDate, TotalAmount)
VALUES (7, 6, '2024-03-05', 499.99);

INSERT INTO Orders (OrderId, CustomerId, OrderDate, TotalAmount)
VALUES (8, 2, '2024-03-10', 129.99);

INSERT INTO Orders (OrderId, CustomerId, OrderDate, TotalAmount)
VALUES (9, 3, '2024-03-15', 109.99);

INSERT INTO Orders (OrderId, CustomerId, OrderDate, TotalAmount)
VALUES (10, 7, '2024-03-20', 649.99);

INSERT INTO Orders (OrderId, CustomerId, OrderDate, TotalAmount)
VALUES (11, 8, '2024-04-01', 49.99);

INSERT INTO Orders (OrderId, CustomerId, OrderDate, TotalAmount)
VALUES (12, 9, '2024-04-05', 199.99);

INSERT INTO Orders (OrderId, CustomerId, OrderDate, TotalAmount)
VALUES (13, 10, '2024-04-10', 599.99);

INSERT INTO Orders (OrderId, CustomerId, OrderDate, TotalAmount)
VALUES (14, 1, '2024-04-15', 89.99);

INSERT INTO Orders (OrderId, CustomerId, OrderDate, TotalAmount)
VALUES (15, 5, '2024-05-01', 69.99);

INSERT INTO Orders (OrderId, CustomerId, OrderDate, TotalAmount)
VALUES (16, 6, '2024-05-10', 149.99);

INSERT INTO Orders (OrderId, CustomerId, OrderDate, TotalAmount)
VALUES (17, 7, '2024-05-15', 199.99);

INSERT INTO Orders (OrderId, CustomerId, OrderDate, TotalAmount)
VALUES (18, 2, '2024-06-01', 129.99);

INSERT INTO Orders (OrderId, CustomerId, OrderDate, TotalAmount)
VALUES (19, 3, '2024-06-05', 399.99);

INSERT INTO Orders (OrderId, CustomerId, OrderDate, TotalAmount)
VALUES (20, 4, '2024-06-15', 499.99);

INSERT INTO Orders (OrderId, CustomerId, OrderDate, TotalAmount)
VALUES (21, 9, '2024-06-20', 199.99);

INSERT INTO Orders (OrderId, CustomerId, OrderDate, TotalAmount)
VALUES (22, 8, '2024-07-01', 799.99);

INSERT INTO Orders (OrderId, CustomerId, OrderDate, TotalAmount)
VALUES (23, 10, '2024-07-10', 299.99);

INSERT INTO Orders (OrderId, CustomerId, OrderDate, TotalAmount)
VALUES (24, 5, '2024-07-20', 649.99);

INSERT INTO Orders (OrderId, CustomerId, OrderDate, TotalAmount)
VALUES (25, 6, '2024-07-25', 129.99);

select * from Orders;

----------------------------------------------------------------

INSERT INTO OrderDetails (OrderDetailId, OrderId, ProductId, Quantity)
VALUES (1, 1, 3, 2);  

INSERT INTO OrderDetails (OrderDetailId, OrderId, ProductId, Quantity)
VALUES (2, 2, 7, 1);  

INSERT INTO OrderDetails (OrderDetailId, OrderId, ProductId, Quantity)
VALUES (3, 3, 4, 1);  

INSERT INTO OrderDetails (OrderDetailId, OrderId, ProductId, Quantity)
VALUES (4, 4, 6, 1);  

INSERT INTO OrderDetails (OrderDetailId, OrderId, ProductId, Quantity)
VALUES (5, 5, 2, 1);  

INSERT INTO OrderDetails (OrderDetailId, OrderId, ProductId, Quantity)
VALUES (6, 6, 5, 2);  

INSERT INTO OrderDetails (OrderDetailId, OrderId, ProductId, Quantity)
VALUES (7, 7, 8, 1);  

INSERT INTO OrderDetails (OrderDetailId, OrderId, ProductId, Quantity)
VALUES (8, 8, 18, 1);  

INSERT INTO OrderDetails (OrderDetailId, OrderId, ProductId, Quantity)
VALUES (9, 9, 14, 1);  

INSERT INTO OrderDetails (OrderDetailId, OrderId, ProductId, Quantity)
VALUES (10, 10, 9, 1);  

INSERT INTO OrderDetails (OrderDetailId, OrderId, ProductId, Quantity)
VALUES (11, 11, 15, 2);  

INSERT INTO OrderDetails (OrderDetailId, OrderId, ProductId, Quantity)
VALUES (12, 12, 13, 1);  

INSERT INTO OrderDetails (OrderDetailId, OrderId, ProductId, Quantity)
VALUES (13, 13, 1, 1);  

INSERT INTO OrderDetails (OrderDetailId, OrderId, ProductId, Quantity)
VALUES (14, 14, 10, 1);  

INSERT INTO OrderDetails (OrderDetailId, OrderId, ProductId, Quantity)
VALUES (15, 15, 12, 1);  

INSERT INTO OrderDetails (OrderDetailId, OrderId, ProductId, Quantity)
VALUES (16, 16, 11, 1);  

INSERT INTO OrderDetails (OrderDetailId, OrderId, ProductId, Quantity)
VALUES (17, 17, 3, 2);  

INSERT INTO OrderDetails (OrderDetailId, OrderId, ProductId, Quantity)
VALUES (18, 18, 6, 1);  

INSERT INTO OrderDetails (OrderDetailId, OrderId, ProductId, Quantity)
VALUES (19, 19, 16, 1);  

INSERT INTO OrderDetails (OrderDetailId, OrderId, ProductId, Quantity)
VALUES (20, 20, 8, 1);  

INSERT INTO OrderDetails (OrderDetailId, OrderId, ProductId, Quantity)
VALUES (21, 21, 17, 1);  

INSERT INTO OrderDetails (OrderDetailId, OrderId, ProductId, Quantity)
VALUES (22, 22, 7, 1);  

INSERT INTO OrderDetails (OrderDetailId, OrderId, ProductId, Quantity)
VALUES (23, 23, 20, 1);  

INSERT INTO OrderDetails (OrderDetailId, OrderId, ProductId, Quantity)
VALUES (24, 24, 9, 1);  

INSERT INTO OrderDetails (OrderDetailId, OrderId, ProductId, Quantity)
VALUES (25, 25, 6, 1);  

INSERT INTO OrderDetails (OrderDetailId, OrderId, ProductId, Quantity)
VALUES (26, 1, 4, 1);  

INSERT INTO OrderDetails (OrderDetailId, OrderId, ProductId, Quantity)
VALUES (27, 2, 3, 2);

INSERT INTO OrderDetails (OrderDetailId, OrderId, ProductId, Quantity)
VALUES (28, 3, 7, 4);  

INSERT INTO OrderDetails (OrderDetailId, OrderId, ProductId, Quantity)
VALUES (29, 4, 2, 3);  

INSERT INTO OrderDetails (OrderDetailId, OrderId, ProductId, Quantity)
VALUES (30, 4, 9, 1); 

INSERT INTO OrderDetails (OrderDetailId, OrderId, ProductId, Quantity)
VALUES (31, 6, 6, 2);  

INSERT INTO OrderDetails (OrderDetailId, OrderId, ProductId, Quantity)
VALUES (32, 7, 2, 3);  

INSERT INTO OrderDetails (OrderDetailId, OrderId, ProductId, Quantity)
VALUES (33, 8, 14, 2);  

INSERT INTO OrderDetails (OrderDetailId, OrderId, ProductId, Quantity)
VALUES (34, 9, 11, 2);

INSERT INTO OrderDetails (OrderDetailId, OrderId, ProductId, Quantity)
VALUES (35, 9, 15, 3);  

INSERT INTO OrderDetails (OrderDetailId, OrderId, ProductId, Quantity)
VALUES (36, 11, 16, 2);

INSERT INTO OrderDetails (OrderDetailId, OrderId, ProductId, Quantity)
VALUES (37, 12, 9, 1);

INSERT INTO OrderDetails (OrderDetailId, OrderId, ProductId, Quantity)
VALUES (38, 13, 19, 4); 

INSERT INTO OrderDetails (OrderDetailId, OrderId, ProductId, Quantity)
VALUES (39, 14, 1, 2); 

INSERT INTO OrderDetails (OrderDetailId, OrderId, ProductId, Quantity)
VALUES (40, 15, 17, 3); 

INSERT INTO OrderDetails (OrderDetailId, OrderId, ProductId, Quantity)
VALUES (41, 15, 14, 3); 

INSERT INTO OrderDetails (OrderDetailId, OrderId, ProductId, Quantity)
VALUES (42, 17, 5, 1); 

INSERT INTO OrderDetails (OrderDetailId, OrderId, ProductId, Quantity)
VALUES (43, 18, 8, 4); 

INSERT INTO OrderDetails (OrderDetailId, OrderId, ProductId, Quantity)
VALUES (44, 20, 16, 1); 

INSERT INTO OrderDetails (OrderDetailId, OrderId, ProductId, Quantity)
VALUES (45, 20, 3, 4);

INSERT INTO OrderDetails (OrderDetailId, OrderId, ProductId, Quantity)
VALUES (46, 21, 13, 2);

INSERT INTO OrderDetails (OrderDetailId, OrderId, ProductId, Quantity)
VALUES (47, 22, 14, 1); 

INSERT INTO OrderDetails (OrderDetailId, OrderId, ProductId, Quantity)
VALUES (48, 22, 2, 1);

INSERT INTO OrderDetails (OrderDetailId, OrderId, ProductId, Quantity)
VALUES (49, 24, 10, 2); 

INSERT INTO OrderDetails (OrderDetailId, OrderId, ProductId, Quantity)
VALUES (50, 25, 17, 3);  

INSERT INTO OrderDetails (OrderDetailId, OrderId, ProductId, Quantity)
VALUES (51, 26, 11, 4);

select * from OrderDetails;

-------------------------------------------------------------------------

INSERT INTO Inventory (InventoryId, ProductId, QuantityInStock, LastStockUpdate)
VALUES (1, 1, 150, '2024-09-15 14:00:00');  -- Inventory for Smartphone

INSERT INTO Inventory (InventoryId, ProductId, QuantityInStock, LastStockUpdate)
VALUES (2, 2, 80, '2024-09-10 10:30:00');  -- Inventory for Laptop

INSERT INTO Inventory (InventoryId, ProductId, QuantityInStock, LastStockUpdate)
VALUES (3, 3, 200, '2024-09-12 11:45:00');  -- Inventory for Smartwatch

INSERT INTO Inventory (InventoryId, ProductId, QuantityInStock, LastStockUpdate)
VALUES (4, 4, 120, '2024-09-18 16:10:00');  -- Inventory for Tablet

INSERT INTO Inventory (InventoryId, ProductId, QuantityInStock, LastStockUpdate)
VALUES (5, 5, 180, '2024-09-20 12:30:00');  -- Inventory for Bluetooth Speakers

INSERT INTO Inventory (InventoryId, ProductId, QuantityInStock, LastStockUpdate)
VALUES (6, 6, 90, '2024-09-15 09:00:00');  -- Inventory for Wireless Headphones

INSERT INTO Inventory (InventoryId, ProductId, QuantityInStock, LastStockUpdate)
VALUES (7, 7, 50, '2024-09-14 13:25:00');  -- Inventory for Smart TV

INSERT INTO Inventory (InventoryId, ProductId, QuantityInStock, LastStockUpdate)
VALUES (8, 8, 75, '2024-09-17 11:10:00');  -- Inventory for Gaming Console

INSERT INTO Inventory (InventoryId, ProductId, QuantityInStock, LastStockUpdate)
VALUES (9, 9, 45, '2024-09-19 15:50:00');  -- Inventory for Camera

INSERT INTO Inventory (InventoryId, ProductId, QuantityInStock, LastStockUpdate)
VALUES (10, 10, 95, '2024-09-13 08:40:00');  -- Inventory for External Hard Drive

INSERT INTO Inventory (InventoryId, ProductId, QuantityInStock, LastStockUpdate)
VALUES (11, 11, 160, '2024-09-11 10:20:00');  -- Inventory for Fitness Tracker

INSERT INTO Inventory (InventoryId, ProductId, QuantityInStock, LastStockUpdate)
VALUES (12, 12, 250, '2024-09-21 13:00:00');  -- Inventory for Bluetooth Earbuds

INSERT INTO Inventory (InventoryId, ProductId, QuantityInStock, LastStockUpdate)
VALUES (13, 13, 300, '2024-09-16 09:30:00');  -- Inventory for Wireless Mouse

INSERT INTO Inventory (InventoryId, ProductId, QuantityInStock, LastStockUpdate)
VALUES (14, 14, 125, '2024-09-20 17:00:00');  -- Inventory for Mechanical Keyboard

INSERT INTO Inventory (InventoryId, ProductId, QuantityInStock, LastStockUpdate)
VALUES (15, 15, 400, '2024-09-10 14:20:00');  -- Inventory for Portable Charger

INSERT INTO Inventory (InventoryId, ProductId, QuantityInStock, LastStockUpdate)
VALUES (16, 16, 30, '2024-09-18 18:45:00');  -- Inventory for Drone

INSERT INTO Inventory (InventoryId, ProductId, QuantityInStock, LastStockUpdate)
VALUES (17, 17, 70, '2024-09-19 12:35:00');  -- Inventory for VR Headset

INSERT INTO Inventory (InventoryId, ProductId, QuantityInStock, LastStockUpdate)
VALUES (18, 18, 85, '2024-09-22 14:55:00');  -- Inventory for Smart Home Hub

INSERT INTO Inventory (InventoryId, ProductId, QuantityInStock, LastStockUpdate)
VALUES (19, 19, 110, '2024-09-11 10:50:00');  -- Inventory for Smart Doorbell

INSERT INTO Inventory (InventoryId, ProductId, QuantityInStock, LastStockUpdate)
VALUES (20, 20, 95, '2024-09-13 13:15:00');  -- Inventory for Action Camera

select * from Inventory;
