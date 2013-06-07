using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace ClassLibrary.dal
{
    public class PromoteDal: ApCoreDBConnect
    {
        /*
         * @todo : get list place
         * */
        public static DataTable GetAllPlace()
        {
            return Read("sp_GetAllPromote", null);
        }
        /*
         * @todo: get discount
         * */
        public static object GetDiscount(int promoteId)
        {
            SqlParameter[] param = new SqlParameter[1];

            param[0] = new SqlParameter("@PromoteId", SqlDbType.Int);
            param[0].Value = promoteId;
            return ExcuteScalar("sp_GetDiscount", param);
        }
    }
}
