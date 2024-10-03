---TASK 2------------

--1--
SELECT CONCAT(FirstName, ' ', LastName) AS Name, Email
FROM Customers; 
-----------------------------------------------------------

--2--
select orderId, orderDate , CONCAT(C.FirstName,' ',LastName) as CustomerName
FROM Orders as O JOIN Customers as C
ON O.CustomerId = C.CustomerId;
----------------------------------------------------------------------

--3--
INSERT INTO Customers (CustomerId ,FirstName , LastName , Email , [Address]) values 
(11,'Krishnay', 'Mudgal', 'krishnay@gmail.com','34C, YellowstonePark, USA');

select * from Customers;
-------------------------------------------------------------------------------------

--4--
Update Products 
SET Price= 1.1 * Price;

select * from products;
-------------------------------------------------------------------

--5--
select name from sys.foreign_keys              -- for identifying the name of foreign key
where parent_object_id = OBJECT_ID('OrderDetails');

Alter table OrderDetails
DROP CONSTRAINT FK__OrderDeta__Order__4316F928; --dropping old constriant

ALTER TABLE OrderDetails
ADD CONSTRAINT FK_OrderDetails_Orders
FOREIGN KEY (OrderId) REFERENCES Orders(OrderId) 
ON DELETE CASCADE;      --adding this so that On deleteing an order from orders table will also delete it from OrderDetails table

DECLARE @OrderId INT = 5;     --TAKING OrderId as a variable from user .Eg 5

DELETE FROM Orders
WHERE OrderId = @OrderId;           --this will also delete the orderdetails of this speceific @orderId
-------------------------------------------------------------------------------------------------------

--6--
INSERT INTO Orders Values (26,8,'2024-08-23',435.99);

select * from Orders;
--------------------------------------------------------------------------

--7--
-- Declare variables for the customer update
DECLARE @CustomerId INT;
DECLARE @NewEmail VARCHAR(50);
DECLARE @NewAddress VARCHAR(255);

-- Setting values for the variables
SET @CustomerId = 2;
SET @NewEmail = 'janeSmith@example.com';
SET @NewAddress = '123 Brooklyn High, NY, USA';

-- Performing the update
UPDATE Customers
SET Email = @NewEmail, 
    [Address] = @NewAddress
WHERE CustomerId = @CustomerId;

select * from Customers;
--------------------------------------------------

--8--
Update Orders
SET TotalAmount=COALESCE((
Select Sum(Od.Quantity *P.Price)
From OrderDetails Od
Join Products P
ON Od.ProductId=P.ProductId
Where Od.OrderId = Orders.OrderId
),0);

select * from Orders;
--------------------------------------------------------

--9--
DECLARE @CustId Int
SET @CustId = 2;

Delete from Orders
where CustomerId = @CustId;
--on delete cascade is applied on orderDetails so just have to delete from Orders Table
select * from Orders;
select * from OrderDetails;
--------------------------------------------------------

--10--
INSERT INTO Products values(21,'Samsung OTG','Type C OTG pendrive of 64 GB',879.99);
select * from Products;
----------------------------------------------------------

--11--
Alter table Orders
ADD Status varchar(20) NOT NULL DEFAULT 'Pending'
CHECK (Status IN ('Pending','Shipped','Delivered'));

DECLARE @OrdId int;
DECLARE @Status varchar(20);

SET @OrdId = 5
SET @STATUS ='Shipped'

Update Orders
Set Orders.Status=@Status
where OrderId=@OrdId;

select * from Orders;
-----------------------------------------------------------

--12--
Alter table Customers
ADD TotalOrdersPlaced INT DEFAULT 0;

Update Customers
set TotalOrdersPlaced = (
select count(*)
from orders
where Orders.CustomerId = Customers.CustomerId
);

select * from Customers;

---------------------------------------------------------------------------------