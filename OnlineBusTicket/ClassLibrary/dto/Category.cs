using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ClassLibrary.dto
{
    class Category
    {
        private int categoryId;

        public int CategoryId
        {
            get { return categoryId; }
            set { categoryId = value; }
        }
        private String categoryName;

        public String CategoryName
        {
            get { return categoryName; }
            set { categoryName = value; }
        }
        public Category()
        {

        }
    }
}
