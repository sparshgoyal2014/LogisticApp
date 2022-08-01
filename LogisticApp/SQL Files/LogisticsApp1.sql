Create Database LogisticsApp;

Use LogisticsApp;

--drop table Drivers;
Create Table Drivers(

driverID int primary key Identity(1,1),
driverName varchar(20),
assignedTripID int default 0,
driverCharges int
);

--drop table Vendors;
Create table Vendors(

vendorId int primary key identity(1,1),
vendorName varchar(20),

);

--drop table Trucks;
Create table Trucks (

truckID varchar(10) primary key,
vendorID int foreign key references Vendors(vendorID),
assignedTripID int default 0,
costPerKM int,

);

--drop table Destinations
create table Destinations(

destinationID int primary key identity(1,1),
destinationState varchar(20),
destiantionCity varchar(20),
distance int,

);

insert into Destinations values('Haryana', 'Sirsa', 200);
insert into Destinations values('Punjab', 'Bathinda', 240);
insert into Destinations values('Punjab', 'Amritsar', 500);
insert into Destinations values('MadhyaPradesh', 'Indore', 400);
insert into Destinations values('Maharashtra', 'Mumbai', 700);

select * from Destinations
--drop table Trip
Create table Trip(

tripID int primary key identity(1,1),
driverID int foreign key references Drivers(driverID),
truckID varchar(10) foreign key references Trucks(truckID),
dateStarted Datetime,
dateEnded Datetime,
extraDistance int,
tollCharges int,
maintainceCharges int,
extraCharges int,
status int default 0,
destinationID int foreign key references Destinations(destinationID),

);

--insert into Trip values (1,'Trk1_YSV', '2022-07-11', '2022-07-12', 11, 550, 70, 0, 0, 1)
--insert into Trip values (3,'Trk2_YSV', '2022-07-9', '2022-07-20', 50, 2500, 100, 0, 0, 1)
--insert into Trip values (2,'Trk1_ven2', '2022-07-12', '2022-07-13', 9, 560, 200, 0, 0, 2)
--insert into Trip values (4,'Trk1_ven1', '2022-07-11', '2022-07-12', 12, 200, 300, 0, 0, 5)
--insert into Trip values (4,'Trk1_YSV', '2022-07-17', '2022-07-19', 5, 350, 0, 0, 0, 3)
--insert into Trip values (3,'Trk3_ven1', '2022-07-06', '2022-07-08', 0, 400, 1000, 0, 0, 5)
--insert into Trip values (2,'Trk2_ven1', '2022-07-11', '2022-07-12', 11, 1000, 50, 0, 0, 4)
--insert into Trip values (7,'Trk2_YSV', '2022-07-03', '2022-07-03', 15, 200, 500, 0, 0, 1)

--select * from trip
--drop table summary
Create table Summary(

summaryID int primary key identity(1,1),
tripID int foreign key references Trip(tripID),
fromABC int,
vendorCharges int,
driverCharges int,
extraCharges int,
profitLoss int
);

--insert into Drivers values('Tim',0, 40)
--insert into Drivers values('Jack', 0,60)
--insert into Drivers values('Ross', 0,80)
--insert into Drivers values( 'Frank', 0,30)
--insert into Drivers values( 'Drake', 0,50)
--insert into Drivers values( 'Walter', 0,40)

--select * from drivers


--insert into Vendors values ('YSV')
--insert into Vendors values ('ven1')
--insert into Vendors values ('ven2')
--insert into Vendors values ('ven3')
--insert into Vendors values ('ven4')

--select * from Vendors;


--insert into Trucks values ('Trk1_YSV', 1, 0, 50)
--insert into Trucks values ('Trk1_ven1', 2, 0, 60)
--insert into Trucks values ('Trk1_ven2', 3, 0, 70)
--insert into Trucks values ('Trk2_ven1', 2, 0, 60)
--insert into Trucks values ('Trk3_ven1', 2, 0, 60)
--insert into Trucks values ('Trk2_YSV', 1, 0, 50)

--select * from Trucks;

--select * from trip



select * from trip inner join Trucks on trip.truckID = Trucks.truckID  where vendorID = 1 and trip.dateEnded between '2020-01-01' and '2023-07-12'

Exec sp_getAllTripDetails 
Go

exec sp_ownTruckTrips @BeginDate = '2020-01-01', @EndDate = '2023-01-01'
GO

Exec sp_vendorTruckTrips @BeginDate = '2020-01-01', @EndDate = '2023-01-01'
Go


Exec sp_truckWiseTrips @BeginDate = '2020-01-01', @EndDate = '2023-01-01', @TruckID = 'Trk1_ven2'
Go



Exec sp_vendorWiseTrips @BeginDate = '2020-01-01', @EndDate = '2023-01-01', @VendorID = 3
Go


Exec sp_driverWiseTrips @BeginDate = '2020-01-01', @EndDate = '2023-01-01', @DriverID = 4
Go

exec sp_destinationWiseTrips @BeginDate = '2020-01-01', @EndDate = '2023-01-01', @DestinationState = 'Punjab', @DestinationCity = 'Bathinda'
GO
select * from trip 
inner join Trucks on trip.truckID = Trucks.truckID 
inner join Vendors on Vendors.VendorID = Trucks.vendorID where Trucks.vendorID = 1



--select * from Destinations where Drivers.driverID = 4;   -- error(we can only refer to columns in the table in the FROM clause) 