using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace ClassLibrary.dto
{
    public class Customer
    {
        private int customerId;

        public int CustomerId
        {
            get { return customerId; }
            set { customerId = value; }
        }
        private String customerName;

        public String CustomerName
        {
            get { return customerName; }
            set { customerName = value; }
        }
        private int age;

        public int Age
        {
            get { return age; }
            set { age = value; }
        }
        private String phone;

        public String Phone
        {
            get { return phone; }
            set { phone = value; }
        }
        private String email;

        public String Email
        {
            get { return email; }
            set { email = value; }
        }
        private String address;

        public String Address
        {
            get { return address; }
            set { address = value; }
        }
        public Customer(DataRow dr)
        {
            this.customerId = (int)dr["CustomerId"];
            this.customerName = dr["CustomerName"].ToString();
            this.age = (int)dr["Age"];
            this.phone = dr["Phone"].ToString();
            this.email = dr["Email"].ToString();
            this.address = dr["Address"].ToString();
        }

        public Customer()
        {
            // TODO: Complete member initialization
        }
    }
}
