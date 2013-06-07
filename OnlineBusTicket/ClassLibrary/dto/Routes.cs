using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ClassLibrary.dto
{
    public class Routes
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
        private int startTime;

        public int StartTime
        {
            get { return startTime; }
            set { startTime = value; }
        }
        private String decription;

        public String Decription
        {
            get { return decription; }
            set { decription = value; }
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
