using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms; //Need for message box
using System.Data.OleDb;
using System.Data;

namespace MP_Prototype
{
    public partial class SignIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {         
            bool taken = ValidateNum();
            if (!taken)
            {
                string connstr = "Provider=Microsoft.Jet.OleDB.4.0; Data Source=";
                connstr += Server.MapPath("~/App_Data/db_TradeLedger.Mdb");
                OleDbConnection conn = new OleDbConnection(connstr);

                conn.Open();

                var date = DateTime.Now;
                OleDbCommand cmd = new OleDbCommand("insert into tbl_Trader(Trader_Lastname,Trader_Firstname,Trader_Address,Trader_Pass,Trader_ContactNum,Trader_Email,Date_LogIn,Trader_Image) values ('"+txtLast.Text+"','"+txtFirst.Text+"','"+txtAdd.Text+"','"+
                    txtPass.Text+"','"+txtNum.Text+"','"+txtEmail.Text+"','"+date.ToShortDateString()+"','DefaultPhoto.jpg');",conn);
                cmd.ExecuteNonQuery();
                conn.Close();

                MessageBox.Show("Signed up successfully!");
                Response.Redirect("LogIn.aspx");
            }
            else
            {
                MessageBox.Show("Contact number is already in use by another user.");
            }    
        }

        //***Method to validate if contact number exists***//
        public bool ValidateNum()
        {
            string connstr = "Provider=Microsoft.Jet.OleDB.4.0; Data Source=";
            connstr += Server.MapPath("~/App_Data/db_TradeLedger.Mdb");
            OleDbConnection conn = new OleDbConnection(connstr);

            conn.Open();

            OleDbCommand cmd = new OleDbCommand("select Trader_ContactNum from tbl_Trader", conn);
            OleDbDataReader reader = cmd.ExecuteReader();

            bool taken = false;
            while (reader.Read())
            {
                if (reader["Trader_ContactNum"].ToString() == txtNum.Text)
                {
                    taken = true;
                    break;
                }
            }

            conn.Close();

            return taken;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            txtFirst.Text = "";
            txtLast.Text = "";
            txtAdd.Text = "";
            txtEmail.Text = "";
            txtNum.Text = "";
            txtPass.Text = "";
            txtPassConfirm.Text = "";
        }
    }
}
