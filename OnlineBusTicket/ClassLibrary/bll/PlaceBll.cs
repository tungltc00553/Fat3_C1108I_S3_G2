using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ClassLibrary.dto;
using ClassLibrary.dal;
using System.Data;

namespace ClassLibrary.bll
{
    public class PlaceBll
    {
        /*
         * @todo : get list place
         * */
        public static DataTable GetAllPlace()
        {
            return PlaceDal.GetAllPlace() ;
        }
    }
}
