using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ClassLibrary.bll;
using ClassLibrary.dto;

public partial class Admin_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string username = txtUsername.Text;
        string password = txtPassword.Text;
        if (AccountBll.Login(username, password) != null)
        {
            int flag = int.Parse(AccountBll.Login(username, password).ToString());
            switch (flag)
            {
                case 1:
                    //Admin
                    Session["Username"] = username;
                    Response.Redirect("Page/Order.aspx");
                    break;
                case 2:
                    //User
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