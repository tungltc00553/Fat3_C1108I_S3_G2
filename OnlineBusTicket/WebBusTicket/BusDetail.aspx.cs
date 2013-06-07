using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ClassLibrary.dto;
using ClassLibrary.bll;
using System.Data;

public partial class BusDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadReperter();
            LoadListBusInfo();
        }
        AddTicket();
    }
    /*
     * load all seat
     */
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
    /*
     * load info bus
     * */
    private void LoadListBusInfo()
    {
        int id = Convert.ToInt32(Request.QueryString["ListBusId"]);
        DataRow dr = ListBusBll.GetListBusByListBusId(id).Rows[0];
        lblRoutesName.Text = dr["RoutesName"].ToString();
        lblBusPlate.Text = dr["BusPlate"].ToString();
        lblDeparture.Text = dr["Departure"].ToString();
        lblArrival.Text = dr["Arrival"].ToString();
        lblPrice.Text = dr["Price"].ToString();
        //lblTypeName.Text = dr["TypeName"].ToString();
        lblStartTime.Text = dr["StartTime"].ToString();

        btnSubmit.PostBackUrl = "BusDetail.aspx?action=add&ListBusId=" + id;
    }
    /*
     * add ticket to cart
     * */
    private void AddTicket()
    {
        if (Request.QueryString["action"] == "add")
        {
            int id = Convert.ToInt32(Request.QueryString["ListBusId"]);
            if (Session["Cart"] == null)
            {
                DataTable cart = new DataTable();
                cart.Columns.Add("ListBusId", typeof(int));
                cart.Columns.Add("BusName", typeof(string));
                cart.Columns.Add("RoutesName", typeof(string));
                cart.Columns.Add("Price", typeof(decimal));
                cart.Columns.Add("NumberSeat", typeof(int));
                cart.Columns.Add("PromoteId", typeof(int));
                cart.Columns.Add("PromoteName", typeof(string));
                SetCart(cart, id);
            }
            else
            {
                DataTable cart = (DataTable)Session["Cart"];
                SetCart(cart, id);
            }
        }
    }
    /*
     * add item to cart
     * */
    private void SetCart(DataTable cart, int id)
    {
        foreach (RepeaterItem i in rptSeat.Items)
        {
            foreach (Control c in i.Controls)
            {
                bool check = false;
                if (c is CheckBox)
                {
                    CheckBox cb = (CheckBox)c;
                    if (cb.Enabled && cb.Checked)
                    {
                        DataRow dr = cart.NewRow();
                        foreach (DataRow drI in cart.Rows)
                        {
                            if (int.Parse(drI["ListBusId"].ToString()) == id)
                            {
                                if (drI["NumberSeat"].ToString().Equals(cb.Text))
                                {
                                    check = true;
                                    break;
                                }
                            }
                        }
                        if (!check)
                        {
                            dr["ListBusId"] = id;
                            dr["BusName"] = lblBusPlate.Text.ToString();
                            dr["RoutesName"] = lblRoutesName.Text.ToString();
                            dr["Price"] = decimal.Parse(lblPrice.Text.ToString());
                            dr["NumberSeat"] = int.Parse(cb.Text);
                            dr["PromoteName"] = "Adult";
                            dr["PromoteId"] = 4;
                            cart.Rows.Add(dr);
                        }
                    }
                }
            }
        }
        Session["Cart"] = cart;
    }
}