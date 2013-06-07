using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ClassLibrary.dto;
using ClassLibrary.dal;
using System.Data;
using System.Data.SqlClient;

namespace ClassLibrary.bll
{
    public class OrderBll
    {
        /*
         * @todo: insert new object to database
         * */
        public static bool Insert(Order obj, Customer customer)
        {
            return OrderDal.Insert(obj, customer);
        }
        /*
         * get all order 
         * */
        public static DataTable GetAllOrder()
        {
            return OrderDal.GetAllOrder();
        }
        /*
         * get all order by status
         * */
        public static DataTable GetAllOrderByStatus(int status)
        {
            return OrderDal.GetAllOrderByStatus(status);
        }
        /*
         * get all order by order id
         * */
        public static DataTable GetAllOrderByOrderId(int orderId)
        {
            return OrderDal.GetAllOrderByOrderId(orderId);
        }

        /*
         * get all order by customer name
         * */
        public static DataTable GetAllOrderByCustomerName(String customerName)
        {
            return OrderDal.GetAllOrderByCustomerName(customerName);
        }

        /*
         * get all order by customer email
         * */
        public static DataTable GetAllOrderByCustomerEmail(String email)
        {
            return OrderDal.GetAllOrderByCustomerEmail(email);
        }
        /*
       * get all order by day
       * */
        public static DataTable GetAllOrderByDay(int year, int month, int day)
        {
            return OrderDal.GetAllOrderByDay(year,month,day);
        }

        /*
        * get all order by month
        * */
        public static DataTable GetAllOrderByMonth(int month, int year)
        {
            return OrderDal.GetAllOrderByMonth(month, year);
        }

        /*
        * get all order by day
        * */
        public static DataTable GetAllOrderByYear(int year)
        {
            return OrderDal.GetAllOrderByYear(year);
        }
        /*
       * get all order detail by order id
       * */
        public static DataTable GetOrderDetailByOrderId(int orderId)
        {
            return OrderDal.GetOrderDetailByOrderId(orderId);
        }
        /*
        * get all order detail info by order id
        * */
        public static DataTable GetInfoOrderDetailByOrderId(int orderId)
        {
            return OrderDal.GetInfoOrderDetailByOrderId(orderId);
        }

        /*
         * delete order
         * */
        public static bool Delete(int orderId)
        {
            return OrderDal.Delete(orderId);
        }
        /*
         * update status order
         * */
        public static bool UpdateStatus(int orderId, bool status, String username)
        {
            return OrderDal.UpdateStatus(orderId, status, username);
        }
    }
}
