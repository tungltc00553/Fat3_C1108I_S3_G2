using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ClassLibrary.dto;
using ClassLibrary.bll;
using System.Data;

public partial class Admin_Page_Order : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadAllOrder(ddlFilter.SelectedIndex);
        }
    }
    /*
     * load gridview
     * */

    private void LoadAllOrder(int index)
    {
        switch (index)
        {
            case 0:
                LoadGridView(OrderBll.GetAllOrder());
                break;
            case 1:
                LoadGridView(OrderBll.GetAllOrderByStatus(0));
                break;
            case 2:
                LoadGridView(OrderBll.GetAllOrderByStatus(1));
                break;
            case 3:
                int orderId = 0;
                try
                {
                    orderId = int.Parse(txtSearch.Text);
                }
                catch (Exception)
                {
                    Response.Write("<script type='text/javascript'> alert('Order Id is a number'); </script>");
                    return;
                }
                LoadGridView(OrderBll.GetAllOrderByOrderId(orderId));
                break;
            case 4:
                LoadGridView(OrderBll.GetAllOrderByCustomerName(txtSearch.Text));
                break;
            case 5:
                LoadGridView(OrderBll.GetAllOrderByCustomerEmail(txtSearch.Text));
                break;
        }
    }
    private void LoadGridView(DataTable dt)
    {
        collectionPager.DataSource = dt.DefaultView;
        collectionPager.BindToControl = grvOrder;
        grvOrder.DataSource = collectionPager.DataSourcePaged;
    }
    protected void ddlFilter_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadAllOrder(ddlFilter.SelectedIndex);
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        LoadAllOrder(int.Parse(ddlSearch.SelectedValue));
    }
    protected void grvOrder_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        int listBusId = int.Parse(grvOrder.DataKeys[e.NewSelectedIndex].Value.ToString());
        Response.Redirect("OrderDetail.aspx?OrderId="+ listBusId +"&url=Detail");
    }
    protected void grvOrder_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int orderId = int.Parse(grvOrder.DataKeys[e.RowIndex].Value.ToString());
        GridViewRow row = grvOrder.Rows[e.RowIndex];
        CheckBox cb = row.FindControl("cbStatus") as CheckBox;
        bool status = cb.Checked;
        string username = Session["Username"].ToString();
        if (OrderBll.UpdateStatus(orderId,status,username))
        {
            grvOrder.EditIndex = -1;
            LoadAllOrder(ddlFilter.SelectedIndex);
            Response.Redirect("Order.aspx?url=Order");
        }
    }
    protected void grvOrder_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grvOrder.EditIndex = e.NewEditIndex;
        LoadAllOrder(ddlFilter.SelectedIndex);
    }
    protected void grvOrder_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int orderId = int.Parse(grvOrder.DataKeys[e.RowIndex].Value.ToString());
        OrderBll.Delete(orderId);
        grvOrder.EditIndex = -1;
        LoadAllOrder(ddlFilter.SelectedIndex);
        Response.Redirect("Order.aspx?url=Order");
    }
    protected void grvOrder_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grvOrder.EditIndex = -1;
        LoadAllOrder(ddlFilter.SelectedIndex);
    }
}