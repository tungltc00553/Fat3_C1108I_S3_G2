using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace ClassLibrary.dal
{
    public class ApCoreDBConnect
    {
        private String connectionString;

        public static String ConnectionString
        {
            get { return System.Configuration.ConfigurationManager.ConnectionStrings["OnlineBusTicket"].ToString(); }
        }
        /*
         * @todo: read from database
         * */
        protected static DataTable Read(String storedProcedureName, SqlParameter[] arrParameter)
        {
            DataTable result = new DataTable();
            SqlDataAdapter adapter = new SqlDataAdapter(storedProcedureName,ConnectionString);
            adapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            try
            {
                if (arrParameter != null)
                {
                    foreach (SqlParameter parameter in arrParameter)
                    {
                        adapter.SelectCommand.Parameters.Add(parameter);
                    }
                }
                adapter.FillSchema(result, SchemaType.Source);
                adapter.Fill(result);
                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error: " + ex.Message);
            }
            finally
            {
                adapter.Dispose();
            }
        }
    }
}
