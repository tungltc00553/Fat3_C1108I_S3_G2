using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ClassLibrary.dto
{
    public class Ticket
    {
        private int ticketId;

        public int TicketId
        {
            get { return ticketId; }
            set { ticketId = value; }
        }
        private DateTime createDate;

        public DateTime CreateDate
        {
            get { return createDate; }
            set { createDate = value; }
        }
        private int accountId;

        public int AccountId
        {
            get { return accountId; }
            set { accountId = value; }
        }
        private int customerId;

        public int CustomerId
        {
            get { return customerId; }
            set { customerId = value; }
        }
        private decimal totalFees;

        public decimal TotalFees
        {
            get { return totalFees; }
            set { totalFees = value; }
        }
        public Ticket()
        {

        }
    }
}
