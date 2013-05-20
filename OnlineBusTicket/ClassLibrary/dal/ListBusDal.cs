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
         * @todo : get list bus
         * */
        public static DataTable GetAllListBus()
        {
            return Read("sp_GetAllListBus", null);
        }
        /*
         * @todo : search list bus
         * */
        public static DataTable SearchListBus(String from,String to,DateTime fromDate,DateTime toDate)
        {
            SqlParameter[] arrParameter = new SqlParameter[4];

            arrParameter[0] = new SqlParameter("@From", SqlDbType.NVarChar, 50);
            arrParameter[0].Value = "%"+from +"%";

            arrParameter[1] = new SqlParameter("@To", SqlDbType.NVarChar, 50);
            arrParameter[1].Value ="%" + to + "%";

            arrParameter[2] = new SqlParameter("@FromDate", SqlDbType.DateTime);
            arrParameter[2].Value = "%" + fromDate + "%";

            arrParameter[3] = new SqlParameter("@ToDate", SqlDbType.DateTime);
            arrParameter[3].Value ="%"+ toDate + "%";

            return Read("sp_SearchListBus", arrParameter);
        }
    }
}
