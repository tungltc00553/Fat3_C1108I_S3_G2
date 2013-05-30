using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace ClassLibrary.dal
{
    public class PlaceDal : ApCoreDBConnect
    {
        /*
         * @todo : get list place
         * */
        public static DataTable GetAllListPlace()
        {
            return Read("sp_GetAllListPlace", null);
        }
    }
}
