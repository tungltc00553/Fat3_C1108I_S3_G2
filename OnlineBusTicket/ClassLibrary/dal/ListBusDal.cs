using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ClassLibrary.dto;
using System.Data;
using System.Data.SqlClient;

namespace ClassLibrary.dal
{
    public class ListBusDal : ApCoreDBConnect
    {
        /*
         * @todo: get list top new
         * */
        public static DataTable GetListTopNew()
        {
            return Read("sp_GetListBusTopNew", null);
        }
        /*
         * @todo : search list bus
         * */
        public static DataTable SearchListBus(String fromPlace, String toPlace, DateTime startDate, DateTime dueDate)
        {
            SqlParameter[] param = new SqlParameter[4];

            param[0] = new SqlParameter("@FromPlace", SqlDbType.NVarChar, 50);
            param[0].Value = fromPlace;

            param[1] = new SqlParameter("@ToPlace", SqlDbType.NVarChar, 50);
            param[1].Value = toPlace;

            param[2] = new SqlParameter("@StartDate", SqlDbType.DateTime);
            param[2].Value = startDate;

            param[3] = new SqlParameter("@DueDate", SqlDbType.DateTime);
            param[3].Value = dueDate;

            return Read("sp_SearchListBus", param);
        }
        /*
         * @todo: get a list bus
         * */
        public static DataTable GetListBusByListBusId(int listBusId)
        {
            SqlParameter[] param = new SqlParameter[1];

            param[0] = new SqlParameter("@ListBusId", SqlDbType.Int);
            param[0].Value = listBusId;
            return Read("sp_GetListBusByListBusId", param);
        }
    }
}
