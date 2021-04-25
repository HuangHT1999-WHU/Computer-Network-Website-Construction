using System;
using System.Data;
using System.Data.OleDb;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace news
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                OleDbConnection myConnection = new OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" +Server.MapPath("news.accdb"));
                OleDbDataAdapter myCommond = new OleDbDataAdapter("select top 12 contents.* FROM contents WHERE typeid=1 order by shijian desc", myConnection);
                OleDbDataAdapter myCommond1 = new OleDbDataAdapter("select top 12 contents.* FROM contents WHERE typeid=2 order by shijian desc", myConnection);
                DataSet ds = new DataSet();
                myCommond.Fill(ds, "contents");
                myCommond1.Fill(ds, "types");
                MyList.DataSource = ds.Tables["contents"].DefaultView;
                MyList1.DataSource = ds.Tables["types"].DefaultView;
                MyList.DataBind();
                MyList1.DataBind();
            }
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