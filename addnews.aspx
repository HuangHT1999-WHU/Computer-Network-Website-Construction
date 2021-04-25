<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addnews.aspx.cs" Inherits="news.addnews" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>添加新闻</title>
    <style type="text/css">
        .style1
        {
            height: 25px;
        }
    </style>
</head>
<body bgcolor="#99ccff" text="000000" background="back.jpg">
    <h2 align="center">
        添加新闻页面</h2>
    <form id="form1" enctype="multipart/form-data" runat="server">
    <table border="0" align="center" style="width: 71%">
        <tr>
            <td colspan="2" class="style1">
                类别:<asp:DropDownList ID="DropDownList2" runat="server" Height="17px" Width="131px" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <div align="center">
                    <asp:Label ID="Label1" ForeColor="Red" runat="server" />
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                标题：<asp:TextBox ID="biaoti" runat="server" Height="16px" Width="342px" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                内容：<asp:TextBox ID="neirong" TextMode="MultiLine" Height="300px" Width="839px" runat="server" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                作者：<asp:TextBox ID="zuozhe" runat="server" />
            </td>
        </tr>
        <tr>
            <td width="73%">
                图片：<input id="File1" type="file" accept="Image/*" runat="server" />
            </td>
        </tr>
        <tr>
            <td width="73%">
                <asp:Label ID="Span1" runat="server" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="button" id="button1" value="发表" onserverclick="Button1_Click" runat="server" />
                <asp:Button ID="button2" Text="取消" OnClick="reset_Click" runat="server" />
            </td>
        </tr>
    </table>
    <div>
    </div>
    </form>
</body>
</html>
