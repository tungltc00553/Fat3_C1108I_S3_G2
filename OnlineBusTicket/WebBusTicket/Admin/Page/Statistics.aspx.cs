using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using ClassLibrary.dto;
using ClassLibrary.bll;

public partial class Admin_Page_Statistics : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadDateTime(ddlMonth, ddlYear, ddlDay, ddlDay2);

            LoadDateTime(ddlMonthOrder, ddlYearOrder, ddlDayOrder, ddlDay2Order);

            LoadAllTop(ddlTop.SelectedIndex);

            LoadTotalOrder(ddlTotal.SelectedIndex);
        }
    }
    private void LoadGridView(DataTable dt, SiteUtils.CollectionPager collectionpager, GridView grv)
    {
        collectionpager.DataSource = dt.DefaultView;
        collectionpager.BindToControl = grv;
        grv.DataSource = collectionpager.DataSourcePaged;
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        LoadAllTop(ddlTop.SelectedIndex);
    }
    private void LoadTotal(Label lblTotal, Label lblQuantity, DataTable dt)
    {
        lblTotal.Text = "";
        lblQuantity.Text = "";
        decimal total = 0;
        int quantity = 0;
        foreach (DataRow dr in dt.Rows)
        {
            total += decimal.Parse(dr["TotalFees"].ToString());
            quantity += int.Parse(dr["Quantity"].ToString());
        }
        lblTotal.Text = total.ToString() + " $";
        lblQuantity.Text = quantity.ToString();
    }
    private void LoadDateTime(DropDownList month, DropDownList year, DropDownList day, DropDownList day2)
    {
        month.DataSource = GetMonth();
        month.DataBind();
        month.SelectedValue = DateTime.Now.Month.ToString();
        year.DataSource = GetYear();
        year.DataBind();
        year.SelectedValue = DateTime.Now.Year.ToString();
        day.DataSource = GetDay(int.Parse(year.SelectedValue), int.Parse(month.SelectedValue));
        day.DataBind();
        day.SelectedValue = DateTime.Now.Day.ToString();

        day2.DataSource = GetDay(int.Parse(month.SelectedValue), int.Parse(month.SelectedValue));
        day2.DataBind();
        day2.SelectedValue = (DateTime.Now.Day + 1).ToString();
    }
    private int[] GetYear()
    {
        int[] arr = new int[10];
        int year = DateTime.Now.Year - 5;
        for (int i = 0; i < 10; i++)
        {
            arr[i] = ++year;
        }
        return arr;
    }
    private int[] GetMonth()
    {
        int[] arr = new int[12];
        for (int i = 0; i < 12; i++)
        {
            arr[i] = i + 1;
        }
        return arr;
    }
    private int[] GetDay(int year, int month)
    {
        DateTime monthStart = new DateTime(year, month, 1);
        DateTime monthEnd = monthStart.AddMonths(1);
        TimeSpan ts = monthEnd.Subtract(monthStart);
        int DayInMonth = ts.Days;
        int[] arr = new int[DayInMonth];
        for (int i = 0; i < DayInMonth; i++)
        {
            arr[i] = i + 1;
        }
        return arr;
    }
    protected void ddlTop_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadAllTop(ddlTop.SelectedIndex);
    }
    /*
     * load gridview
     * */

    private void LoadAllTop(int index)
    {
        switch (index)
        {
            case 0:
                ddlDay.Visible = false;
                ddlMonth.Visible = false;
                ddlYear.Visible = false;
                LoadGridView(ListBusBll.GetAllListBusByTop(), collectionPager, grvListBus);
                LoadTotal(lblTopPrice, lblTopSeat, ListBusBll.GetAllListBusByTop());
                break;
            case 1:
                ddlDay.Visible = true;
                ddlDay.Enabled = true;
                ddlMonth.Visible = true;
                ddlMonth.Enabled = true;
                ddlYear.Visible = true;
                ddlYear.Enabled = true;
                LoadGridView(ListBusBll.GetAllListBusByTopDay(int.Parse(ddlYear.SelectedValue), int.Parse(ddlMonth.SelectedValue), int.Parse(ddlDay.SelectedValue)), collectionPager, grvListBus);
                LoadTotal(lblTopPrice, lblTopSeat, ListBusBll.GetAllListBusByTopDay(int.Parse(ddlYear.SelectedValue), int.Parse(ddlMonth.SelectedValue), int.Parse(ddlDay.SelectedValue)));
                break;
            case 2:
                ddlDay.Visible = true;
                ddlDay.Enabled = false;
                ddlMonth.Visible = true;
                ddlMonth.Enabled = true;
                ddlYear.Visible = true;
                ddlYear.Enabled = true;
                LoadGridView(ListBusBll.GetAllListBusByTopMonth(int.Parse(ddlMonth.SelectedValue), int.Parse(ddlYear.SelectedValue)), collectionPager, grvListBus);
                LoadTotal(lblTopPrice, lblTopSeat, ListBusBll.GetAllListBusByTopMonth(int.Parse(ddlMonth.SelectedValue), int.Parse(ddlYear.SelectedValue)));
                break;
            case 3:
                ddlDay.Visible = true;
                ddlDay.Enabled = false;
                ddlMonth.Visible = true;
                ddlMonth.Enabled = false;
                ddlYear.Visible = true;
                ddlYear.Enabled = true;
                LoadGridView(ListBusBll.GetAllListBusByTopYear(int.Parse(ddlYear.SelectedValue)), collectionPager, grvListBus);
                LoadTotal(lblTopPrice, lblTopSeat, ListBusBll.GetAllListBusByTopYear(int.Parse(ddlYear.SelectedValue)));
                break;
        }
    }
    private void LoadTotalOrder(int index)
    {
        switch (index)
        {
            case 0:
                ddlDayOrder.Visible = false;
                ddlMonthOrder.Visible = false;
                ddlYearOrder.Visible = false;
                LoadGridView(OrderBll.GetAllOrder(), collectionPagerOrder, grvOrder);
                LoadTotal(lblTotalPrice, lblTotalQuantity, OrderBll.GetAllOrder());
                break;
            case 1:
                ddlDayOrder.Visible = true;
                ddlDayOrder.Enabled = true;
                ddlMonthOrder.Visible = true;
                ddlMonthOrder.Enabled = true;
                ddlYearOrder.Visible = true;
                ddlYearOrder.Enabled = true;
                LoadGridView(OrderBll.GetAllOrderByDay(int.Parse(ddlYearOrder.SelectedValue), int.Parse(ddlMonthOrder.SelectedValue), int.Parse(ddlDayOrder.SelectedValue)), collectionPagerOrder, grvOrder);
                LoadTotal(lblTotalPrice, lblTotalQuantity, OrderBll.GetAllOrderByDay(int.Parse(ddlYearOrder.SelectedValue), int.Parse(ddlMonthOrder.SelectedValue), int.Parse(ddlDayOrder.SelectedValue)));
                break;

            case 2:
                ddlDayOrder.Visible = true;
                ddlDayOrder.Enabled = false;
                ddlMonthOrder.Visible = true;
                ddlMonthOrder.Enabled = true;
                ddlYearOrder.Visible = true;
                ddlYearOrder.Enabled = true;
                LoadGridView(OrderBll.GetAllOrderByMonth(int.Parse(ddlMonthOrder.SelectedValue), int.Parse(ddlYearOrder.SelectedValue)), collectionPagerOrder, grvOrder);
                LoadTotal(lblTotalPrice, lblTotalQuantity, OrderBll.GetAllOrderByMonth(int.Parse(ddlMonthOrder.SelectedValue), int.Parse(ddlYearOrder.SelectedValue)));
                break;
            case 3:
                ddlDayOrder.Visible = true;
                ddlDayOrder.Enabled = false;
                ddlMonthOrder.Visible = true;
                ddlMonthOrder.Enabled = false;
                ddlYearOrder.Visible = true;
                ddlYearOrder.Enabled = true;
                LoadGridView(OrderBll.GetAllOrderByYear(int.Parse(ddlYearOrder.SelectedValue)), collectionPagerOrder, grvOrder);
                LoadTotal(lblTotalPrice, lblTotalQuantity, OrderBll.GetAllOrderByYear(int.Parse(ddlYearOrder.SelectedValue)));
                break;
            default:
                break;
        }
    }
    protected void btnSubmitOrder_Click(object sender, EventArgs e)
    {
        LoadTotalOrder(ddlTotal.SelectedIndex);
    }
    protected void ddlTotal_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadTotalOrder(ddlTotal.SelectedIndex);
    }
    protected void grvOrder_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        int listBusId = int.Parse(grvOrder.DataKeys[e.NewSelectedIndex].Value.ToString());
        Response.Redirect("OrderDetail.aspx?OrderId=" + listBusId + "&url=Detail");
    }
    protected void grvOrder_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int orderId = int.Parse(grvOrder.DataKeys[e.RowIndex].Value.ToString());
        GridViewRow row = grvOrder.Rows[e.RowIndex];
        CheckBox cb = row.FindControl("cbStatus") as CheckBox;
        bool status = cb.Checked;
        string username = Session["Username"].ToString();
        if (OrderBll.UpdateStatus(orderId, status, username))
        {
            grvOrder.EditIndex = -1;
            LoadTotalOrder(ddlTotal.SelectedIndex);
            Response.Redirect("Statistics.aspx?url=Order");
        }
    }
    protected void grvOrder_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grvOrder.EditIndex = e.NewEditIndex;
        LoadTotalOrder(ddlTotal.SelectedIndex);
    }
    protected void grvOrder_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int orderId = int.Parse(grvOrder.DataKeys[e.RowIndex].Value.ToString());
        OrderBll.Delete(orderId);
        grvOrder.EditIndex = -1;
        LoadTotalOrder(ddlTotal.SelectedIndex);
        Response.Redirect("Statistics.aspx?url=Order");
    }
    protected void grvOrder_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grvOrder.EditIndex = -1;
        LoadTotalOrder(ddlTotal.SelectedIndex);
    }
}