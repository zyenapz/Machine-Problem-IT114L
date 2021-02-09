using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using System.Data.OleDb;
using System.Data;

/*
Dev Notes:
    -Pag multiple users nagrequest for the same item
     Isa lang pwede i-accept, marked as declined yung mga di inaccept

    -Pag nagrequest si userA to multiple users 
     Tapos same item to give back yung nilagay ni userA sa mga requests
     Kung sino unang makaaccept siya lang makakatrade niya
     Madedelete yung ibang request since nakuha na yung item to guve ni userA
     (Parang first come first served)

    -Wala pang way para malaman ng users status ng requests nila
*/

namespace MP_Prototype
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ShowProducts();
            ShowInfo();
            ShowReq();
        }

        public void ShowInfo()
        {
            string connstr = "Provider=Microsoft.Jet.OleDB.4.0; Data Source=";
            connstr += Server.MapPath("~/App_Data/db_TradeLedger.Mdb");
            OleDbConnection conn = new OleDbConnection(connstr);

            conn.Open();

            OleDbCommand cmd = new OleDbCommand("select * from tbl_Trader where Trader_ID = "+CurrentID.current,conn);
            OleDbDataReader reader = cmd.ExecuteReader();
            reader.Read();
            imgProfile.ImageUrl = "Images/"+reader[8].ToString();
            lblID.Text = CurrentID.current.ToString();
            lblName.Text = reader[2].ToString() + " " + reader[1].ToString();
            lblEmail.Text = reader[6].ToString();
            lblNum.Text = reader[5].ToString();

            conn.Close();
        }

        public void ShowProducts()
        {
            string connstr = "Provider=Microsoft.Jet.OleDB.4.0; Data Source=";
            connstr += Server.MapPath("~/App_Data/db_TradeLedger.Mdb");
            OleDbConnection conn = new OleDbConnection(connstr);

            conn.Open();

            OleDbCommand cmd = new OleDbCommand("select Product_ID,Product_Name,Product_Desc,Product_Categ from tbl_Product where Trader_ID = "+CurrentID.current,conn);
            OleDbDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                OleDbDataAdapter adapter = new OleDbDataAdapter("select Product_ID,Product_Name,Product_Desc,Product_Categ from tbl_Product where Trader_ID = " + CurrentID.current, conn);
                DataTable dtbl = new DataTable();
                adapter.Fill(dtbl);

                dgvMyProducts.AutoGenerateColumns = false;
                dgvMyProducts.DataSource = dtbl;
                dgvMyProducts.DataBind();
            }

            conn.Close();
        }

        public void ShowReq()
        {
            string connstr = "Provider=Microsoft.Jet.OleDB.4.0; Data Source=";
            connstr += Server.MapPath("~/App_Data/db_TradeLedger.Mdb");
            OleDbConnection conn = new OleDbConnection(connstr);

            conn.Open();

            OleDbCommand cmd = new OleDbCommand("select Request_ID,Product_Take,Requester_ID,Product_Give,Product_Desc,Shipping from tbl_Request where Receiver_ID = " + CurrentID.current, conn);
            OleDbDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                OleDbDataAdapter adapter = new OleDbDataAdapter("select Request_ID,Product_Take,Requester_ID,Product_Give,Product_Desc,Shipping from tbl_Request where Receiver_ID = " + CurrentID.current+";",conn);
                DataTable dtbl = new DataTable();
                adapter.Fill(dtbl);

                dgvReqs.AutoGenerateColumns = false;
                dgvReqs.DataSource = dtbl;
                dgvReqs.DataBind();
            }

            conn.Close();
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditInfo.aspx");
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddProduct.aspx");
        }

        protected void btnDel_Click(object sender, EventArgs e)
        {
            Response.Redirect("DelProduct.aspx");
        }

        protected void btnLogOut_Click(object sender, EventArgs e)
        {
            Response.Redirect("LogIn.aspx");
            CurrentID.current = 0;
        }

        protected void btnAccept_Click(object sender, EventArgs e)
        {
            int TakeID = 0;

            string connstr = "Provider=Microsoft.Jet.OleDB.4.0; Data Source=";
            connstr += Server.MapPath("~/App_Data/db_TradeLedger.Mdb");
            OleDbConnection conn = new OleDbConnection(connstr);

            conn.Open();

            OleDbCommand cmd = new OleDbCommand("select * from tbl_Request where Request_ID = "+int.Parse(txtReqID.Text)+";", conn);
            OleDbDataReader reader = cmd.ExecuteReader();
            reader.Read();

            if (reader.HasRows)
            {
                TakeID = int.Parse(reader[8].ToString());

                cmd = new OleDbCommand("insert into tbl_History(Requester_ID,Receiver_ID,Product_Take,Product_Give,Shipping,Status,Take_ID,Give_ID) values(" +
                    reader[4]+","+reader[1]+",'"+reader[2].ToString()+"','"+reader[5].ToString()+"','"+reader[7].ToString()+"','1',"+reader[8]+","+reader[9]+");", conn);
                cmd.ExecuteNonQuery(); 

                //Delete items involved in transaction from Product table
                cmd = new OleDbCommand("delete from tbl_Product where Product_ID = "+reader[8]+";", conn);
                cmd.ExecuteNonQuery();
                cmd = new OleDbCommand("delete from tbl_Product where Product_ID = " + reader[9] + ";", conn);
                cmd.ExecuteNonQuery();

                //First come first served basis
                cmd = new OleDbCommand("delete from tbl_Request where Give_ID = "+reader[9]+";", conn);
                cmd.ExecuteNonQuery();       
            }

            conn.Close();

            if(TakeID != 0)
                MarkDec(TakeID); //Mark as Declined 

            MessageBox.Show("Transaction Complete!");
        }
        
        //Mark as declined function
        public void MarkDec(int TakeID)
        {
            string connstr = "Provider=Microsoft.Jet.OleDB.4.0; Data Source=";
            connstr += Server.MapPath("~/App_Data/db_TradeLedger.Mdb");
            OleDbConnection conn = new OleDbConnection(connstr);

            conn.Open();

            OleDbCommand cmd = new OleDbCommand("select * from tbl_Request where Take_ID = " + TakeID + ";", conn);
            OleDbDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                //Mark as declined
                while (reader.Read())
                {
                    cmd = new OleDbCommand("insert into tbl_History(Requester_ID,Receiver_ID,Product_Take,Product_Give,Shipping,Status,Take_ID,Give_ID) values(" +
                    reader[4] + "," + reader[1] + ",'" + reader[2].ToString() + "','" + reader[5].ToString() + "','" + reader[7].ToString() + "','2'," + reader[8] + "," + reader[9] + ");", conn);
                    cmd.ExecuteNonQuery();
                }

                cmd = new OleDbCommand("delete from tbl_Request where Take_ID = " + TakeID + ";", conn);
                cmd.ExecuteNonQuery();
            }

            conn.Close();

        }

        protected void btnDecline_Click(object sender, EventArgs e)
        {
            string connstr = "Provider=Microsoft.Jet.OleDB.4.0; Data Source=";
            connstr += Server.MapPath("~/App_Data/db_TradeLedger.Mdb");
            OleDbConnection conn = new OleDbConnection(connstr);

            conn.Open();

            OleDbCommand cmd = new OleDbCommand("select * from tbl_Request where Request_ID = " + int.Parse(txtReqID.Text) + ";", conn);
            OleDbDataReader reader = cmd.ExecuteReader();
            reader.Read();

            if (reader.HasRows)
            {
                cmd = new OleDbCommand("insert into tbl_History(Requester_ID,Receiver_ID,Product_Take,Product_Give,Shipping,Status,Take_ID,Give_ID) values(" +
                       reader[4] + "," + reader[1] + ",'" + reader[2].ToString() + "','" + reader[5].ToString() + "','" + reader[7].ToString() + "','2'," + reader[8] + "," + reader[9] + ");", conn);
                cmd.ExecuteNonQuery();

                cmd = new OleDbCommand("delete from tbl_Request where Request_ID = " + int.Parse(txtReqID.Text) + ";", conn);
                cmd.ExecuteNonQuery();
                MessageBox.Show("Transaction Complete!");
            }
        }
    }
}