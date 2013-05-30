using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ClassLibrary.dto;
using ClassLibrary.dal;

namespace ClassLibrary.bll
{
    public class AccountBll
    {
        /*
         * @todo: login 
         * */
        public static object Login(String username, String password)
        {
            return AccountDal.Login(username,password);
        }
        /*
         * @todo: get acc by username
         * */
        public static int GetAccountIdByUsername(string username)
        {
            return (int)AccountDal.GetAccountIdByUsername(username);
        }
    }
}
