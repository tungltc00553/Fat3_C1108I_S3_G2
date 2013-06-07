using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;

namespace ClassLibrary.dal
{
    public class ListBusDal : ApCoreDBConnect
    {
        /*
         * @todo: get list top new
         * */
        public static DataTable GetAllListBusTop()
        {
            return Read("sp_GetAllListBusTop", null);
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
        /*
        * @todo: get price
        * */
        public static object GetPrice(int listBusId)
        {
            SqlParameter[] param = new SqlParameter[1];

            param[0] = new SqlParameter("@ListBusId", SqlDbType.Int);
            param[0].Value = listBusId;
            return ExcuteScalar("sp_GetPrice", param);
        }

        /*
        * @todo: get all listbus by top day
        * */
        public static DataTable GetAllListBusByTopDay(int year,int month,int day)
        {
            SqlParameter[] param = new SqlParameter[3];

            param[0] = new SqlParameter("@Month", SqlDbType.Int);
            param[0].Value = month;

            param[1] = new SqlParameter("@Year", SqlDbType.Int);
            param[1].Value = year;

            param[2] = new SqlParameter("@Day", SqlDbType.Int);
            param[2].Value = day;

            return Read("sp_GetAllListBusByTopDay", param);
        }

        /*
        * @todo: get all listbus by top 
        * */
        public static DataTable GetAllListBusByTop()
        {
            return Read("sp_GetAllListBusByTop", null);
        }

         /*
        * @todo: get all listbus by top month
        * */
        public static DataTable GetAllListBusByTopMonth(int month, int year)
        {
            SqlParameter[] param = new SqlParameter[2];

            param[0] = new SqlParameter("@Year", SqlDbType.Int);
            param[0].Value = year;

            param[1] = new SqlParameter("@Month", SqlDbType.Int);
            param[1].Value = month;

            return Read("sp_GetAllListBusByTopMonth", param);
        }        
        /*
         * @todo: get all listbus by top year
         * */
        public static DataTable GetAllListBusByTopYear(int year)
        {
            SqlParameter[] param = new SqlParameter[1];

            param[0] = new SqlParameter("@Year", SqlDbType.Int);
            param[0].Value = year;
            return Read("sp_GetAllListBusByTopYear", param);
        }

    }
}
