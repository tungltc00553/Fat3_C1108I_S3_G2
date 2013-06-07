using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

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
        private String username;

        public String Username
        {
            get { return username; }
            set { username = value; }
        }
        private String password;

        public String Password
        {
            get { return password; }
            set { password = value; }
        }
        public Customer()
        {

        }
    }
}
