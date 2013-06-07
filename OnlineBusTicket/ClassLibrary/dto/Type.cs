using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ClassLibrary.dto
{
    public class Type
    {
        private int typeId;

        public int TypeId
        {
            get { return typeId; }
            set { typeId = value; }
        }
        private String typeName;

        public String TypeName
        {
            get { return typeName; }
            set { typeName = value; }
        }
        private String typeImage;

        public String TypeImage
        {
            get { return typeImage; }
            set { typeImage = value; }
        }
        public Type()
        {

        }
    }
}
