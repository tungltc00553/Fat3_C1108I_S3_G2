using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace ClassLibrary.dto
{
    public class Promote
    {
        private int promoteId;

        public int PromoteId
        {
            get { return promoteId; }
            set { promoteId = value; }
        }
        private String promoteName;

        public String PromoteName
        {
            get { return promoteName; }
            set { promoteName = value; }
        }
        private int discount;

        public int Discount
        {
            get { return discount; }
            set { discount = value; }
        }
        public Promote(DataRow dr)
        {
            this.promoteId = (int)dr["PromoteId"];
            this.promoteName = dr["PromoteName"].ToString();
            this.discount = (int)dr["Discount"];
        }
    }
}
