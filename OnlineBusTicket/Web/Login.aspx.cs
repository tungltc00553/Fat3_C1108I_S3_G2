using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ClassLibrary.dto;
using ClassLibrary.bll;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Username"] != null)
        {
            Response.Redirect("Home.aspx");
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string username = txtUsername.Text;
        string password = txtPassword.Text;
        if (AccountBll.Login(username, password) != null)
        {
            int flag = (int)AccountBll.Login(username, password);
            switch (flag)
            {
                case 2:
                    Session["Username"] = username;
                    Response.Redirect("Home.aspx");
                    break;
                case 1:
                    //Admin
                    break;
                default:
                    lblMessage.Text = "Login error !";
                    break;
            }
        }
        else
        {
            lblMessage.Text = "Login error !";
        }
    }
}