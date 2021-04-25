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
    public partial class addnews : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                OleDbConnection MyConnection = new OleDbConnection("Provider=Microsoft.Ace.Oledb.12.0;Data Source=" + Server.MapPath("news.accdb"));
                OleDbDataAdapter MyCommand = new OleDbDataAdapter("Select id,typename FROM types", MyConnection);
                DataSet ds = new DataSet();
                MyCommand.Fill(ds, "types");
                DropDownList2.DataSource = ds.Tables["types"].DefaultView;
                DropDownList2.DataValueField = "id";
                DropDownList2.DataBind();
            }
        }
        public void Button1_Click(Object sender, EventArgs e)
        {
            string filepath = Server.MapPath("file/" + Path.GetFileName(File1.PostedFile.FileName));
            if ((biaoti.Text == "") || (neirong.Text == "") || (zuozhe.Text == ""))
            {
                Label1.Text = "标题，内容，作者不能为空！";
            }
            else if (biaoti.Text.Length >= 50)
            {
                Label1.Text = "你的标题太长了！";
            }
            else if (File1.PostedFile.ContentLength > 153600)
            {
                Span1.Text = "上传的文件不能超过70kb！";
                return;
            }
            else if (File.Exists(filepath))
            {
                Span1.Text = "上传文件重名，请改名后再上传！";
                return;
            }
            else
            {
                if (File1.PostedFile != null)
                {
                    try
                    {
                        File1.PostedFile.SaveAs(filepath);
                    }
                    catch (Exception exc)
                    {
                        Span1.Text = "保存文件时出错<b>" + filepath + "</b><br>" + exc.ToString();
                    }
                    OleDbConnection MyConnection = new OleDbConnection("Provider=Microsoft.Ace.Oledb.12.0;Data Source=" + Server.MapPath("news.accdb"));
                    OleDbCommand MyCommand = new OleDbCommand("insert into contents(biaoti,neirong,zuozhe,shijian,click,img,typeid)values('" + biaoti.Text.ToString() + "','" + neirong.Text.ToString() + "','" + zuozhe.Text.ToString() + "','" + DateTime.Now.ToString() + "',0,'" + Path.GetFileName(File1.PostedFile.FileName) + "','" + DropDownList2.SelectedItem.Value + "')", MyConnection);
                    MyCommand.Connection.Open();
                    MyCommand.ExecuteNonQuery();
                    MyCommand.Connection.Close();
                    Response.Redirect("default.aspx");
                }
            }
        }
        public void reset_Click(Object sender, EventArgs e)
        {
            biaoti.Text = "";
            neirong.Text = "";
            zuozhe.Text = "";
        
        }
    }
}