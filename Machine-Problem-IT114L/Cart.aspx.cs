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
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ShowCart();
        }

        public void ShowCart()
        {
            string connstr = "Provider=Microsoft.Jet.OleDB.4.0; Data Source=";
            connstr += Server.MapPath("~/App_Data/db_TradeLedger.Mdb");
            OleDbConnection conn = new OleDbConnection(connstr);
            conn.Open();

            OleDbCommand cmd = new OleDbCommand("select Product_ID,Product_Name,Seller_ID,Seller_Name,Seller_ContactNum,Seller_Email " +
                "from tbl_Cart where Trader_ID = "+CurrentID.current, conn);
            OleDbDataReader reader = cmd.ExecuteReader();
            
            if (reader.HasRows)
            {
                OleDbDataAdapter adapter = new OleDbDataAdapter("select Product_ID,Product_Name,Seller_ID,Seller_Name,Seller_ContactNum,Seller_Email " +
                    "from tbl_Cart where Trader_ID = " + CurrentID.current,conn);
                DataTable dtbl = new DataTable();
                adapter.Fill(dtbl);

                dgvCart.AutoGenerateColumns = false;
                dgvCart.DataSource = dtbl;
                dgvCart.DataBind();
            }

            conn.Close();
        }

        protected void btnReq_Click(object sender, EventArgs e)
        {
            bool valid;
            valid = ValidateTake();
            if (valid)
            {
                valid = ValidateGive();
                if (valid)
                {
                    string[] data = new string[6];

                    string connstr = "Provider=Microsoft.Jet.OleDB.4.0; Data Source=";
                    connstr += Server.MapPath("~/App_Data/db_TradeLedger.Mdb");
                    OleDbConnection conn = new OleDbConnection(connstr);
                    conn.Open();

                    OleDbCommand cmd = new OleDbCommand("select Seller_ID,Product_Name,Trader_ID,Product_ID from tbl_Cart where Product_ID = "+int.Parse(txtTake.Text)+";", conn);
                    OleDbDataReader reader = cmd.ExecuteReader();
                    reader.Read();

                    for(int i = 0; i < 4; i++)
                    {
                        data[i] = reader[i].ToString();
                    }

                    cmd = new OleDbCommand("select Product_Name,Product_Desc from tbl_Product where Product_ID = "+int.Parse(txtGive.Text)+";",conn);
                    reader = cmd.ExecuteReader();
                    reader.Read();

                    for(int i = 0; i < 2; i++)
                    {
                        data[i+4] = reader[i].ToString();
                    }

                    cmd = new OleDbCommand("insert into tbl_Request(Receiver_ID,Product_Take,Status,Requester_ID,Product_Give,Product_Desc,Shipping,Take_ID,Give_ID) values(" +
                        int.Parse(data[0])+",'"+data[1]+"','3',"+int.Parse(data[2])+",'"+data[4]+"','"+data[5]+"','"+listShip.SelectedValue+"',"+int.Parse(data[3])+","+int.Parse(txtGive.Text)+");", conn);
                    cmd.ExecuteNonQuery();

                    cmd = new OleDbCommand("delete from tbl_Cart where Product_ID = "+int.Parse(txtTake.Text),conn);
                    cmd.ExecuteNonQuery();
                    conn.Close();

                    MessageBox.Show("Request sent succesfully!");
                }
                else
                    MessageBox.Show("You do not own this item");
            }
            else
                MessageBox.Show("Item does not exist in cart");

        }

        //Validate if item to take is in cart
        public bool ValidateTake()
        {
            bool valid = false;

            string connstr = "Provider=Microsoft.Jet.OleDB.4.0; Data Source=";
            connstr += Server.MapPath("~/App_Data/db_TradeLedger.Mdb");
            OleDbConnection conn = new OleDbConnection(connstr);
            conn.Open();

            OleDbCommand cmd = new OleDbCommand("select * from tbl_Cart where Trader_ID = " + CurrentID.current, conn);
            OleDbDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                if (txtTake.Text == reader[2].ToString())
                {
                    valid = true;
                    break;
                }
            }

            conn.Close();
            return valid;
        }

        //Validate if item to give is owned
        public bool ValidateGive()
        {
            bool valid = false;

            string connstr = "Provider=Microsoft.Jet.OleDB.4.0; Data Source=";
            connstr += Server.MapPath("~/App_Data/db_TradeLedger.Mdb");
            OleDbConnection conn = new OleDbConnection(connstr);
            conn.Open();

            OleDbCommand cmd = new OleDbCommand("select * from tbl_Product where Trader_ID = " + CurrentID.current, conn);
            OleDbDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                if (txtGive.Text == reader[0].ToString())
                {
                    valid = true;
                    break;
                }
            }

            conn.Close();
            return valid;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            txtTake.Text = "";
            txtGive.Text = "";
            listShip.SelectedValue = "1";
        }
    }
}
