USE [OnlineBusTicket]
Go
---- Get all list bus -----
alter proc sp_GetAllListBus
as
begin
	select top 5 b.ImageUrl,l.ListBusId,r.RoutesName,r.StartPlace,r.DestinationPlace,CONVERT(VARCHAR(10), l.Departure, 101) AS Departure ,CONVERT(VARCHAR(10), l.Arrival, 101) AS Arrival,l.Price,l.StartTime
	from [ListBus] l, [Routes] r, Bus b
	where l.RoutesId = r.RoutesId and l.BusId=b.BusId and r.[Status] = 1
	order by Departure;
end
Go
---- search list bus by start place-----
create proc sp_SearchListBus
@From nvarchar(50),
@To nvarchar(50),
@FromDate datetime,
@ToDate datetime 
as
begin
	select b.ImageUrl,l.ListBusId,r.StartPlace,r.DestinationPlace,CONVERT(VARCHAR(10), l.Departure, 101) AS Departure ,CONVERT(VARCHAR(10), l.Arrival, 101) AS Arrival,l.Price,l.StartTime,b.Seat
	from [ListBus] l, [Routes] r, Bus b
	where l.RoutesId = r.RoutesId and l.BusId=b.BusId and r.[Status] = 1 
	and r.StartPlace like @From
	and r.DestinationPlace like @To
	and Departure like @FromDate
	and Arrival like @ToDate;
end
Go
---- search list bus by to place ---
create proc sp_SearchListBusByToPlace
@To nvarchar(100) 
as
begin
	select b.ImageUrl,l.ListBusId,r.StartPlace,r.DestinationPlace,CONVERT(VARCHAR(10), l.Departure, 101) AS Departure ,CONVERT(VARCHAR(10), l.Arrival, 101) AS Arrival,l.Price,l.StartTime,b.Seat
	from [ListBus] l, [Routes] r, Bus b
	where l.RoutesId = r.RoutesId and l.BusId=b.BusId and r.[Status] = 1 and r.StartPlace = @To;
end