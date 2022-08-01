using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LogisticApp.Model.Entities
{
    public class Trip
    {

        public int tripId { get; set; }
        public int driverId { get; set; }
        public string truckId { get; set; }
        public DateTime dateStarted  { get; set; }
        public DateTime dateEnded { get; set; }
        public int extraDistance { get; set; }
        public int tollCharges { get; set; }
        public int maintananceCharges { get; set; }
        public int extraCharges { get; set; }
        public int status { get; set; }

        public int destinationID { get; set; }

    }
}