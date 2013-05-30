using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ClassLibrary.dto
{
    public class Account
    {
        private int accountId;

        public int AccountId
        {
            get { return accountId; }
            set { accountId = value; }
        }
        private String fullName;

        public String FullName
        {
            get { return fullName; }
            set { fullName = value; }
        }
        private String userName;

        public String UserName
        {
            get { return userName; }
            set { userName = value; }
        }
        private String passWord;

        public String PassWord
        {
            get { return passWord; }
            set { passWord = value; }
        }
        private int roleId;

        public int RoleId
        {
            get { return roleId; }
            set { roleId = value; }
        }
        private String Address;

        public String Address1
        {
            get { return Address; }
            set { Address = value; }
        }
        private String qualification;

        public String Qualification
        {
            get { return qualification; }
            set { qualification = value; }
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
        public Account()
        {

        }
    }
}
