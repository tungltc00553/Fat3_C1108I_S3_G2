using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using ClassLibrary.dto;
using ClassLibrary.bll;

public partial class Checkout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Cart"] == null)
            {
                Response.Redirect("Home.aspx");
            }
            else
                LoadCart();

        }
    }
    protected void btnCheckoutFinal_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            if (OrderBll.Insert(GetOrder(), GetCustomer()))
            {
                Session["Cart"] = null;
                Response.Redirect("Finish.htm");
            }
        }
    }
    private Customer GetCustomer()
    {
        Customer obj = new Customer();
        obj.CustomerName = txtLastName.Text.Trim() + " " + txtFirstName.Text.Trim();
        obj.Address = txtAddress.Text.Trim();
        obj.Email = txtEmail.Text.Trim();
        obj.Phone = txtPhone.Text.Trim();
        return obj;
    }
    private Order GetOrder()
    {
        Order obj = new Order();
        obj.CreateDate = DateTime.Now;
        obj.TotalFees = decimal.Parse(lblTotal.Text);
        obj.ShippingName = txtLastNameShip.Text.Trim() + " " + txtFirstNameShip.Text.Trim();
        obj.ShippingAddress = txtAddressShip.Text.Trim();
        obj.ShipppingEmail = txtEmailShip.Text.Trim();
        obj.ShippingPhone = txtPhoneShip.Text.Trim();
        obj.List_OrderDetail = new List<OrderDetail>();
        if (Session["Cart"] != null)
        {
            DataTable dt = (DataTable)Session["Cart"];
            foreach (DataRow dr in dt.Rows)
            {
                OrderDetail detail = new OrderDetail();
                detail.NumberSeat = (int)dr["NumberSeat"];
                detail.ListBusId = (int)dr["ListBusId"];
                detail.PromoteId = (int)dr["PromoteId"];
                detail.Fees = (decimal)dr["Price"];
                obj.List_OrderDetail.Add(detail);
            }
        }

        return obj;
    }
    /*
     * * load cart 
     * */
    private void LoadCart()
    {
        if (Session["Cart"] != null)
        {
            DataTable cart = (DataTable)Session["Cart"];
            grvListBus.DataSource = cart;
            grvListBus.DataBind();
            int ticketCount = 0;
            decimal totalPrice = 0;
            foreach (DataRow dr in cart.Rows)
            {
                ticketCount++;
                totalPrice += decimal.Parse(dr["Price"].ToString());
            }
            lblCount.Text = ticketCount.ToString();
            lblTotal.Text = totalPrice.ToString();
        }
    }
    protected void grvListBus_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int listBusId = int.Parse(grvListBus.DataKeys[e.RowIndex].Values["ListBusId"].ToString());
        int numberSeat = int.Parse(grvListBus.DataKeys[e.RowIndex].Values["NumberSeat"].ToString());

        GridViewRow row = grvListBus.Rows[e.RowIndex];
        DropDownList ddlPromote = row.FindControl("ddlPromote") as DropDownList;
        string promote = ddlPromote.SelectedItem.Text;
        DataTable cart = (DataTable)Session["Cart"];
        foreach (DataRow dr in cart.Rows)
        {
            if (int.Parse(dr["ListBusId"].ToString()) == listBusId && dr["NumberSeat"].Equals(numberSeat))
            {
                dr["PromoteName"] = promote;
                int promoteId = int.Parse(ddlPromote.SelectedValue);
                dr["PromoteId"] = promoteId;
                dr["Price"] = ListBusBll.GetPrice(listBusId) - ListBusBll.GetPrice(listBusId) * PromoteBll.GetDiscount(promoteId) / 100;
                break;
            }
        }
        Session["Cart"] = cart;
        grvListBus.EditIndex = -1;
        LoadCart();
        Response.Redirect("Checkout.aspx?url=UpdateCart");
    }
    protected void grvListBus_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grvListBus.EditIndex = e.NewEditIndex;
        LoadCart();
    }
    protected void grvListBus_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int maSach = int.Parse(grvListBus.DataKeys[e.RowIndex].Value.ToString());
        DataTable cart = (DataTable)Session["Cart"];
        foreach (DataRow dr in cart.Rows)
        {
            if (int.Parse(dr["ListBusId"].ToString()) == maSach)
            {
                cart.Rows.Remove(dr);
                break;
            }
        }
        Session["Cart"] = cart;
        grvListBus.EditIndex = -1;
        LoadCart();
        Response.Redirect("Checkout.aspx?url=Cart");
    }
    protected void grvListBus_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grvListBus.EditIndex = -1;
        LoadCart();
    }
    protected void grvListBus_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow && grvListBus.EditIndex == e.Row.RowIndex)
        {
            DropDownList ddlPromote = (DropDownList)e.Row.FindControl("ddlPromote");
            ddlPromote.DataSource = PromoteBll.GetAllPlace();
            ddlPromote.DataTextField = "PromoteName";
            ddlPromote.DataValueField = "PromoteId";
            ddlPromote.DataBind();
        }
    }

}