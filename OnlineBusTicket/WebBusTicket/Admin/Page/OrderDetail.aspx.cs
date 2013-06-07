using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ClassLibrary.dto;
using ClassLibrary.bll;
using System.Data;

public partial class Admin_Page_OrderDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            LoadGridView();
            LoadInfo();
        }
    }

    private void LoadGridView()
    {
        if (Request.QueryString["OrderId"] != null)
        {
            grvOrderDetail.DataSource = OrderBll.GetOrderDetailByOrderId(int.Parse(Request.QueryString["OrderId"]));
            grvOrderDetail.DataBind();
        }
        else
            Response.Redirect("404.aspx");
    }
    private void LoadInfo()
    {
        if (Request.QueryString["OrderId"] != null)
        {
            DataTable dt = OrderBll.GetInfoOrderDetailByOrderId(int.Parse(Request.QueryString["OrderId"]));
            DataRow dr = dt.Rows[0];
            lblName.Text = dr["CustomerName"].ToString();
            lblPhone.Text = dr["Phone"].ToString();
            lblAddress.Text = dr["Address"].ToString();
            lblEmail.Text = dr["Email"].ToString();
            lblPhoneShip.Text = dr["ShippingPhone"].ToString();
            lblNameShip.Text = dr["ShippingName"].ToString();
            lblAddressShip.Text = dr["ShippingAddress"].ToString();
            lblEmailShip.Text = dr["ShippingEmail"].ToString();
        }
        else
            Response.Redirect("404.aspx");
    }
}