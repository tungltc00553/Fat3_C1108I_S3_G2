using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ClassLibrary.dto;
using System.Data.SqlClient;
using System.Data;

namespace ClassLibrary.dal
{
    public class CustomerDal: ApCoreDBConnect
    {
        /*
         * add new customer
         * */
        public static object Insert(Customer obj)
        {
            SqlParameter[] param = new SqlParameter[4];

            param[0] = new SqlParameter("@CustomerName", SqlDbType.NVarChar, 50);
            param[0].Value = obj.CustomerName;

            param[1] = new SqlParameter("@Phone", SqlDbType.NVarChar, 50);
            param[1].Value = obj.Phone;

            param[2] = new SqlParameter("@Email", SqlDbType.NVarChar, 50);
            param[2].Value = obj.Email;

            param[3] = new SqlParameter("@Address", SqlDbType.NVarChar, 200);
            param[3].Value = obj.Address;

            return ExcuteScalar("sp_InsertCustomer", param);
        }
    }
}
