using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ClassLibrary.dto
{
    public class Role
    {
        private int roleId;

        public int RoleId
        {
            get { return roleId; }
            set { roleId = value; }
        }
        private String roleName;

        public String RoleName
        {
            get { return roleName; }
            set { roleName = value; }
        }
        public Role()
        {

        }
    }
}
