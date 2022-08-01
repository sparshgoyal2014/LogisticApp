using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LogisticApp.Model.DataAccess;
using LogisticApp.Model.Entities;
namespace LogisticApp
{
    public partial class TripQuery : System.Web.UI.Page
    {
        TripDataAccess tripDataAccess;

        protected void Page_Load(object sender, EventArgs e)
        {
            tripDataAccess = new TripDataAccess();



            //if (!IsPostBack)
            //{
            //    Loader();
            //}

        }

        protected void btn_getOnClick(Object o, EventArgs e)
        {
            var eDate1 = Convert.ToDateTime(sDate.Value);
            var eDate2 = Convert.ToDateTime(eDate.Value);
            Loader(tripDataAccess.getOwntruckTrips(eDate1, eDate2));
        }

        //protected void btn_getOnClick(Object o, EventArgs e)
        //{
        //    var eDate1 = Convert.ToDateTime(sDate.Value);
        //    var eDate2 = Convert.ToDateTime(eDate.Value);
        //    Loader($"Select * from Trip where Trip.dateEnded between '{eDate1.Year}-{eDate1.Month}-{eDate1.Day}' and '{eDate2.Year}-{eDate2.Month}-{eDate2.Day}'");
        //}

        protected void btn_getOnClick2(Object o, EventArgs e)
        {
            var eDate1 = Convert.ToDateTime(sDate2.Value);
            var eDat2 = Convert.ToDateTime(eDate2.Value);
            string trk = input_trkId.Text;
            Loader(tripDataAccess.gettruckWisetrips(eDate1, eDat2, trk));

            //Loader($"Select * from Trip where trip.truckId = '{trk}' and Trip.dateEnded between '{eDate1.Year}-{eDate1.Month}-{eDate1.Day}' and '{eDat2.Year}-{eDat2.Month}-{eDat2.Day}'");
        }


        protected void btn_getOnClick3(Object o, EventArgs e)
        {
            var eDate1 = Convert.ToDateTime(sDate3.Value);
            var eDate2 = Convert.ToDateTime(eDate3.Value);
            Loader(tripDataAccess.getVendortrucktrips(eDate1, eDate2));

        }

        protected void btn_getOnClick4(object o, EventArgs e)
        {
            var eDate1 = Convert.ToDateTime(sDate4.Value);
            var eDat2 = Convert.ToDateTime(eDate4.Value);
            int vndrID = Convert.ToInt32(input_vendorId.Text);
            Loader(tripDataAccess.getVendorWisetrips(eDate1, eDat2, vndrID));
        }

        protected void btn_getOnClick5(object o, EventArgs e)
        {
            var eDate1 = Convert.ToDateTime(sDate5.Value);
            var eDat2 = Convert.ToDateTime(eDate5.Value);
            int driverID = Convert.ToInt32(input_driverId.Text);
            Loader(tripDataAccess.getDriverWisetrips(eDate1, eDat2, driverID));
        }

        protected void btn_getOnClick6(object o, EventArgs e)
        {
            var eDate1 = Convert.ToDateTime(sDate6.Value);
            var eDat2 = Convert.ToDateTime(eDate6.Value);
            string state = input_stateName.Text;
            string city = input_CityName.Text;

            Loader(tripDataAccess.getdestinationWisetrips(eDate1, eDat2, state, city));
        }


        private void Loader(IEnumerable<Trip> trips)
        {
            try
            {
                //lbl.Text = Request["sDate"].ToString();


                gvTripQuery.DataSource = trips;
                gvTripQuery.DataBind();
            }
            catch (Exception ex)
            {
                lbl.Text = ex.Message;

            }
        }
    }
}