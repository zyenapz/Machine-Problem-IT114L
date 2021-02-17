using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using System.Data.OleDb;

namespace MP_Prototype
{
    //**Global variable to hold ID of current user**//
    static class CurrentID
    {
        public static int current;
    }

    public partial class LogIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogIn_Click(object sender, EventArgs e)
        {
            bool valid = ValidateLog();
            if (valid)
            {
                var date = DateTime.Now;
                string connstr = "Provider=Microsoft.Jet.OleDB.4.0; Data Source=";
                connstr += Server.MapPath("~/App_Data/db_TradeLedger.Mdb");
                OleDbConnection conn = new OleDbConnection(connstr);
                conn.Open();

                //Update Login Date
                OleDbCommand cmd = new OleDbCommand("update tbl_Trader set Date_LogIn = '"+date+"' where Trader_ID = "+CurrentID.current,conn);
                cmd.ExecuteNonQuery();
                conn.Close();

                Response.Redirect("Home.aspx");
            }
            else
            {
                MessageBox.Show("Invalid ID/Number or Password.");
            }
        }

        //Validate ID/Number and Password
        public bool ValidateLog()
        {
            string connstr = "Provider=Microsoft.Jet.OleDB.4.0; Data Source=";
            connstr += Server.MapPath("~/App_Data/db_TradeLedger.Mdb");
            OleDbConnection conn = new OleDbConnection(connstr);
            conn.Open();

            OleDbCommand cmd = new OleDbCommand("select * from tbl_Trader", conn);
            OleDbDataReader reader = cmd.ExecuteReader();

            bool valid = false;
            while (reader.Read())
            {
                if (reader[5].ToString() == txtIdNum.Text || reader[0].ToString() == txtIdNum.Text)
                {
                    if (reader[4].ToString() == txtPass.Text)
                    {
                        valid = true;
                        CurrentID.current = int.Parse(reader[0].ToString());
                        break;
                    }
                }
            }

            conn.Close();
            return valid;
        }
    }
}
