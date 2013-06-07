using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ClassLibrary.dto
{
    public class OrderDetail
    {
        private int orderDetailId;

        public int OrderDetailId
        {
            get { return orderDetailId; }
            set { orderDetailId = value; }
        }
        private int orderId;

        public int OrderId
        {
            get { return orderId; }
            set { orderId = value; }
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
        public OrderDetail()
        {

        }
    }
}
