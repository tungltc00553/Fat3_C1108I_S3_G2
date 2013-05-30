using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ClassLibrary.dto;
using ClassLibrary.bll;
using System.Data;
using System.Data.SqlClient;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        /* if (ScriptManager.GetCurrent(Page) == null)
         {
             Page.Form.Controls.AddAt(0, new ScriptManager());
         } */
        if (!IsPostBack)
        {
           // SetDate();
            LoadPlace(ddlFromPlace);
            LoadPlace(ddlToPlace);
            LoadAccountInfo();
        }
    }
    private void SetDate()
    {
        txtStartDate.Text = DateTime.Now.ToShortDateString();
        txtDueDate.Text = DateTime.Now.ToShortDateString();
    }
    private void LoadPlace(DropDownList ddl)
    {
        ddl.DataSource = PlaceBll.GetAllListPlace();
        ddl.DataTextField = "PlaceName";
        ddl.DataValueField = "PlaceId";
        ddl.DataBind();
    }

    private void LoadAccountInfo()
    {
        if (Session["Username"] == null)
        {
            hplLogin.NavigateUrl = "Login.aspx?url=Login";
            hplMyAcount.NavigateUrl = "Login.aspx?url=Login";
        }
        else
        {
            hplMyAcount.Text = Session["Username"].ToString();
            hplMyAcount.NavigateUrl = "MyAccount.aspx?url=Info";
            hplLogin.Text = "Logout";
            hplLogin.NavigateUrl = "Home.aspx?url=Logout";
        }
        if (Request.QueryString["url"] != null)
        {
            if (Request.QueryString["url"].ToString().Equals("Logout"))
            {
                Session["Username"] = null;
                hplLogin.Text = "Login";
                hplLogin.NavigateUrl = "Login.aspx?url=Login";
                hplMyAcount.Text = "My Account";
                hplMyAcount.NavigateUrl = "Login.aspx?url=Login";
            }
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Response.Redirect("Search.aspx?FromPlace=" + ddlFromPlace.SelectedItem.Text + "&ToPlace=" + ddlToPlace.SelectedItem.Text + "&StartDate=" + txtStartDate.Text.Trim() + "&DueDate=" + txtDueDate.Text.Trim() + "&url=Search");
    }
}
