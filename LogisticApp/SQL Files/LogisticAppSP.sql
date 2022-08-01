
create proc sp_getAllTripDetails
  
As
Begin
   Begin Try

   select * from Trip
  End Try
  Begin Catch
  
	-- Catching the exception and sending it out from SP
	Select ERROR_NUMBER() as Error_Number,
		   ERROR_MESSAGE() as Error_Message,
		   ERROR_SEVERITY() as Error_Severity,
		   ERROR_STATE() as Error_State;
  End Catch
End;
Go

create proc sp_ownTruckTrips
@BeginDate DateTime, @EndDate DateTime
As
Begin
   Begin Try	

   select * from trip inner join Trucks on trip.truckID = Trucks.truckID  where vendorID = 1 and trip.dateEnded between @BeginDate and @EndDate

  End Try
  Begin Catch
  
	-- Catching the exception and sending it out from SP
	Select ERROR_NUMBER() as Error_Number,
		   ERROR_MESSAGE() as Error_Message,
		   ERROR_SEVERITY() as Error_Severity,
		   ERROR_STATE() as Error_State;
  End Catch
End;
Go


create proc sp_vendorTruckTrips
@BeginDate DateTime, @EndDate DateTime
As
Begin
   Begin Try	

   select * from trip inner join Trucks on trip.truckID = Trucks.truckID  where vendorID != 1 and trip.dateEnded between @BeginDate and @EndDate

  End Try
  Begin Catch
  
	-- Catching the exception and sending it out from SP
	Select ERROR_NUMBER() as Error_Number,
		   ERROR_MESSAGE() as Error_Message,
		   ERROR_SEVERITY() as Error_Severity,
		   ERROR_STATE() as Error_State;
  End Catch
End;
Go


create proc sp_truckWiseTrips
@BeginDate DateTime, @EndDate DateTime, @TruckID varchar(10)
As
Begin
   Begin Try	

   select * from trip inner join Trucks on trip.truckID = Trucks.truckID  where trip.truckID = @TruckID and trip.dateEnded between @BeginDate and @EndDate

  End Try
  Begin Catch
  
	-- Catching the exception and sending it out from SP
	Select ERROR_NUMBER() as Error_Number,
		   ERROR_MESSAGE() as Error_Message,
		   ERROR_SEVERITY() as Error_Severity,
		   ERROR_STATE() as Error_State;
  End Catch
End;
Go


create proc sp_vendorWiseTrips
@BeginDate DateTime, @EndDate DateTime, @VendorID int
As
Begin
   Begin Try	

   select * from trip inner join Trucks on trip.truckID = Trucks.truckID  where vendorID = @VendorID and trip.dateEnded between @BeginDate and @EndDate

  End Try
  Begin Catch
  
	-- Catching the exception and sending it out from SP
	Select ERROR_NUMBER() as Error_Number,
		   ERROR_MESSAGE() as Error_Message,
		   ERROR_SEVERITY() as Error_Severity,
		   ERROR_STATE() as Error_State;
  End Catch
End;
Go

create proc sp_driverWiseTrips
@BeginDate DateTime, @EndDate DateTime, @DriverID int
As
Begin
   Begin Try	

   select * from trip  where driverID = @DriverID and trip.dateEnded between @BeginDate and @EndDate

  End Try
  Begin Catch
  
	-- Catching the exception and sending it out from SP
	Select ERROR_NUMBER() as Error_Number,
		   ERROR_MESSAGE() as Error_Message,
		   ERROR_SEVERITY() as Error_Severity,
		   ERROR_STATE() as Error_State;
  End Catch
End;
Go

--drop proc sp_destinationWiseTrips
create proc sp_destinationWiseTrips
@BeginDate DateTime, @EndDate DateTime, @DestinationState varchar(20), @DestinationCity varchar(20)
As
Begin
   Begin Try	

   select trip.*, Destinations.destinationState, Destinations.destiantionCity from trip inner join Destinations on Trip.destinationID = Destinations.destinationID where Destinations.destinationState = @DestinationState and Destinations.destiantionCity = @DestinationCity and Trip.dateEnded between  @BeginDate and @EndDate

  End Try
  Begin Catch
  
	-- Catching the exception and sending it out from SP
	Select ERROR_NUMBER() as Error_Number,
		   ERROR_MESSAGE() as Error_Message,
		   ERROR_SEVERITY() as Error_Severity,
		   ERROR_STATE() as Error_State;
  End Catch
End;
Go