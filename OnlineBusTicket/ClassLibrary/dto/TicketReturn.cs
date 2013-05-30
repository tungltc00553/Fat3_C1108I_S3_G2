using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ClassLibrary.dto
{
    public class TicketReturn
    {
        private int ticketReturnId;

        public int TicketReturnId
        {
            get { return ticketReturnId; }
            set { ticketReturnId = value; }
        }
        private int listBusId;

        public int ListBusId
        {
            get { return listBusId; }
            set { listBusId = value; }
        }
        private int numberSeat;

        public int NumberSeat
        {
            get { return numberSeat; }
            set { numberSeat = value; }
        }
        private decimal percentPrice;

        public decimal PercentPrice
        {
            get { return percentPrice; }
            set { percentPrice = value; }
        }
        public TicketReturn()
        {

        }

        private DateTime dateReturn;

        public DateTime DateReturn
        {
            get { return dateReturn; }
            set { dateReturn = value; }
        }
    }
}
