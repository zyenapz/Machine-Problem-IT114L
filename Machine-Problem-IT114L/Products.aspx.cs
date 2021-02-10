using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using System.Data.OleDb;
using System.Data;

namespace MP_Prototype
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ShowProduct();
        }

        public void ShowProduct()
        {
            string filter = Filter(); //Drop down filter

            string connstr = "Provider=Microsoft.Jet.OleDB.4.0; Data Source=";
            connstr += Server.MapPath("~/App_Data/db_TradeLedger.Mdb");
            OleDbConnection conn = new OleDbConnection(connstr);
            conn.Open();

            OleDbCommand cmd = new OleDbCommand("select Product_ID,Product_Name,Product_Desc,Trader_Firstname+' '+Trader_Lastname as Trader_Name," +
                "Trader_ContactNum,Trader_Email,Product_Categ from tbl_Product inner join tbl_Trader on tbl_Product.Trader_ID = tbl_Trader.Trader_ID " +
                "where not tbl_Product.Trader_ID = "+CurrentID.current+""+filter, conn);
            OleDbDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                OleDbDataAdapter adapter = new OleDbDataAdapter("select Product_ID,Product_Name,Product_Desc,Trader_Firstname+' '+Trader_Lastname as Trader_Name," +
                    "Trader_ContactNum,Trader_Email,Product_Categ from tbl_Product inner join tbl_Trader on tbl_Product.Trader_ID = tbl_Trader.Trader_ID " +
                    "where not tbl_Product.Trader_ID = " + CurrentID.current + "" + filter, conn);
                DataTable dtbl = new DataTable();
                adapter.Fill(dtbl);

                dgvProducts.AutoGenerateColumns = false;
                dgvProducts.DataSource = dtbl;
                dgvProducts.DataBind();
            }

            conn.Close();
        }

        public string Filter()
        {
            string str = "";

            if(listFilter.SelectedValue != "All")
            {
                str = " and Product_Categ = '"+listFilter.SelectedValue+"'";
            }

            return str;
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string connstr = "Provider=Microsoft.Jet.OleDB.4.0; Data Source=";
            connstr += Server.MapPath("~/App_Data/db_TradeLedger.Mdb");
            OleDbConnection conn = new OleDbConnection(connstr);
            conn.Open();

            OleDbCommand cmd = new OleDbCommand("select tbl_Product.Trader_ID,Product_ID,Product_Name,Trader_Firstname+' '+Trader_Lastname as Trader_Name," +
                "Trader_ContactNum,Trader_Email from tbl_Product inner join tbl_Trader on tbl_Product.Trader_ID = tbl_Trader.Trader_ID " +
                "where not tbl_Product.Trader_ID = " + CurrentID.current + " and Product_ID = "+int.Parse(txtAddID.Text)+";", conn);
            OleDbDataReader reader = cmd.ExecuteReader();
            reader.Read();

            if (reader.HasRows)
            {
                OleDbCommand comd = new OleDbCommand("insert into tbl_Cart(Trader_ID,Product_ID,Product_Name,Seller_Name,Seller_ContactNum,Seller_Email,Seller_ID) values(" + 
                    CurrentID.current+","+int.Parse(reader[1].ToString())+",'"+
                    reader[2].ToString()+"','"+reader[3].ToString()+"','"+reader[4].ToString()+"','"+reader[5].ToString()+"',"+ 
                    int.Parse(reader[0].ToString()) + ");",conn);
                comd.ExecuteNonQuery();
                MessageBox.Show("Added to cart succesfully!");
            }
            else
                MessageBox.Show("Item does not exist");

            conn.Close();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            txtAddID.Text = "";
        }

    }
}