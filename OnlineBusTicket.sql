USE OnlineBusTicket

GO

----------------------------Create proc sp_GetAllBusRouter
	CREATE PROC [dbo].[sp_GetAllListBusTop]
	AS
	BEGIN
		SELECT TOP 5 lb.ListBusID, r.RoutesId,r.StartPlace,r.DestinationPlace, t.TypeImage, lb.Departure, lb.Price,lb.StartTime 
		FROM ListBus lb, [Routes] r, Bus b, [Type] t
		WHERE lb.RoutesId = r.RoutesId and b.BusId = lb.BusId and t.TypeId = b.TypeId
		GROUP BY lb.ListBusID, r.RoutesId,r.StartPlace,r.DestinationPlace, t.TypeImage, lb.Departure, lb.Price,lb.StartTime 
		HAVING COUNT(lb.ListBusID) > 0
	END

GO

----------------------------Create proc sp_GetAllPlace
	CREATE PROC [dbo].[sp_GetAllPlace]
	AS
	BEGIN
		SELECT * FROM Place
	END
	
Go
------- search list bus ----
CREATE PROC sp_SearchListBus
	@FromPlace nvarchar(50),
	@ToPlace nvarchar(50),
	@StartDate datetime,
	@DueDate datetime
AS
BEGIN
	SELECT t.TypeImage,l.ListBusId,t.TypeName,l.Price,l.StartTime,l.Departure,l.Arrival,b.BusName,COUNT(l.ListBusID) as Seat
	FROM ListBus l, [Routes] r, Bus b, Seat s, [Type] t
	WHERE l.RoutesId = r.RoutesId and l.BusId = b.BusId and s.ListBusId = l.ListBusId and t.TypeId = b.TypeId
	AND s.Status = 0 
	AND StartPlace = @FromPlace
				and DestinationPlace = @ToPlace
				and Departure >= @StartDate
				and (@DueDate IS NULL OR Arrival < DATEADD(d, 1, @DueDate))
	GROUP BY t.TypeImage,l.ListBusId,t.TypeName,l.Price,l.StartTime,b.BusName,l.Departure,l.Arrival
		HAVING COUNT(l.ListBusID) > 0
END


go
------------ get seat ---------
CREATE PROC sp_GetAllSeat
@ListBusId int
AS
BEGIN
	SELECT * FROM Seat WHERE ListBusId = @ListBusId	
END

go
---------------get a list bus -----------
CREATE PROC sp_GetListBusByListBusId
@ListBusId int
AS
BEGIN
	SELECT t.TypeImage,l.ListBusId,t.TypeName,l.Price,l.StartTime,l.Departure,l.Arrival,b.BusName,l.BusPlate,r.RoutesName
	FROM ListBus l, [Routes] r,Bus b, [Type] t
	WHERE l.RoutesId = r.RoutesId and b.BusId = l.BusId and t.TypeId = b.TypeId
	and l.ListBusId = @ListBusId
END
go
---------------get a list bus -----------
CREATE PROC sp_GetAllPromote
AS
BEGIN
	SELECT * FROM Promote
END


Go
-----------------insert customer -----------
CREATE PROC sp_InsertCustomer
@CustomerName nvarchar(50),
@Phone nvarchar(50),
@Email nvarchar(50),
@Address nvarchar(200)
AS
BEGIN
	INSERT INTO Customer(CustomerName,Phone,Email,[Address]) VALUES(@CustomerName,@Phone,@Email,@Address)
	SELECT @@IDENTITY
END

INSERT INTO Customer(CustomerName,Phone,Email,[Address]) VALUES('tunglt','0982075306','gicungdc@gmail.com','ha noi')
	SELECT @@IDENTITY

Go
-----------------insert order -----------
CREATE PROC sp_InsertOrder
@CustomerId int,
@CreatDate datetime,
@TotalFees decimal(18,0),
@ShippingName nvarchar(50),
@ShippingAddress nvarchar(200),
@ShippingEmail nvarchar(50),
@ShippingPhone nvarchar(50)
AS
BEGIN
	INSERT INTO [Order](CustomerId,CreateDate,TotalFees,ShippingName,ShippingAddress,ShippingEmail,ShippingPhone,[Status]) VALUES(@CustomerId,@CreatDate,@TotalFees,@ShippingName,@ShippingAddress,@ShippingEmail,@ShippingPhone,'False')
	SELECT @@IDENTITY
END
INSERT INTO [Order](CustomerId,CreateDate,TotalFees,ShippingName,ShippingAddress,ShippingEmail,ShippingPhone,[Status]) VALUES(1,'2013-6-6',123,'thuypn','ha noi','123@gmail.com','123','False')
	SELECT @@IDENTITY
Go
-----------------insert order detail -----------
ALTER PROC sp_InsertOrderDetail
@OrderId int,
@NumberSeat int,
@ListBusId int,
@PromoteId int,
@Fees decimal(18,0)
AS
BEGIN
	INSERT INTO OrderDetail(OrdertId,NumberSeat,ListBusId,PromoteId,Fees) VALUES(@OrderId,@NumberSeat,@ListBusId,@PromoteId,@Fees)
	exec sp_UpdateStatusSeat @ListBusID, @NumberSeat,True
END


go
---------------get discount -----------
CREATE PROC sp_GetDiscount
@PromoteId int
AS
BEGIN
	SELECT Discount FROM Promote WHERE PromoteId = @PromoteId
END

go
---------------get price -----------
CREATE PROC sp_GetPrice
@ListBusId int
AS
BEGIN
	SELECT Price FROM ListBus WHERE ListBusId = @ListBusId
END

Go
----------------------------Create proc sp_GetAllSeatByBusRouter
	CREATE PROC [dbo].[sp_UpdateStatusSeat]
	@ListBusID int,
	@NumberSeat int,
	@Status bit
	AS
	BEGIN
		UPDATE Seat SET [Status] = @Status WHERE ListBusID = @ListBusID AND NumberSeat = @NumberSeat
	END
Go

------------get acc id by username----
CREATE PROC sp_GetAccountIdByUsername
@UserName nvarchar(50)
AS
BEGIN
	SELECT AccountId FROM Account WHERE UserName = @UserName
END
Go
------------ login ---
CREATE PROC sp_Login
@UserName nvarchar(50),
@Password nvarchar(50)
AS
BEGIN
	SELECT RoleId FROM Account WHERE UserName = @UserName AND [Password] = @Password
END

Go
------------ get all order ---
CREATE PROC sp_GetAllOrder
AS
BEGIN
	SELECT o.CreateDate,c.CustomerId,o.OrderId,o.TotalFees,o.[Status],c.CustomerName FROM [Order] o,Customer c
	WHERE o.CustomerId = c.CustomerId
END
Go
------------ get all order by status ---
CREATE PROC sp_GetAllOrderByStatus
@Status int
AS
BEGIN
	SELECT o.CreateDate,c.CustomerId,o.OrderId,o.TotalFees,o.[Status],c.CustomerName FROM [Order] o,Customer c
	WHERE o.CustomerId = c.CustomerId AND o.[Status] = @Status
END

Go
------------ get all order by order id ---
CREATE PROC sp_GetAllOrderByOrderId
@OrderId nvarchar(50)
AS
BEGIN
	SELECT o.CreateDate,c.CustomerId,o.OrderId,o.TotalFees,o.[Status],c.CustomerName FROM [Order] o,Customer c
	WHERE o.CustomerId = c.CustomerId AND o.OrderId = @OrderId
END

Go
------------ get all order by customer name ---
CREATE PROC sp_GetAllOrderByCustomerName
@CustomerName nvarchar(50)
AS
BEGIN
	SELECT o.CreateDate,c.CustomerId,o.OrderId,o.TotalFees,o.[Status],c.CustomerName FROM [Order] o,Customer c
	WHERE o.CustomerId = c.CustomerId AND c.CustomerName = @CustomerName
END

Go
------------ get all order by customer email ---
CREATE PROC sp_GetAllOrderByCustomerEmail
@Email nvarchar(50)
AS
BEGIN
	SELECT o.CreateDate,c.CustomerId,o.OrderId,o.TotalFees,o.[Status],c.CustomerName FROM [Order] o,Customer c
	WHERE o.CustomerId = c.CustomerId AND c.Email = @Email
END


Go
------ get order detail -----
CREATE PROC sp_GetOrderDetail
AS
BEGIN
	SELECT * FROM Customer c,[Order] o,OrderDetail od 
	WHERE c.CustomerId = o.CustomerId AND o.OrderId = od.OrdertId	
END
Go
------------ Update status order -----
CREATE PROC sp_UpdateStatusOrder
@Status int,
@OrderId int
AS
BEGIN
	UPDATE [Order] SET [Status] = @Status WHERE OrderId = @OrderId	
END

Go


------------ Del order -----
CREATE PROC sp_DeleteOrder
@OrderId int
AS
BEGIN
	DELETE [Order] WHERE OrderId = @OrderId	
END

Go
------------ get all order by top day ticket ---
CREATE PROC sp_GetAllOrderByTopDayTicket
@CreatDate datetime
AS
BEGIN
	SELECT o.CreateDate,c.CustomerId,o.OrderId,o.TotalFees,o.[Status],c.CustomerName FROM [Order] o,Customer c
	WHERE o.CustomerId = c.CustomerId AND o.CreateDate = @CreatDate
END



Go
------------ get all order by top day ticket ---
ALTER PROC sp_GetAllListBusByTopDay
@CreatDate datetime
AS
BEGIN
	SELECT TOP 1 lb.ListBusId,lb.BusPlate,lb.Departure, lb.Arrival,r.RoutesName,lb.Price,COUNT(NumberSeat) AS Quantity, SUM(od.Fees) AS ToTalFees, SUM(lb.Price) AS TotalPrice
	FROM OrderDetail od,[Order] o,ListBus lb,[Routes] r
	WHERE od.OrdertId = o.OrderId AND od.ListBusId = lb.ListBusId AND r.RoutesId = lb.RoutesId
	AND o.CreateDate = @CreatDate
	AND o.[Status] = 1 GROUP BY lb.ListBusId,lb.BusPlate,lb.Departure,lb.Arrival,r.RoutesName,lb.Price
	ORDER BY COUNT(NumberSeat) DESC 
END



Go
------------ get all order by top month ticket ---
CREATE PROC sp_GetAllListBusByTopMonth
@Year int,
@Month int
AS
BEGIN
	SELECT TOP 1 lb.ListBusId,lb.BusPlate,lb.Departure, lb.Arrival,r.RoutesName,lb.Price,COUNT(NumberSeat) AS Quantity, SUM(od.Fees) AS ToTalFees, SUM(lb.Price) AS TotalPrice
	FROM OrderDetail od,[Order] o,ListBus lb,[Routes] r
	WHERE od.OrdertId = o.OrderId AND od.ListBusId = lb.ListBusId AND r.RoutesId = lb.RoutesId
	AND Year(o.CreateDate) = @Year AND MONTH(o.CreateDate) = @Month
	AND o.[Status] = 1 GROUP BY lb.ListBusId,lb.BusPlate,lb.Departure,lb.Arrival,r.RoutesName,lb.Price
	ORDER BY COUNT(NumberSeat) DESC 
END



Go
------------ get all order by top year ticket ---
Alter PROC sp_GetAllListBusByTopYear
@Year int
AS
BEGIN
	SELECT TOP 1 lb.ListBusId,lb.BusPlate,lb.Departure, lb.Arrival,r.RoutesName,lb.Price,COUNT(NumberSeat) AS Quantity, SUM(od.Fees) AS ToTalFees, SUM(lb.Price) AS TotalPrice
	FROM OrderDetail od,[Order] o,ListBus lb,[Routes] r
	WHERE od.OrdertId = o.OrderId AND od.ListBusId = lb.ListBusId AND r.RoutesId = lb.RoutesId
	AND Year(o.CreateDate) = @Year
	AND o.[Status] = 1 GROUP BY lb.ListBusId,lb.BusPlate,lb.Departure,lb.Arrival,r.RoutesName,lb.Price
	ORDER BY COUNT(NumberSeat) DESC 
END


Go
------------ get all order by top  ---
CREATE PROC sp_GetAllListBusByTop
AS
BEGIN
	SELECT TOP 1 lb.ListBusId,lb.BusPlate,lb.Departure, lb.Arrival,r.RoutesName,lb.Price,COUNT(NumberSeat) AS Quantity, SUM(od.Fees) AS ToTalFees, SUM(lb.Price) AS TotalPrice
	FROM OrderDetail od,[Order] o,ListBus lb,[Routes] r
	WHERE od.OrdertId = o.OrderId AND od.ListBusId = lb.ListBusId AND r.RoutesId = lb.RoutesId
	AND o.[Status] = 1 GROUP BY lb.ListBusId,lb.BusPlate,lb.Departure,lb.Arrival,r.RoutesName,lb.Price
	ORDER BY COUNT(NumberSeat) DESC 
END

Go
------------ get all order by day  ---
CREATE PROC sp_GetAllOrderByDay
@CreateDate datetime
AS
BEGIN
	SELECT o.AccountId,o.CreateDate,c.CustomerId,o.OrderId,o.TotalFees,o.[Status],c.CustomerName,COUNT(od.NumberSeat) AS Quantity FROM [Order] o,Customer c, OrderDetail od
	WHERE o.CustomerId = c.CustomerId AND od.OrdertId = o.OrderId AND o.[Status] = 1
	AND o.CreateDate = @CreateDate
	GROUP BY o.AccountId,o.CreateDate,c.CustomerId,o.OrderId,o.TotalFees,o.[Status],c.CustomerName
END


Go
------------ get all order by month  ---
CREATE PROC sp_GetAllOrderByMonth
@Month int,
@Year int
AS
BEGIN
	SELECT o.AccountId,o.CreateDate,c.CustomerId,o.OrderId,o.TotalFees,o.[Status],c.CustomerName,COUNT(od.NumberSeat) AS Quantity FROM [Order] o,Customer c, OrderDetail od
	WHERE o.CustomerId = c.CustomerId AND od.OrdertId = o.OrderId AND o.[Status] = 1
	AND MONTH(o.CreateDate) = @Month AND YEAR(o.CreateDate) = @Year 
	GROUP BY o.AccountId,o.CreateDate,c.CustomerId,o.OrderId,o.TotalFees,o.[Status],c.CustomerName
END

Go
------------ get all order by Year  ---
CREATE PROC sp_GetAllOrderByYear
@Year int
AS
BEGIN
	SELECT o.AccountId,o.CreateDate,c.CustomerId,o.OrderId,o.TotalFees,o.[Status],c.CustomerName,COUNT(od.NumberSeat) AS Quantity FROM [Order] o,Customer c, OrderDetail od
	WHERE o.CustomerId = c.CustomerId AND od.OrdertId = o.OrderId AND o.[Status] = 1
	AND YEAR(o.CreateDate) = @Year 
	GROUP BY o.AccountId,o.CreateDate,c.CustomerId,o.OrderId,o.TotalFees,o.[Status],c.CustomerName
END

/************************* NEW *******************/

Go
----------- get oderdetail by oderId

CREATE PROC sp_GetOrderDetailByOderId
@OrderId int
AS
BEGIN
	SELECT od.OrderDetailId,od.Fees,od.NumberSeat,p.Discount,lb.BusPlate,lb.Departure,lb.Arrival,r.RoutesName 
	FROM OrderDetail od, ListBus lb, [Routes] r, Promote p
	WHERE od.ListBusId = lb.ListBusId AND r.RoutesId = lb.RoutesId
	AND p.PromoteId = od.PromoteId
	AND od.OrdertId = @OrderId
END
Go
----------- get oderdetail info by oderId

alter PROC sp_GetInfoOrderDetailByOrderId
@OrderId int
AS
BEGIN
	SELECT c.CustomerName,c.Email,c.[Address],c.Phone,o.ShippingName,o.ShippingAddress,o.ShippingEmail,o.ShippingPhone
	FROM Customer c, [Order] o
	WHERE c.CustomerId = o.CustomerId
	AND o.OrderId = @OrderId
END

Go

---------------- delete order ---------
ALTER PROC sp_DeleteOrder
@OrderId int
AS
BEGIN
	DELETE [Order] WHERE OrderId = @OrderId
	EXEC sp_DeleteOrderDetail @OrderId
END

GO

---------------- delete order detail---------
CREATE PROC sp_DeleteOrderDetail
@OrderId int
AS
BEGIN
	DELETE [OrderDetail] WHERE OrdertId = @OrderId
END

GO

---------------- update status order ---------
CREATE PROC sp_UpdateStatusOrder
@OrderId int,
@Status bit,
@UserName nvarchar(50)
AS
BEGIN
	Update [Order] SET [Status] = @Status,AccountId = (SELECT AccountId FROM Account WHERE UserName = @UserName)
	WHERE OrderId = @OrderId	
END