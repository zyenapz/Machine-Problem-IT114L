using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using System.Data.OleDb;
using System.Data;
using System.IO; //For image upload

namespace MP_Prototype
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string[] updateData = new string[7];
            updateData = CheckChanges();
            bool valid = ValidatePass();
            if (valid)
            {
                string connstr = "Provider=Microsoft.Jet.OleDB.4.0; Data Source=";
                connstr += Server.MapPath("~/App_Data/db_TradeLedger.Mdb");
                OleDbConnection conn = new OleDbConnection(connstr);
                conn.Open();

                OleDbCommand cmd = new OleDbCommand("update tbl_Trader set Trader_Lastname = '" + updateData[2] + "', Trader_Firstname = '" + updateData[1] + "', Trader_Address = '" +
                    updateData[3] + "', Trader_Pass = '" + updateData[6] + "', Trader_ContactNum = '" + updateData[4] + "', Trader_Email = '" + updateData[5] + "', Trader_Image = '" +
                    updateData[0] + "' where Trader_ID = " + CurrentID.current, conn);
                cmd.ExecuteNonQuery();
                conn.Close();

                MessageBox.Show("Information Updated Successfully!");
                Response.Redirect("MyAccount.aspx");
            }
            else
            {
                MessageBox.Show("Incorrect Current Password.");
                txtCurrPass.Text = "";
            }
            
        }

        public string[] CheckChanges()
        {
            string imgFile,first,last,add,num,email,pass;
            string[] data = new string[7];

            string connstr = "Provider=Microsoft.Jet.OleDB.4.0; Data Source=";
            connstr += Server.MapPath("~/App_Data/db_TradeLedger.Mdb");
            OleDbConnection conn = new OleDbConnection(connstr);
            conn.Open();

            OleDbCommand cmd = new OleDbCommand("select * from tbl_Trader where Trader_ID = "+CurrentID.current,conn);
            OleDbDataReader reader = cmd.ExecuteReader();
            reader.Read();

            //Save file to Images folder (need full path)
            if (ImgUpload.HasFile)
            {
                imgFile = ImgUpload.FileName;
                ImgUpload.SaveAs(Server.MapPath("~/Content/Images/" + ImgUpload.FileName)); 
            }
            else
                imgFile = reader[8].ToString();

            first = txtFirst.Text;
            last = txtLast.Text;
            add = txtAdd.Text;
            num = txtNum.Text;
            email = txtEmail.Text;
            pass = txtNewPass.Text;

            conn.Close();

            data[0] = imgFile;
            data[1] = first;
            data[2] = last;
            data[3] = add;
            data[4] = num;
            data[5] = email;
            data[6] = pass;

            return data;
        }

        //Validate Password Changes
        public bool ValidatePass()
        {
            string connstr = "Provider=Microsoft.Jet.OleDB.4.0; Data Source=";
            connstr += Server.MapPath("~/App_Data/db_TradeLedger.Mdb");
            OleDbConnection conn = new OleDbConnection(connstr);
            conn.Open();

            OleDbCommand cmd = new OleDbCommand("select Trader_Pass from tbl_Trader where Trader_ID = "+CurrentID.current,conn);
            OleDbDataReader reader = cmd.ExecuteReader();
            reader.Read();

            bool valid = true;
            if (txtCurrPass.Text != reader["Trader_Pass"].ToString())
            {
                valid = false;
            }                 

            conn.Close();
            return valid;
        }
    }
}
