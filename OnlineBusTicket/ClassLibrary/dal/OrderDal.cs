using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ClassLibrary.dto;
using System.Data.SqlClient;
using System.Data;

namespace ClassLibrary.dal
{
    public class OrderDal : ApCoreDBConnect
    {
        /*
         * @todo: insert new object to database
         * */
        public static bool Insert(Order obj,Customer customer)
        {
            int count = 0;

            obj.CustomerId = int.Parse(CustomerDal.Insert(customer).ToString());        
            SqlParameter[] param = new SqlParameter[7];

            param[0] = new SqlParameter("@CustomerId", SqlDbType.Int);
            param[0].Value = obj.CustomerId;

            param[1] = new SqlParameter("@CreatDate", SqlDbType.DateTime);
            param[1].Value = obj.CreateDate;

            param[2] = new SqlParameter("@TotalFees", SqlDbType.Decimal);
            param[2].Value = obj.TotalFees;

            param[3] = new SqlParameter("@ShippingName", SqlDbType.NVarChar, 50);
            param[3].Value = obj.ShippingName;

            param[4] = new SqlParameter("@ShippingAddress", SqlDbType.NVarChar, 200);
            param[4].Value = obj.ShippingAddress;

            param[5] = new SqlParameter("@ShippingEmail", SqlDbType.NVarChar, 50);
            param[5].Value = obj.ShipppingEmail;

            param[6] = new SqlParameter("@ShippingPhone", SqlDbType.NVarChar, 50);
            param[6].Value = obj.ShippingPhone;

            int orderId = int.Parse(ExcuteScalar("sp_InsertOrder", param).ToString());
            foreach (OrderDetail detail in obj.List_OrderDetail)
            {
                detail.OrderId = orderId;
                count += Insert(detail);
            }

            return count > 0;
        }
        public static int Insert(OrderDetail obj)
        {
            SqlParameter[] param = new SqlParameter[5];

            param[0] = new SqlParameter("@OrderId", SqlDbType.Int);
            param[0].Value = obj.OrderId;

            param[1] = new SqlParameter("@NumberSeat", SqlDbType.Int);
            param[1].Value = obj.NumberSeat;

            param[2] = new SqlParameter("@ListBusId", SqlDbType.Int);
            param[2].Value = obj.ListBusId;

            param[3] = new SqlParameter("@PromoteId", SqlDbType.Int);
            param[3].Value = obj.PromoteId;

            param[4] = new SqlParameter("@Fees", SqlDbType.Decimal);
            param[4].Value = obj.Fees;

            return ExcuteNonQuery("sp_InsertOrderDetail", param);
        }

        /*
         * get all order 
         * */
        public static DataTable GetAllOrder()
        {
            return Read("sp_GetAllOrder", null);
        }
        /*
         * get all order by status
         * */
        public static DataTable GetAllOrderByStatus(int status)
        {
            SqlParameter[] param = new SqlParameter[1];

            param[0] = new SqlParameter("@Status", SqlDbType.Int);
            param[0].Value = status;
            return Read("sp_GetAllOrderByStatus", param);
        }

        /*
         * get all order by order id
         * */
        public static DataTable GetAllOrderByOrderId(int orderId)
        {
            SqlParameter[] param = new SqlParameter[1];

            param[0] = new SqlParameter("@OrderId", SqlDbType.Int);
            param[0].Value = orderId;
            return Read("sp_GetAllOrderByOrderId", param);
        }

        /*
         * get all order by customer name
         * */
        public static DataTable GetAllOrderByCustomerName(String customerName)
        {
            SqlParameter[] param = new SqlParameter[1];

            param[0] = new SqlParameter("@CustomerName", SqlDbType.NVarChar,50);
            param[0].Value = customerName;
            return Read("sp_GetAllOrderByCustomerName", param);
        }

        /*
         * get all order by customer email
         * */
        public static DataTable GetAllOrderByCustomerEmail(String email)
        {
            SqlParameter[] param = new SqlParameter[1];

            param[0] = new SqlParameter("@Email", SqlDbType.NVarChar, 50);
            param[0].Value = email;
            return Read("sp_GetAllOrderByCustomerEmail", param);
        }

        /*
        * get all order by day
        * */
        public static DataTable GetAllOrderByDay(int year,int month,int day)
        {
            SqlParameter[] param = new SqlParameter[3];

            param[0] = new SqlParameter("@Month", SqlDbType.Int);
            param[0].Value = month;

            param[1] = new SqlParameter("@Year", SqlDbType.Int);
            param[1].Value = year;

            param[2] = new SqlParameter("@Day", SqlDbType.Int);
            param[2].Value = day;

            return Read("sp_GetAllOrderByDay", param);
        }

        /*
        * get all order by month
        * */
        public static DataTable GetAllOrderByMonth(int month,int year)
        {
            SqlParameter[] param = new SqlParameter[2];

            param[0] = new SqlParameter("@Month", SqlDbType.Int);
            param[0].Value = month;

            param[1] = new SqlParameter("@Year", SqlDbType.Int);
            param[1].Value = year;

            return Read("sp_GetAllOrderByMonth", param);
        }

        /*
        * get all order by day
        * */
        public static DataTable GetAllOrderByYear(int year)
        {
            SqlParameter[] param = new SqlParameter[1];

            param[0] = new SqlParameter("@Year", SqlDbType.Int);
            param[0].Value = year;
            return Read("sp_GetAllOrderByYear", param);
        }
        /*
        * get all order detail by order id
        * */
        public static DataTable GetOrderDetailByOrderId(int orderId)
        {
            SqlParameter[] param = new SqlParameter[1];

            param[0] = new SqlParameter("@OrderId", SqlDbType.Int);
            param[0].Value = orderId;
            return Read("sp_GetOrderDetailByOderId", param);
        }

        /*
        * get all order detail info by order id
        * */
        public static DataTable GetInfoOrderDetailByOrderId(int orderId)
        {
            SqlParameter[] param = new SqlParameter[1];

            param[0] = new SqlParameter("@OrderId", SqlDbType.Int);
            param[0].Value = orderId;
            return Read("sp_GetInfoOrderDetailByOrderId", param);
        }

        /*
         * delete order
         * */
        public static bool Delete(int orderId)
        {
            SqlParameter[] param = new SqlParameter[1];

            param[0] = new SqlParameter("@OrderId", SqlDbType.Int);
            param[0].Value = orderId;
            return ExcuteNonQuery("sp_DeleteOrder", param)>0;
        }

        /*
         * update status order
         * */
        public static bool UpdateStatus(int orderId,bool status,String username)
        {
            SqlParameter[] param = new SqlParameter[3];

            param[0] = new SqlParameter("@OrderId", SqlDbType.Int);
            param[0].Value = orderId;

            param[1] = new SqlParameter("@Status", SqlDbType.Bit);
            param[1].Value = status;

            param[2] = new SqlParameter("@UserName", SqlDbType.NVarChar,50);
            param[2].Value = username;

            return ExcuteNonQuery("sp_UpdateStatusOrder", param) > 0;
        }
    }
}
