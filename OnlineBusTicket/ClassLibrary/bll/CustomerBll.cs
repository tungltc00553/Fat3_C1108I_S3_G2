using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ClassLibrary.dto;
using ClassLibrary.dal;

namespace ClassLibrary.bll
{
    public class CustomerBll
    {
        public static object Insert(Customer obj)
        {
            return CustomerDal.Insert(obj);
        }
        public static bool Update(Customer obj)
        {
            return CustomerDal.Update(obj);
        }
    }
}
