using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using ClassLibrary.dto;

namespace ClassLibrary.dal
{
    public class PromoteDal: ApCoreDBConnect
    {
        public static List<Promote> GetList(String storedProcedureName, SqlParameter[] arrParameter)
        {
            List<Promote> list = new List<Promote>();
            DataTable dt = Read(storedProcedureName, arrParameter);
            foreach (DataRow dr in dt.Rows)
            {
                list.Add(new Promote(dr));
            }
            return list;
        }
        /*
         * @todo: get promote by age
         * */
        public static Promote GetPromoteByAge(int age)
        {
            SqlParameter[] param = new SqlParameter[1];

            param[0] = new SqlParameter("@Age", SqlDbType.Int);
            param[0].Value = age;

            return GetList("sp_GetPromoteByAge", param)[0] ;
        }
    }
}
