using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using ClassLibrary.dto;
using System.Data.SqlClient;

namespace ClassLibrary.dal
{
    public class CustomerDal: ApCoreDBConnect
    {
        public static object Insert(Customer obj)
        {
            SqlParameter[] param = new SqlParameter[5];

            param[0] = new SqlParameter("@CustomerName", SqlDbType.NVarChar, 50);
            param[0].Value = obj.CustomerName;

            param[1] = new SqlParameter("@Age", SqlDbType.Int);
            param[1].Value = obj.Age;

            param[2] = new SqlParameter("@Phone", SqlDbType.NVarChar, 50);
            param[2].Value = obj.Phone;

            param[3] = new SqlParameter("@Email", SqlDbType.NVarChar, 50);
            param[3].Value = obj.Email;

            param[4] = new SqlParameter("@Address", SqlDbType.NVarChar, 200);
            param[4].Value = obj.Address;

            //param[5] = new SqlParameter();
            //param[5].ParameterName = "@NEWID";
            //param[5].Direction = ParameterDirection.Output;
            //param[5].SqlDbType = SqlDbType.Int;

            return ExcuteScalar("sp_InsertCustomerOutput", param);
        }
        public static bool Update(Customer obj)
        {
            DataTable dt = Read("sp_GetAllCustomer",null);
            DataRow dr = dt.Rows.Find(obj.CustomerId);
            dr["CustomerName"] = obj.CustomerName;
            dr["Age"] = obj.Age;
            dr["Email"] = obj.Email;
            dr["Phone"] = obj.Phone;
            dr["Email"] = obj.Email;
            dr["Address"] = obj.Address;

            return Write(dr, "sp_GetAllCustomer") > 0;
        }
    }
}
