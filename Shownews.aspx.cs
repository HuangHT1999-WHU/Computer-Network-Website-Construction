using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.OleDb;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace news
{
    public partial class Shownews : System.Web.UI.Page
    {
        public DataRow dr;
        public String newsid;
        protected void Page_Load(object sender, EventArgs e)
        {
            newsid = Request.Params["id"];
            OleDbConnection myConnection = new OleDbConnection("Provider = Microsoft.ACE.OLEDB.12.0;Data Source=" + Server.MapPath("news.accdb"));
            OleDbDataAdapter myCommand = new OleDbDataAdapter("select * FROM contents WHERE id="+ newsid, myConnection);
            DataSet ds = new DataSet();
            myCommand.Fill(ds, "contents");
            dr = ds.Tables["contents"].Rows[0];
            OleDbCommand myCommand2 = new OleDbCommand("Select click FROM contents WHERE id=" + Request.Params["id"], myConnection);
            myCommand2.Connection.Open();
            OleDbDataReader reader = myCommand2.ExecuteReader( );
            reader.Read();
            int i = reader.GetInt32(0);
            i++;
            reader.Close();
            myCommand2.CommandText = "update Contents SET click="+ i.ToString()+ " WHERE id=" +newsid;
            myCommand2.ExecuteNonQuery();
            myCommand2.Connection.Close();
        }
        public string FormatString(string str)
        {
            str = str.Replace(" ", "&nbsp;&nbsp;");
            str = str.Replace("<", "&lt;");
            str = str.Replace(">", "&gt;");
            str = str.Replace("\n".ToString(), "<br>");
            return str;
        }
    }
}