using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ClassLibrary.dto
{
    class Place
    {
        private int placeId;

        public int PlaceId
        {
            get { return placeId; }
            set { placeId = value; }
        }
        private String placeName;

        public String PlaceName
        {
            get { return placeName; }
            set { placeName = value; }
        }
        public Place()
        {

        }
    }
}
