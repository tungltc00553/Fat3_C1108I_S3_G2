using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using ClassLibrary.dto;
using System.Data.SqlClient;

namespace ClassLibrary.dal
{
    public class TicketDetailDal: ApCoreDBConnect
    {
        public static object Insert(TicketDetail obj)
        {
            SqlParameter[] param = new SqlParameter[5];

            param[0] = new SqlParameter("@TicketId", SqlDbType.Int);
            param[0].Value = obj.TicketId;

            param[1] = new SqlParameter("@NumberSeat", SqlDbType.Int);
            param[1].Value = obj.NumberSeat;

            param[2] = new SqlParameter("@ListBusId", SqlDbType.Int);
            param[2].Value = obj.ListBusId;

            param[3] = new SqlParameter("@PromoteId", SqlDbType.Int);
            param[3].Value = obj.PromoteId;

            param[4] = new SqlParameter("@Fees", SqlDbType.Decimal);
            param[4].Value = obj.Fees;

            return ExcuteNonQuery("sp_InsertTicketDetailCustomer", param);
        }
        //public static bool Insert(TicketDetail obj)
        //{
        //    DataTable dt = ReadStructure("sp_GetAllTicketDetail");
        //    DataRow dr = dt.NewRow();
        //    dr["TicketId"] = obj.TicketId;
        //    dr["NumberSeat"] = obj.NumberSeat;
        //    dr["ListBusId"] = obj.ListBusId;
        //    dr["PromoteId"] = obj.PromoteId;
        //    dr["Fees"] = obj.Fees;
        //    dt.Rows.Add(dr);
        //    return Write(dr, "sp_GetAllTicketDetail") > 0;
        //}
        public static bool Update(TicketDetail obj)
        {
            DataTable dt = Read("sp_GetAllTicket", null);
            DataRow dr = dt.Rows.Find(obj.TicketDetailId);
            dr["TicketId"] = obj.TicketId;
            dr["NumberSeat"] = obj.NumberSeat;
            dr["ListBusId"] = obj.ListBusId;
            dr["PromoteId"] = obj.PromoteId;
            dr["Fees"] = obj.Fees;

            return Write(dr, "sp_GetAllTicketDetail") > 0;
        }
    }
}
