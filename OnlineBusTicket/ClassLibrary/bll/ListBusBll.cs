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
         * @todo: get list top new
         * */
        public static DataTable GetListTopNew()
        {
            return ListBusDal.GetListTopNew();
        }
        /*
         * @todo : search list bus
         * */
        public static DataTable SearchListBus(String fromPlace, String toPlace, DateTime startDate, DateTime dueDate)
        {
            return ListBusDal.SearchListBus(fromPlace, toPlace, startDate, dueDate);
        }
        /*
         * @todo: get a list bus
         * */
        public static DataTable GetListBusByListBusId(int listBusId)
        {
            return ListBusDal.GetListBusByListBusId(listBusId);
        }
    }
}
