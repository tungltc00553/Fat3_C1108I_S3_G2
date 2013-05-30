using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using ClassLibrary.dto;
using ClassLibrary.bll;

public partial class Booking : System.Web.UI.Page
{
    private bool status;
    private int listBusId;
    private Promote promote;
    private decimal totalFees;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Username"] != null)
            {


            }
            else
                Response.Redirect("Login.aspx?url=Login");
        }
    }

    protected void btnNext_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            GetCustomerInfo();
            GetDiscount();
            GetTicket();
            Response.Redirect("Payment.aspx?url=Payment");
        }
    }
    private void GetCustomerInfo()
    {
        Customer customer = new Customer();
        customer.CustomerName = txtCustomerName.Text;
        customer.Age = int.Parse(txtAge.Text);
        customer.Phone = txtPhone.Text;
        customer.Address = txtAddress.Text;
        customer.Email = txtEmail.Text;
        Session["Customer"] = customer;
    }
    private void GetDiscount()
    {
        promote = PromoteBll.GetPromoteByAge(int.Parse(txtAge.Text));
        int discount = promote.Discount;
        if (Session["Seat"] != null)
        {
            List<TicketDetail> list = (List<TicketDetail>)Session["Seat"];
            foreach (TicketDetail i in list)
            {
                i.PromoteId = promote.PromoteId;
                i.Fees = i.Fees - i.Fees * discount/100;
                totalFees += i.Fees;
            }
            Session["Seat"] = list;
        }

    }
    private void GetTicket()
    {
        Ticket ticket = new Ticket();
        string username = Session["Username"].ToString();
        ticket.AccountId = AccountBll.GetAccountIdByUsername(username);
        ticket.CreateDate = DateTime.Now;
        ticket.TotalFees = totalFees;
        Session["Ticket"] = ticket;
    }
}