using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ClassLibrary.dto;
using ClassLibrary.bll;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadAllPlace(ddlFromPlace);
            LoadAllPlace(ddlToPlace);
        }
    }
    /*
     * load all place
     * */
    private void LoadAllPlace(DropDownList ddl)
    {
        ddl.DataSource = PlaceBll.GetAllPlace();
        ddl.DataTextField = "PlaceName";
        ddl.DataValueField = "PlaceId";
        ddl.DataBind();
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Response.Redirect("SearchView.aspx?FromPlace=" + ddlFromPlace.SelectedItem.Text + "&ToPlace=" + ddlToPlace.SelectedItem.Text + "&StartDate=" + txtStartDate.Text.Trim() + "&DueDate=" + txtDueDate.Text.Trim() + "&url=Search");
    }
}
