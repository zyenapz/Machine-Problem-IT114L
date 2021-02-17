using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

namespace MP_Prototype
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Load_ProductGrid();
        }

        private void Load_ProductGrid()
        {
            string connstr = "Provider=Microsoft.Jet.OleDB.4.0; Data Source=" + Server.MapPath("~/App_Data/db_TradeLedger.mdb");
            using (OleDbConnection conn = new OleDbConnection(connstr))
            {
                conn.Open();
                string query = "SELECT COUNT(*) FROM tbl_Product";
                OleDbCommand cmd = new OleDbCommand(query, conn);
                int rowCount = Convert.ToInt32(cmd.ExecuteScalar());

                if (rowCount == 0) 
                {
                    LabelEmpty.Text = "Looks like there are no products yet...";
                    // LabelEmpty.Visible = true;
                }
                else
                {
                    query = "SELECT TOP 10 product_name FROM tbl_Product";
                    cmd = new OleDbCommand(query, conn);
                    OleDbDataAdapter da = new OleDbDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    GridViewProducts.DataSource = dt;
                    GridViewProducts.DataBind();
                    // GridViewProducts.HeaderRow.Cells[0].Text = "Product";
                }

            }
        }
    }
}