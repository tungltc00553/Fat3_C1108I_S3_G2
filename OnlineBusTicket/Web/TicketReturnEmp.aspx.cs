using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ClassLibrary.dto;
using ClassLibrary.bll;

public partial class TicketReturnEmp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (IsValid)
        {
            TicketReturn obj = new TicketReturn();
            obj.ListBusId = Convert.ToInt32(txtListBusId.Text);
            obj.NumberSeat = Convert.ToInt32(txtNumberSeat.Text);
            obj.PercentPrice = Convert.ToDecimal(txtPercentPrice.Text);
            obj.DateReturn = DateTime.Now;
            if (TicketReturnBll.Insert(obj))
            {
                Response.Redirect("Finish.htm");
            }

        }
    }
}