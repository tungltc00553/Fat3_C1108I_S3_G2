using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ClassLibrary.dto;
using ClassLibrary.bll;

public partial class Payment : System.Web.UI.Page
{
    private Customer customer = new Customer();
    private Ticket ticket = new Ticket();
    private List<TicketDetail> list = new List<TicketDetail>();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadCustomerInfo();
            LoadGridView();
            LoadTicket();
        }
    }
    private void LoadGridView()
    {
        if (Session["Seat"] != null)
        {
            list = (List<TicketDetail>)Session["Seat"];
            grvCart.DataSource = list;
            grvCart.DataBind();
        }
    }
    private void LoadCustomerInfo()
    {
        if (Session["Customer"] != null)
        {
            customer = (Customer)Session["Customer"];
            lblCustomerName.Text = customer.CustomerName;
            lblAge.Text = customer.Age.ToString();
            lblEmail.Text = customer.Email;
            lblPhone.Text = customer.Phone;
            lblDiscount.Text = PromoteBll.GetPromoteByAge(customer.Age).Discount.ToString();
        }
    }
    private void LoadTicket()
    {
        if (Session["Ticket"] != null)
        {
            ticket = (Ticket)Session["Ticket"];
            lblTotalFees.Text = ticket.TotalFees.ToString();
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        customer = (Customer)Session["Customer"];
        ticket = (Ticket)Session["Ticket"];
        ticket.CustomerId = int.Parse(CustomerBll.Insert(customer).ToString());
        int ticketId = int.Parse(TicketBll.Insert(ticket).ToString());
        list = (List<TicketDetail>)Session["Seat"];

        foreach (TicketDetail i in list)
        {
            i.TicketId = ticketId;
            TicketDetailBll.Insert(i);
        }
        Response.Redirect("Finish.htm");
    }
}