using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ClassLibrary.dto
{
    class Customer
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
        public Customer()
        {

        }
    }
}
