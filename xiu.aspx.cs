using System;
using System.Data;
using System.Data.OleDb;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace news
{
    public partial class xiu : System.Web.UI.Page
    {
        public String newsid;
        public DataRow dr;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                newsid = Request.Params["id"];
                OleDbConnection myConnection = new OleDbConnection("provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Server.MapPath("news.accdb"));
                OleDbDataAdapter myCommand = new OleDbDataAdapter("select * FROM contents WHERE id= " + newsid, myConnection);
                DataSet ds = new DataSet();
                myCommand.Fill(ds, "contents");
                dr = ds.Tables["contents"].Rows[0];
                biaoti.Text = dr["biaoti"].ToString();
                neirong.Text = dr["neirong"].ToString();
                zuozhe.Text = dr["zuozhe"].ToString();
            }
        }
        public void Button1_Click(Object Source, EventArgs e)
        {
            newsid = Request.Params["id"];
            OleDbConnection myConnection = new OleDbConnection("provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Server.MapPath("news.accdb"));
            OleDbCommand myCommand = new OleDbCommand("UPDATE contents set biaoti='" + biaoti.Text + "',neirong='" + neirong.Text + "',zuozhe='" + zuozhe.Text + "'WHERE id=" + newsid, myConnection);
            myCommand.Connection.Open();
            myCommand.ExecuteNonQuery();
            myCommand.Connection.Close();
            Response.Redirect("update.aspx");
        }
    }
}