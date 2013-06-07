using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ClassLibrary.dto
{
    public class Order
    {
        private int orderId;

        public int OrderId
        {
            get { return orderId; }
            set { orderId = value; }
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
        private DateTime createDate;

        public DateTime CreateDate
        {
            get { return createDate; }
            set { createDate = value; }
        }
        private decimal totalFees;

        public decimal TotalFees
        {
            get { return totalFees; }
            set { totalFees = value; }
        }
        private String shippingName;

        public String ShippingName
        {
            get { return shippingName; }
            set { shippingName = value; }
        }

        private String shippingAddress;

        public String ShippingAddress
        {
            get { return shippingAddress; }
            set { shippingAddress = value; }
        }
        private String shipppingEmail;

        public String ShipppingEmail
        {
            get { return shipppingEmail; }
            set { shipppingEmail = value; }
        }
        private String shippingPhone;

        public String ShippingPhone
        {
            get { return shippingPhone; }
            set { shippingPhone = value; }
        }
        private bool status;

        public bool Status
        {
            get { return status; }
            set { status = value; }
        }

        //add field
        private List<OrderDetail> list_OrderDetail;

        public List<OrderDetail> List_OrderDetail
        {
            get { return list_OrderDetail; }
            set { list_OrderDetail = value; }
        }
        public Order()
        {

        }
    }
}
