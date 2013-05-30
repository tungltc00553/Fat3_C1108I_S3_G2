using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ClassLibrary.dto;
using ClassLibrary.dal;
using System.Data;

namespace ClassLibrary.bll
{
    public class TicketBll
    {
        public static DataTable GetListTicket(int accountId)
        {
            return TicketDal.GetListTicket(accountId);
        }
        public static object Insert(Ticket obj)
        {
            return TicketDal.Insert(obj);
        }
        public static bool Update(Ticket obj)
        {
            return TicketDal.Update(obj);
        }
    }
}
