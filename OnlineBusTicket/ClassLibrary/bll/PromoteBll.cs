using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using ClassLibrary.dto;
using ClassLibrary.dal;

namespace ClassLibrary.bll
{
    public class PromoteBll
    {
        /*
         * @todo : get list place
         * */
        public static DataTable GetAllPlace()
        {
            return PromoteDal.GetAllPlace();
        }
        /*
         * @todo: get discount
         * */
        public static int GetDiscount(int promoteId)
        {
            int discount = 0;
            if (PromoteDal.GetDiscount(promoteId)!=null)
            {
                discount= (int)PromoteDal.GetDiscount(promoteId);
            }
            return discount;
        }
    }
}
