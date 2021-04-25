<%@ Page Language="C#" AutoEventWireup="true" CodeFile="xiu.aspx.cs" Inherits="news.xiu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题文档</title>
</head>
<body bgcolor="#99ccff" text="#000000" background="back.jpg">
    <form id="form1" enctype="multipart/form-data" runat="server">
    <table border="0" align="center" style="width: 89%">
        <tr>
            <td colspan="2">
                <div align="center" style="height: 44px">
                    <b style="font-size: xx-large; font-weight: bold; font-family: 黑体; color: #FF0000">管理页面</b>
                </div>
            </td>
        </tr>
        <tr>
        <td colspan="2">
        <div align="center" style="height:46px; width:1096px"><asp:Label ID = "Label1" ForeColor ="Red" runat="server" />
        </div>
        </td>
        </tr>
        <tr>
        <td colspan="2">
        标题：<asp:TextBox ID ="biaoti" runat="server" Height="29px" Width="797px" />
        </td>
        </tr>
        <tr>
        <td colspan="2">
        内容：<asp:TextBox ID ="neirong" TextMode ="MultiLine" Height="300px" Width="800px" runat="server" />
        </td>
        </tr>
        <tr>
        <td colspan="2">
        作者:<asp:TextBox ID="zuozhe" runat ="server" Height="27px" />
        </td>
        </tr>
        <tr>
        <td colspan="2">
        <asp:Button ID ="button2" Text="确定" OnClick="Button1_Click" runat="server" Height="34px" Width="70px" />
        </td>
        </tr>
    </table>
    </form>
</body>
</html>
