using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using ClassLibrary.dto;
using ClassLibrary.bll;

public partial class Search : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadListBus();
        }
    }
    private void LoadGridView(DataTable dt)
    {
        grvListBus.DataSource = dt;
        grvListBus.DataBind();
    }
    private void LoadListBus()
    {
        if (Request.QueryString["url"] != null)
        {
            String ulr = Request.QueryString["url"].ToString();
            Session["ulr"] = ulr;
            switch (ulr)
            {
                case "Search":
                    string fromPlace = Request.QueryString["FromPlace"].ToString();
                    string toPlace = Request.QueryString["ToPlace"].ToString();
                    DateTime startDate = DateTime.Parse(Request.QueryString["StartDate"].ToString());
                    DateTime dueDate = DateTime.Parse(Request.QueryString["DueDate"].ToString());
                    LoadGridView(ListBusBll.SearchListBus(fromPlace, toPlace, startDate, dueDate));
                    break;
                default:
                    break;
            }
        }
    }
    protected void grvListBus_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "View")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow selectRow = grvListBus.Rows[index];
            TableCell idRow = selectRow.Cells[0];
            int listBusID = Convert.ToInt32(idRow.Text.ToString());
            Response.Redirect("SeatDetail.aspx?ListBusId=" + listBusID + "&url=Seat");
        }
    }
}