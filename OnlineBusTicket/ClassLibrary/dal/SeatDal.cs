using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using ClassLibrary.dto;

namespace ClassLibrary.dal
{
    public class SeatDal : ApCoreDBConnect
    {
        /*
         * @todo : get list seat
         * */
        public static DataTable GetAllListSeat(int listBusId)
        {
            SqlParameter[] param = new SqlParameter[1];

            param[0] = new SqlParameter("@ListBusId", SqlDbType.Int);
            param[0].Value = listBusId;
            return Read("sp_GetAllSeat", param);
        }
    }
}
