using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ClassLibrary.dto;
using ClassLibrary.dal;

namespace ClassLibrary.bll
{
    public class TicketReturnBll
    {
        public static bool Insert(TicketReturn obj)
        {
            return TicketReturnDal.Insert(obj);
        }
    }
}
