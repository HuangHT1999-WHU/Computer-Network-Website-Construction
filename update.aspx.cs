
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
    public partial class update : System.Web.UI.Page
    {
        public int PageCount, RecordCount;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                OleDbConnection myConnection = new OleDbConnection("provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Server.MapPath("news.accdb"));
                OleDbDataAdapter myCommand = new OleDbDataAdapter("Select id,typename FROM types", myConnection);
                DataSet ds = new DataSet();
                myCommand.Fill(ds, "types");
                DropDownList2.DataSource=ds.Tables["types"].DefaultView;
                DropDownList2.DataTextField = "typename";
                DropDownList2.DataValueField = "id";
                DropDownList2.DataBind();
                DataBind();
            }
            DataBind();
        }
        DataView CreateDataSource()
        {
            OleDbConnection myConnection = new OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Server.MapPath("news.accdb"));
            OleDbDataAdapter myCommand = new OleDbDataAdapter("select * FROM contents WHERE typeid= "+DropDownList2.SelectedItem.Value+" order by shijian desc", myConnection);
            DataSet ds = new DataSet();
            myCommand.Fill(ds, "contents");
            return ds.Tables["contents"].DefaultView;
        }
        void DataBind()
        {
            DataView source = CreateDataSource();
            if (!IsPostBack)
            {
                RecordCount = source.Count;
                PageCount = RecordCount / MyList.PageSize;
                if ((RecordCount % MyList.PageSize) != 0) PageCount++;
                lblRecordCount.Text = RecordCount.ToString();
                lblPageCount.Text = PageCount.ToString();
                lblCurrentpage.Text = "1";
            }
            MyList.DataSource = source;
            MyList.DataBind();
        }
        public void MyList_Page(Object sender, DataGridPageChangedEventArgs e)
        {
            MyList.CurrentPageIndex = e.NewPageIndex;
            DataBind();
        }
        public void txtIndex_Changed(Object sender, EventArgs e)
        {
            btnFirst.Enabled = true;
            btnLast.Enabled = true;
            btnNext.Enabled = true;
            btnPrev.Enabled = true;
            int index = Int32.Parse(txtIndex.Text.ToString());
            PageCount = Int32.Parse(lblPageCount.Text.ToString());
            if (index >= 1 && index <= PageCount)
            {
                MyList.CurrentPageIndex = index - 1;
                DataBind();
                lblCurrentpage.Text = index.ToString();
                if (index == 1)
                {
                    btnFirst.Enabled = false;
                    btnNext.Enabled = false;
                }
                else if (index == PageCount)
                {
                    btnLast.Enabled = false;
                    btnNext.Enabled = false;
                }
                else
                {
                    txtIndex.Text = "";
                }
                DataBind();
            }
        }
        public void PagerButtonClick(Object sender, CommandEventArgs e)
        {
            btnFirst.Enabled = true;
            btnLast.Enabled = true;
            btnNext.Enabled = true;
            btnPrev.Enabled = true;
            String arg = e.CommandArgument.ToString();
            PageCount = Int32.Parse(lblPageCount.Text.ToString());
            int pageindex = Int32.Parse(lblCurrentpage.Text.ToString()) - 1;
            switch(arg)
            {
                case"next":
                    if(pageindex<(PageCount-1))
                        pageindex++;
                    break;
                case"Prev":
                    if(pageindex>0)
                        pageindex++;
                    break;
                case"Last":
                    pageindex=(PageCount-1);
                    break;
                case"First":
                    pageindex=0;
                    break;
            }
            if(pageindex==0)
            {
            btnFirst.Enabled=false;
                btnPrev.Enabled=false;
            }
            else if(pageindex==PageCount-1)
            {
                btnLast.Enabled=false;
                btnNext.Enabled=false;
            }
            MyList.CurrentPageIndex =pageindex;
            DataBind();
            lblCurrentpage.Text=(MyList.CurrentPageIndex+1).ToString();
        }
        public void SubmitBtn_Click(Object sender, EventArgs e)
        {
            OleDbConnection myConnection = new OleDbConnection("Provideer=Microsoft.ACE.OLEDB.12.0;Data Source=" + Server.MapPath("news.accdb"));
            OleDbDataAdapter myCommand = new OleDbDataAdapter("select*FROM contents WHERE " + DropDownList1.SelectedItem.Value + "like'%" + TextBox1.Text.ToString() + "%'", myConnection);
            DataSet ds = new DataSet();
            myCommand.Fill(ds, "Contents");
            MyList.DataSource = ds.Tables["Contents"].DefaultView;
            MyList.DataBind();
        }
        public void MyDataGrid_Delete(Object sender, DataGridCommandEventArgs e)
        {
            OleDbConnection myConnection = new OleDbConnection("provideer=Microsoft.ACE.OLEDB.12.0;Data Source=" + Server.MapPath("news.accdb"));
            String deleteCmd = "DELETE from contents where id=@Id";
            OleDbCommand myCommand = new OleDbCommand(deleteCmd, myConnection);
            myCommand.Parameters.Add(new OleDbParameter("@Id", OleDbType.Char, 11));
            myCommand.Connection.Open();
            try
            {
                myCommand.ExecuteNonQuery();
            }
            catch (OleDbException)
            { }
            myCommand.Connection.Close();
            DataBind();
        }
        protected string FormatString(string str)
        {
            str = str.Replace(" ", "&nbsp;&nbsp;");
            str = str.Replace("<", "&lt;");
            str = str.Replace(">", "&gt;");
            str = str.Replace("\n".ToString(),"<br>");
            return str;
        }
    }
}