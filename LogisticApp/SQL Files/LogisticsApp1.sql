Create Database LogisticsApp;

Use LogisticsApp;

--drop table Drivers;
Create Table Drivers(

driverID int primary key Identity(1,1),
driverName varchar(20),
driverContact varchar(15),
assignedTripID int default 0,
driverCharges int

);

--drop table Vendors;
Create table Vendors(

vendorId int primary key identity(1,1),
vendorName varchar(20),
vendorContact varchar(15),

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


--drop table Trips
Create table Trips(

tripID int primary key identity(1,1),
driverID int foreign key references Drivers(driverID),
truckID varchar(10) foreign key references Trucks(truckID),
dateStarted Datetime,
dateEnded Datetime,
extraDistance int,
tollCharges int,
maintainceCharges int,
extraCharges int,
status int default 0

);

--drop table summary
Create table summary(

summaryID int primary key identity(1,1),
tripID int foreign key references Trips(tripID),
fromABC int,
vendorCharges int,
driverCharges int,
extraCharges int,
profitLoss int

);


