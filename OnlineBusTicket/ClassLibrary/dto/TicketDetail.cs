using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace ClassLibrary.dto
{
    public class TicketDetail
    {
        private int ticketDetailId;

        public int TicketDetailId
        {
            get { return ticketDetailId; }
            set { ticketDetailId = value; }
        }
        private int ticketId;

        public int TicketId
        {
            get { return ticketId; }
            set { ticketId = value; }
        }
        private int numberSeat;

        public int NumberSeat
        {
            get { return numberSeat; }
            set { numberSeat = value; }
        }
        private int listBusId;

        public int ListBusId
        {
            get { return listBusId; }
            set { listBusId = value; }
        }
        private int promoteId;

        public int PromoteId
        {
            get { return promoteId; }
            set { promoteId = value; }
        }
        private decimal fees;

        public decimal Fees
        {
            get { return fees; }
            set { fees = value; }
        }
        public TicketDetail()
        {

        }
        public TicketDetail(DataRow dr)
        {
            this.ticketDetailId = (int)dr["TicketDetailId"];
            this.ticketId = (int)dr["TicketId"];
            this.numberSeat = (int)dr["NumberSeat"];
            this.listBusId = (int)dr["ListBusId"];
            this.promoteId = (int)dr["PromoteId"];
            this.fees = (decimal)dr["Fees"];
        }
    }
}
