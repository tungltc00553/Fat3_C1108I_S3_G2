using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ClassLibrary.dto
{
    class ListBus
    {
        private int listBusId;

        public int ListBusId
        {
            get { return listBusId; }
            set { listBusId = value; }
        }
        private String busPlate;

        public String BusPlate
        {
            get { return busPlate; }
            set { busPlate = value; }
        }
        private int routesId;

        public int RoutesId
        {
            get { return routesId; }
            set { routesId = value; }
        }
        private int busId;

        public int BusId
        {
            get { return busId; }
            set { busId = value; }
        }
        private DateTime departure;

        public DateTime Departure
        {
            get { return departure; }
            set { departure = value; }
        }
        private DateTime arrival;

        public DateTime Arrival
        {
            get { return arrival; }
            set { arrival = value; }
        }
        private decimal price;

        public decimal Price
        {
            get { return price; }
            set { price = value; }
        }
        public ListBus()
        {

        }
    }
}
