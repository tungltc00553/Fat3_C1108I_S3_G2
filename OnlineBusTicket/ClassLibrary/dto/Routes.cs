using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ClassLibrary.dto
{
    class Routes
    {
        private int routesId;

        public int RoutesId
        {
            get { return routesId; }
            set { routesId = value; }
        }
        private String routesName;

        public String RoutesName
        {
            get { return routesName; }
            set { routesName = value; }
        }
        private String startPlace;

        public String StartPlace
        {
            get { return startPlace; }
            set { startPlace = value; }
        }
        private String destinationPlace;

        public String DestinationPlace
        {
            get { return destinationPlace; }
            set { destinationPlace = value; }
        }
        private DateTime createDate;

        public DateTime CreateDate
        {
            get { return createDate; }
            set { createDate = value; }
        }
        private int time;

        public int Time
        {
            get { return time; }
            set { time = value; }
        }
        private String decsription;

        public String Decsription
        {
            get { return decsription; }
            set { decsription = value; }
        }
        private bool status;

        public bool Status
        {
            get { return status; }
            set { status = value; }
        }
        public Routes()
        {

        }
    }
}
