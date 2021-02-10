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
    public partial class WebForm8 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string connstr = "Provider=Microsoft.Jet.OleDB.4.0; Data Source=";
            connstr += Server.MapPath("~/App_Data/db_TradeLedger.Mdb");
            OleDbConnection conn = new OleDbConnection(connstr);

            conn.Open();

            OleDbCommand cmd = new OleDbCommand("insert into tbl_Product(Product_Name,Product_Desc,Product_Categ,Trader_ID) values('" + txtName.Text+"','"+
                txtDesc.Text+"','"+listCateg.SelectedValue+"',"+CurrentID.current+");",conn);
            cmd.ExecuteNonQuery();

            conn.Close();
            MessageBox.Show("Product added successfully!");
            Response.Redirect("MyAccount.aspx");
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            txtName.Text = "";
            txtDesc.Text = "";
            listCateg.SelectedValue = "Monitor";
        }
    }
}