using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

namespace MP_Prototype
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if(!Page.IsPostBack)
            {
                LabelFeedback.Visible = false;
            }
            
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string connstr = "Provider=Microsoft.Jet.OleDB.4.0; Data Source=" + Server.MapPath("~/App_Data/Inquiries.mdb");
            using (OleDbConnection conn = new OleDbConnection(connstr))
            {
                conn.Open();

                string query = "INSERT INTO Emails (Cust_name, Cust_email, Cust_phone, Subject, Message) " +
                    "VALUES (@name, @email, @phone, @subject, @message)";
                OleDbCommand cmd = new OleDbCommand(query, conn);
                cmd.Parameters.AddWithValue("@name", txtName.Text);
                cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@phone", txtPhoneNo.Text);
                cmd.Parameters.AddWithValue("@subject", drpSubject.SelectedValue);
                cmd.Parameters.AddWithValue("@message", txtMessage.Text);
                cmd.ExecuteNonQuery();
                LabelFeedback.Text = "E-mail sent!";
                LabelFeedback.Visible = true;
            }
            Page.Validate();
            if (Page.IsValid)
            {
                ResetFields();
            }
        }

        private void ResetFields()
        {
            txtEmail.Text = string.Empty;
            txtMessage.Text = string.Empty;
            txtName.Text = string.Empty;
            txtPhoneNo.Text = string.Empty;
        }
    }
}