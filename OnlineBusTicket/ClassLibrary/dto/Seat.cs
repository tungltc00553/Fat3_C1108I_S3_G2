using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ClassLibrary.dto
{
    public class Seat
    {
        private int seatId;

        public int SeatId
        {
            get { return seatId; }
            set { seatId = value; }
        }
        private int listBusId;

        public int ListBusId
        {
            get { return listBusId; }
            set { listBusId = value; }
        }
        private int numberSeat;

        public int NumberSeat
        {
            get { return numberSeat; }
            set { numberSeat = value; }
        }
        private bool status;

        public bool Status
        {
            get { return status; }
            set { status = value; }
        }
        public Seat()
        {

        }
    }
}
