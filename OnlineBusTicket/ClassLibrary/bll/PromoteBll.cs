using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ClassLibrary.dto;
using ClassLibrary.dal;
using System.Data;

namespace ClassLibrary.bll
{
    public class PromoteBll
    {
        /*
         * @todo: get promote by age
         * */
        public static Promote GetPromoteByAge(int age)
        {
            return PromoteDal.GetPromoteByAge(age);
        }
    }
}
