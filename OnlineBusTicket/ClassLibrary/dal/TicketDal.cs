using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using ClassLibrary.dto;
using System.Data.SqlClient;

namespace ClassLibrary.dal
{
    public class TicketDal: ApCoreDBConnect
    {
        public static DataTable GetListTicket(int accountId)
        {
            SqlParameter[] param = new SqlParameter[1];

            param[0] = new SqlParameter("@AccountId", SqlDbType.Int);
            param[0].Value = accountId;

            return Read("sp_GetListTicketByAccountId", param);
        }
        public static object Insert(Ticket obj)
        {
            SqlParameter[] param = new SqlParameter[4];

            param[0] = new SqlParameter("@CreateDate", SqlDbType.DateTime);
            param[0].Value = obj.CreateDate;

            param[1] = new SqlParameter("@AccountId", SqlDbType.Int);
            param[1].Value = obj.AccountId;

            param[2] = new SqlParameter("@CustomerId", SqlDbType.Int);
            param[2].Value = obj.CustomerId;

            param[3] = new SqlParameter("@TotalFees", SqlDbType.Decimal);
            param[3].Value = obj.TotalFees;

            return ExcuteScalar("[sp_InsertTicketOutput]", param);
        }
        public static bool Update(Ticket obj)
        {
            DataTable dt = Read("sp_GetAllTicket", null);
            DataRow dr = dt.Rows.Find(obj.CustomerId);
            dr["CreateDate"] = obj.CreateDate;
            dr["AccountId"] = obj.AccountId;
            dr["CustomerId"] = obj.CustomerId;
            dr["TotalFees"] = obj.TotalFees;

            return Write(dr, "sp_GetAllTicket") > 0;
        }
    }
}
