using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ClassLibrary.dto;
using ClassLibrary.dal;
using System.Data;

namespace ClassLibrary.bll
{
    public class ListBusBll
    {
        /*
         * @todo: get all list bus
         * */
        public static DataTable GetAllListBus()
        {
            return ListBusDal.GetAllListBus();
        }
        /*
         * @todo : search list bus
         * */
        public static DataTable SearchListBus(String from, String to, DateTime fromDate, DateTime toDate)
        {
            return ListBusDal.SearchListBus(from, to, fromDate, toDate);
        }
    }
}
