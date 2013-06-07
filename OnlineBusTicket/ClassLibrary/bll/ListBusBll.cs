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
        public static DataTable GetAllListBusTop()
        {
            return ListBusDal.GetAllListBusTop();
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
        /*
        * @todo: get price
        * */
        public static decimal GetPrice(int listBusId)
        {
            decimal price = 0;
            if (ListBusDal.GetPrice(listBusId) !=null)
            {
                price = decimal.Parse(ListBusDal.GetPrice(listBusId).ToString());
            }
            return price;
        }


        /*
        * @todo: get all listbus by top day
        * */
        public static DataTable GetAllListBusByTopDay(int year, int month, int day)
        {
            return ListBusDal.GetAllListBusByTopDay(year,month,day);
        }

        /*
        * @todo: get all listbus by top 
        * */
        public static DataTable GetAllListBusByTop()
        {
            return ListBusDal.GetAllListBusByTop();
        }

         /*
       * @todo: get all listbus by top month
       * */
        public static DataTable GetAllListBusByTopMonth(int month, int year)
        {
            return ListBusDal.GetAllListBusByTopMonth(month, year);
        }
        /*
        * @todo: get all listbus by top year
        * */

        public static DataTable GetAllListBusByTopYear(int year)
        {
            return ListBusDal.GetAllListBusByTopYear(year);
        }
    }
}
