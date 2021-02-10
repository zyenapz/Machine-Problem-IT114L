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
    public partial class WebForm9 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDel_Click(object sender, EventArgs e)
        {
            string connstr = "Provider=Microsoft.Jet.OleDB.4.0; Data Source=";
            connstr += Server.MapPath("~/App_Data/db_TradeLedger.Mdb");
            OleDbConnection conn = new OleDbConnection(connstr);
            conn.Open();

            OleDbCommand cmd1 = new OleDbCommand("select Product_Name from tbl_Product where Product_ID = "+ int.Parse(txtID.Text), conn);
            OleDbDataReader reader = cmd1.ExecuteReader();
            reader.Read();

            DialogResult result = MessageBox.Show("Delete " + reader["Product_Name"].ToString() + "?", "Delete Product", MessageBoxButtons.YesNo);
            if (result == DialogResult.Yes)
            {
                OleDbCommand cmd = new OleDbCommand("delete from tbl_Product where Product_ID = " + int.Parse(txtID.Text), conn);
                cmd.ExecuteNonQuery();
                MessageBox.Show("Product deleted successfully!");
            }             

            conn.Close();
            Response.Redirect("MyAccount.aspx");
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            txtID.Text = "";
        }
    }
}