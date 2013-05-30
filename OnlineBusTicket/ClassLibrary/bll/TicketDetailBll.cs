using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ClassLibrary.dto;
using ClassLibrary.dal;

namespace ClassLibrary.bll
{
    public class TicketDetailBll
    {
        public static object Insert(TicketDetail obj)
        {
            return TicketDetailDal.Insert(obj) ;
        }
        public static bool Update(TicketDetail obj)
        {
            return TicketDetailDal.Update(obj);
        }

    }
}
