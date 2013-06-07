using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using ClassLibrary.dto;

namespace ClassLibrary.dal
{
    public class PlaceDal : ApCoreDBConnect
    {
        /*
         * @todo : get list place
         * */
        public static DataTable GetAllPlace()
        {
            return Read("sp_GetAllPlace", null);
        }
    }
}
