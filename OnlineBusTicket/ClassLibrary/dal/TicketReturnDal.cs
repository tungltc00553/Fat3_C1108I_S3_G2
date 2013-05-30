using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using ClassLibrary.dto;
using System.Data;

namespace ClassLibrary.dal
{
    public class TicketReturnDal: ApCoreDBConnect
    {
        public static bool Insert(TicketReturn obj)
        {
            SqlParameter[] param = new SqlParameter[4];

            param[0] = new SqlParameter("@ListBusId", SqlDbType.Int);
            param[0].Value = obj.ListBusId;

            param[1] = new SqlParameter("@NumberSeat", SqlDbType.Int);
            param[1].Value = obj.NumberSeat;

            param[2] = new SqlParameter("@PercentPrice", SqlDbType.Decimal);
            param[2].Value = obj.PercentPrice;

            param[3] = new SqlParameter("@DateReturn", SqlDbType.DateTime);
            param[3].Value = obj.DateReturn;

            return ExcuteNonQuery("sp_InsertTicketReturnCustomer", param)>0;
        }
    }
}
