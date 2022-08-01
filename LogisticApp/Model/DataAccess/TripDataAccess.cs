using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data.SqlClient;
using LogisticApp.Model.Entities;

namespace LogisticApp.Model.DataAccess
{
    public class TripDataAccess
    {
        SqlConnection sqlConnection;
        SqlCommand sqlCommand;

        public TripDataAccess()
        {
            sqlConnection = new SqlConnection("Data Source=IN-DVTTJM3;Initial Catalog=LogisticsApp;Integrated Security=SSPI");
        }
        

        public void readFromReader(SqlDataReader reader, List<Trip> list)
        {

            while (reader.Read())
            {
                list.Add(new Trip()
                {

                    tripId = Convert.ToInt32(reader["tripId"]),
                    driverId = Convert.ToInt32(reader["driverId"]),
                    truckId = reader["truckId"].ToString(),
                    dateStarted = Convert.ToDateTime(reader["dateStarted"].ToString()),
                    dateEnded = Convert.ToDateTime(reader["dateEnded"].ToString()),
                    extraDistance = Convert.ToInt32(reader["extraDistance"]),
                    extraCharges = Convert.ToInt32(reader["extraCharges"]),
                    tollCharges = Convert.ToInt32(reader["tollCharges"]),
                    maintananceCharges = Convert.ToInt32(reader["maintainceCharges"]),
                    status = Convert.ToInt32(reader["status"]),
                    destinationID = Convert.ToInt32(reader["destinationID"])
                });
            }



        }


        public IEnumerable<Trip> getRecordsBetweenTwoDate(string command)
        {

            List<Trip> trips = new List<Trip>();
            try
            {

                sqlConnection.Open();
                sqlCommand = new SqlCommand();
                sqlCommand.Connection = sqlConnection;
                sqlCommand.CommandType = System.Data.CommandType.Text;
                //sqlCommand.CommandText = $"Select * from Trip where Trip.dateEnded between '{eDate1.Year}-{eDate1.Month}-{eDate1.Day}' and '{eDate2.Year}-{eDate2.Month}-{eDate2.Day}'";
                //sqlCommand.CommandText = $"Select * from Trip where Trip.dateEnded between '2020-01-01' and '2023-01-01'";
                sqlCommand.CommandText = command;

                SqlDataReader reader = sqlCommand.ExecuteReader();

                readFromReader(reader, trips);


                reader.Close();
            }
            catch (Exception e)
            {
                throw e;
            }
            finally
            {
                sqlConnection.Close();
            }

            return trips;

        }

        public IEnumerable<Trip> getAllRecords()
        {
            List<Trip> trips = new List<Trip>();
            try
            {

                sqlConnection.Open();
                sqlCommand = new SqlCommand();
                sqlCommand.Connection = sqlConnection;
                sqlCommand.CommandType = System.Data.CommandType.StoredProcedure;
                //sqlCommand.CommandText = "Select * from Trip";
                //sqlCommand.CommandText = "Exec sp_getAllTripDetails @beginDate='2020-01-01', @EndDate = '2022-07-12'";
                sqlCommand.CommandText = "sp_getAllTripDetails";

                SqlDataReader reader = sqlCommand.ExecuteReader();


                readFromReader(reader, trips);

                reader.Close();
            }
            catch (Exception e)
            {
                throw e;
            }
            finally
            {
                sqlConnection.Close();
            }

            return trips;
        }

        public IEnumerable<Trip> getOwntruckTrips(DateTime beginDate, DateTime endDate)
        {

            List<Trip> trips = new List<Trip>();
            try
            {
                sqlConnection.Open();
                sqlCommand = new SqlCommand();
                sqlCommand.Connection = sqlConnection;
                sqlCommand.CommandType = System.Data.CommandType.StoredProcedure;
                sqlCommand.CommandText = "sp_ownTruckTrips";

                // Define Parameters Here
                SqlParameter pBeginDate = new SqlParameter();
                pBeginDate.ParameterName = "@BeginDate";
                pBeginDate.DbType = System.Data.DbType.DateTime;
                pBeginDate.Direction = System.Data.ParameterDirection.Input;
                pBeginDate.Value = beginDate;

                SqlParameter pEndDate = new SqlParameter();
                pEndDate.ParameterName = "@EndDate";
                pEndDate.DbType = System.Data.DbType.DateTime;
                pEndDate.Direction = System.Data.ParameterDirection.Input;
                pEndDate.Value = endDate;

               

                // Add these parameters into the Parameters Collection of the SqlCommand Object
                sqlCommand.Parameters.AddRange(new SqlParameter[] { pBeginDate, pEndDate});

                SqlDataReader reader = sqlCommand.ExecuteReader();


                readFromReader(reader, trips);

                reader.Close();


            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error while reading all records: {ex.Message}");
            }
            finally
            {
                sqlConnection.Close();
            }
            return trips;

        }

        public IEnumerable<Trip> getVendortrucktrips(DateTime beginDate, DateTime endDate)
        {

            List<Trip> trips = new List<Trip>();
            try
            {
                sqlConnection.Open();
                sqlCommand = new SqlCommand();
                sqlCommand.Connection = sqlConnection;
                sqlCommand.CommandType = System.Data.CommandType.StoredProcedure;
                sqlCommand.CommandText = "sp_vendorTruckTrips";

                // Define Parameters Here
                SqlParameter pBeginDate = new SqlParameter();
                pBeginDate.ParameterName = "@BeginDate";
                pBeginDate.DbType = System.Data.DbType.DateTime;
                pBeginDate.Direction = System.Data.ParameterDirection.Input;
                pBeginDate.Value = beginDate;

                SqlParameter pEndDate = new SqlParameter();
                pEndDate.ParameterName = "@EndDate";
                pEndDate.DbType = System.Data.DbType.DateTime;
                pEndDate.Direction = System.Data.ParameterDirection.Input;
                pEndDate.Value = endDate;



                // Add these parameters into the Parameters Collection of the SqlCommand Object
                sqlCommand.Parameters.AddRange(new SqlParameter[] { pBeginDate, pEndDate });

                SqlDataReader reader = sqlCommand.ExecuteReader();


                readFromReader(reader, trips);

                reader.Close();


            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error while reading all records: {ex.Message}");
            }
            finally
            {
                sqlConnection.Close();
            }
            return trips;

        }

        public IEnumerable<Trip> gettruckWisetrips(DateTime beginDate, DateTime endDate, string truckID)
        {

            List<Trip> trips = new List<Trip>();
            try
            {
                sqlConnection.Open();
                sqlCommand = new SqlCommand();
                sqlCommand.Connection = sqlConnection;
                sqlCommand.CommandType = System.Data.CommandType.StoredProcedure;
                sqlCommand.CommandText = "sp_truckWiseTrips";

                // Define Parameters Here
                SqlParameter pBeginDate = new SqlParameter();
                pBeginDate.ParameterName = "@BeginDate";
                pBeginDate.DbType = System.Data.DbType.DateTime;
                pBeginDate.Direction = System.Data.ParameterDirection.Input;
                pBeginDate.Value = beginDate;

                SqlParameter pEndDate = new SqlParameter();
                pEndDate.ParameterName = "@EndDate";
                pEndDate.DbType = System.Data.DbType.DateTime;
                pEndDate.Direction = System.Data.ParameterDirection.Input;
                pEndDate.Value = endDate;

                SqlParameter pTruckID = new SqlParameter();
                pTruckID.ParameterName = "@TruckID";
                pTruckID.DbType = System.Data.DbType.String;
                pTruckID.Direction = System.Data.ParameterDirection.Input;
                pTruckID.Value = truckID;



                // Add these parameters into the Parameters Collection of the SqlCommand Object
                sqlCommand.Parameters.AddRange(new SqlParameter[] { pBeginDate, pEndDate, pTruckID });

                SqlDataReader reader = sqlCommand.ExecuteReader();


                readFromReader(reader, trips);

                reader.Close();


            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error while reading all records: {ex.Message}");
            }
            finally
            {
                sqlConnection.Close();
            }
            return trips;

        }


        public IEnumerable<Trip> getVendorWisetrips(DateTime beginDate, DateTime endDate, int vendorID)
        {

            List<Trip> trips = new List<Trip>();
            try
            {
                sqlConnection.Open();
                sqlCommand = new SqlCommand();
                sqlCommand.Connection = sqlConnection;
                sqlCommand.CommandType = System.Data.CommandType.StoredProcedure;
                sqlCommand.CommandText = "sp_vendorWiseTrips";

                // Define Parameters Here
                SqlParameter pBeginDate = new SqlParameter();
                pBeginDate.ParameterName = "@BeginDate";
                pBeginDate.DbType = System.Data.DbType.DateTime;
                pBeginDate.Direction = System.Data.ParameterDirection.Input;
                pBeginDate.Value = beginDate;

                SqlParameter pEndDate = new SqlParameter();
                pEndDate.ParameterName = "@EndDate";
                pEndDate.DbType = System.Data.DbType.DateTime;
                pEndDate.Direction = System.Data.ParameterDirection.Input;
                pEndDate.Value = endDate;

                SqlParameter pVendorID = new SqlParameter();
                pVendorID.ParameterName = "@VendorID";
                pVendorID.DbType = System.Data.DbType.Int32;
                pVendorID.Direction = System.Data.ParameterDirection.Input;
                pVendorID.Value = vendorID;



                // Add these parameters into the Parameters Collection of the SqlCommand Object
                sqlCommand.Parameters.AddRange(new SqlParameter[] { pBeginDate, pEndDate, pVendorID });

                SqlDataReader reader = sqlCommand.ExecuteReader();


                readFromReader(reader, trips);

                reader.Close();


            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error while reading all records: {ex.Message}");
            }
            finally
            {
                sqlConnection.Close();
            }
            return trips;

        }

        public IEnumerable<Trip> getDriverWisetrips(DateTime beginDate, DateTime endDate, int DriverID)
        {

            List<Trip> trips = new List<Trip>();
            try
            {
                sqlConnection.Open();
                sqlCommand = new SqlCommand();
                sqlCommand.Connection = sqlConnection;
                sqlCommand.CommandType = System.Data.CommandType.StoredProcedure;
                sqlCommand.CommandText = "sp_driverWiseTrips";

                // Define Parameters Here
                SqlParameter pBeginDate = new SqlParameter();
                pBeginDate.ParameterName = "@BeginDate";
                pBeginDate.DbType = System.Data.DbType.DateTime;
                pBeginDate.Direction = System.Data.ParameterDirection.Input;
                pBeginDate.Value = beginDate;

                SqlParameter pEndDate = new SqlParameter();
                pEndDate.ParameterName = "@EndDate";
                pEndDate.DbType = System.Data.DbType.DateTime;
                pEndDate.Direction = System.Data.ParameterDirection.Input;
                pEndDate.Value = endDate;

                SqlParameter pDriverID = new SqlParameter();
                pDriverID.ParameterName = "@DriverID";
                pDriverID.DbType = System.Data.DbType.Int32;
                pDriverID.Direction = System.Data.ParameterDirection.Input;
                pDriverID.Value = DriverID;



                // Add these parameters into the Parameters Collection of the SqlCommand Object
                sqlCommand.Parameters.AddRange(new SqlParameter[] { pBeginDate, pEndDate, pDriverID });

                SqlDataReader reader = sqlCommand.ExecuteReader();


                readFromReader(reader, trips);

                reader.Close();


            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error while reading all records: {ex.Message}");
            }
            finally
            {
                sqlConnection.Close();
            }
            return trips;

        }


        public IEnumerable<Trip> getdestinationWisetrips(DateTime beginDate, DateTime endDate, string stateName, string cityName)
        {

            List<Trip> trips = new List<Trip>();
            try
            {
                sqlConnection.Open();
                sqlCommand = new SqlCommand();
                sqlCommand.Connection = sqlConnection;
                sqlCommand.CommandType = System.Data.CommandType.StoredProcedure;
                sqlCommand.CommandText = "sp_destinationWiseTrips";

                // Define Parameters Here
                SqlParameter pBeginDate = new SqlParameter();
                pBeginDate.ParameterName = "@BeginDate";
                pBeginDate.DbType = System.Data.DbType.DateTime;
                pBeginDate.Direction = System.Data.ParameterDirection.Input;
                pBeginDate.Value = beginDate;

                SqlParameter pEndDate = new SqlParameter();
                pEndDate.ParameterName = "@EndDate";
                pEndDate.DbType = System.Data.DbType.DateTime;
                pEndDate.Direction = System.Data.ParameterDirection.Input;
                pEndDate.Value = endDate;

                SqlParameter pStateName = new SqlParameter();
                pStateName.ParameterName = "@DestinationState";
                pStateName.DbType = System.Data.DbType.String;
                pStateName.Direction = System.Data.ParameterDirection.Input;
                pStateName.Value = stateName;

                SqlParameter pCityName = new SqlParameter();
                pCityName.ParameterName = "@DestinationCity";
                pCityName.DbType = System.Data.DbType.String;
                pCityName.Direction = System.Data.ParameterDirection.Input;
                pCityName.Value = cityName;


                // Add these parameters into the Parameters Collection of the SqlCommand Object
                sqlCommand.Parameters.AddRange(new SqlParameter[] { pBeginDate, pEndDate, pStateName, pCityName });

                SqlDataReader reader = sqlCommand.ExecuteReader();


                readFromReader(reader, trips);

                reader.Close();


            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error while reading all records: {ex.Message}");
            }
            finally
            {
                sqlConnection.Close();
            }
            return trips;

        }


    }
}