using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ClassLibrary.dto
{
    class Type
    {
        private int typeId;

        public int TtypeId
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
        public Type()
        {

        }
    }
}
