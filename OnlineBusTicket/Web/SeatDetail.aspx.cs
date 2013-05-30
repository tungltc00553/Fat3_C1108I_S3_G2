using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ClassLibrary.bll;
using System.Data;
using ClassLibrary.dto;

public partial class SeatDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Username"] != null)
            {
                LoadReperter();
                LoadListBusInfo();
            }
            else
                Response.Redirect("Login.aspx?url=Login");
        }
    }

    private void LoadReperter()
    {
        if (Request.QueryString["ListBusId"] != null)
        {
            if (SeatBll.GetAllListSeat(Convert.ToInt32(Request.QueryString["ListBusId"])) != null)
            {
                rptSeat.DataSource = SeatBll.GetAllListSeat(Convert.ToInt32(Request.QueryString["ListBusId"]));
                rptSeat.DataBind();
            }
        }
        else
            Response.Redirect("404.aspx");
    }
    private void LoadListBusInfo()
    {
        DataRow dr = ListBusBll.GetListBusByListBusId(Convert.ToInt32(Request.QueryString["ListBusId"])).Rows[0];
        lblRoutesName.Text = dr["RoutesName"].ToString();
        lblBusPlate.Text = dr["BusPlate"].ToString();
        lblDeparture.Text = dr["Departure"].ToString();
        lblArrival.Text = dr["Arrival"].ToString();
        lblPrice.Text = dr["Price"].ToString();
        lblTypeName.Text = dr["TypeName"].ToString();
        lblStartTime.Text = dr["StartTime"].ToString();
    }

    private void TickedInfo()
    {
        List<TicketDetail> list = new List<TicketDetail>();
        TicketDetail seat = null;
        foreach (RepeaterItem i in rptSeat.Items)
        {
            foreach (Control c in i.Controls)
            {
                if (c is CheckBox)
                {
                    CheckBox cb = (CheckBox)c;
                    if (cb.Enabled && cb.Checked)
                    {
                        Response.Write(cb.Text);
                        seat = new TicketDetail();
                        seat.Fees = decimal.Parse(lblPrice.Text);
                        seat.ListBusId = Convert.ToInt32(Request.QueryString["ListBusId"]);
                        seat.NumberSeat = int.Parse(cb.Text);
                        list.Add(seat);
                    }
                }

            }

        }
        if (list.Count != 0)
        {
            Session["Seat"] = list;
            Response.Redirect("Booking.aspx?url=Booking");
        }
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {

    }
    protected void btnNext_Click(object sender, EventArgs e)
    {
        TickedInfo();
    }
}