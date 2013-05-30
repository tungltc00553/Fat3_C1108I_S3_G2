using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace ClassLibrary.dto
{
    public class Bus
    {
        private int busId;

        public int BusId
        {
            get { return busId; }
            set { busId = value; }
        }
        private String busName;

        public String BusName
        {
            get { return busName; }
            set { busName = value; }
        }
        private int categoryId;

        public int CategoryId
        {
            get { return categoryId; }
            set { categoryId = value; }
        }
        private int seat;

        public int Seat
        {
            get { return seat; }
            set { seat = value; }
        }
        private int typeId;

        public int TypeId
        {
            get { return typeId; }
            set { typeId = value; }
        }
        public Bus(DataRow dr)
        {
            this.busId = (int)dr["ListBusId"];
            this.busName = dr["BusName"].ToString();
            this.categoryId = (int)dr["CategoryId"];
            this.seat = (int)dr["Seat"];
            this.typeId = (int)dr["TypeId"];
        }
    }
}
