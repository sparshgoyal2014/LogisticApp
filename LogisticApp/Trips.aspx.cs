using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LogisticApp.Model.Entities;
using LogisticApp.Model.DataAccess;

namespace LogisticApp
{
    public partial class Trips : System.Web.UI.Page
    {

         TripDataAccess tripDataAccess;

        protected void Page_Load(object sender, EventArgs e)
        {
            tripDataAccess = new TripDataAccess();
            if (!IsPostBack)
            {
                Loader();
            }

        }

        private void Loader()
        {
            try
            {
                gvTrip.DataSource = tripDataAccess.getAllRecords();
                gvTrip.DataBind();
            }
            catch (Exception ex)
            {
                lbl.Text = ex.Message;
            }
        }

    }
}