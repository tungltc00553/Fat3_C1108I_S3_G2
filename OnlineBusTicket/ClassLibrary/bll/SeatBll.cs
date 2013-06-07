using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using ClassLibrary.dto;
using ClassLibrary.dal;

namespace ClassLibrary.bll
{
    public class SeatBll
    {
         /*
         * @todo : get list seat
         * */
        public static DataTable GetAllListSeat(int listBusId)
        {
            return SeatDal.GetAllListSeat(listBusId);
        }
    }
}
