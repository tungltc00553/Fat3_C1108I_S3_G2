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
            SqlDataAdapter adapter = new SqlDataAdapter(storedProcedureName, ConnectionString);
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
        /*
         * @todo read database table 's structure
         * */
        protected static DataTable ReadStructure(String storedProcedureName)
        {
            DataTable result = new DataTable();
            SqlDataAdapter adapter = new SqlDataAdapter(storedProcedureName, ConnectionString);
            adapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            try
            {
                adapter.FillSchema(result, SchemaType.Source);
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
        /*
         * @todo: write to database
         * */
        protected static int Write(DataRow dr, String storedProcedureName)
        {
            int result = 0;
            DataTable dt = dr.Table;
            try
            {
                SqlDataAdapter adapter = new SqlDataAdapter(storedProcedureName, ConnectionString);
                adapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                SqlCommandBuilder cmdBuider = new SqlCommandBuilder(adapter);
                result = adapter.Update(dt);
            }
            catch (Exception ex)
            {

                throw;
            }
            return result;
        }
        /*
         * @todo : excute a sql
         * if insert, return indentity id
         * */
        protected static int ExcuteNonQuery(String storedProcedureName, SqlParameter[] arrParameter)
        {
            int count = 0;
            using (SqlConnection conn = new SqlConnection(ConnectionString))
            {
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand(storedProcedureName, conn);
                cmd.CommandType = CommandType.StoredProcedure;
                try
                {
                    if (arrParameter != null)
                    {
                        foreach (SqlParameter parameter in arrParameter)
                        {
                            cmd.Parameters.Add(parameter);
                        }
                    }
                    count = cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {

                }
            }
            return count;
        }

        /*
         * @todo : get a single value
         * */
        protected static object ExcuteScalar(String storedProcedureName, SqlParameter[] arrParameter)
        {
            object result = null;
            using (SqlConnection conn = new SqlConnection(ConnectionString))
            {
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand(storedProcedureName, conn);
                cmd.CommandType = CommandType.StoredProcedure;

                try
                {
                    if (arrParameter != null)
                    {
                        foreach (SqlParameter parameter in arrParameter)
                        {
                            cmd.Parameters.Add(parameter);
                        }
                    }
                    result = cmd.ExecuteScalar();

                }
                catch (Exception ex)
                {

                }
            }
            return result;
        }
    }
}
