<%@ Page Language="VB" AutoEventWireup="false" CodeFile="login.aspx.vb" Inherits="login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>管理员登陆</title>
</head>
<body onload="Javascript:form1.password.focus()">
    >
    <form id="form1" method="post" runat="server">
    <table id="Table3" style="margin-bottom: 5px; width: 300px; height: 100px" cellspacing="0"
        cellpadding="1" width="200" border="0">
        <tr>
            <td>
                <p align="center">
                    <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label><br />
                    请输入管理员密码:<br />
                    <asp:TextBox ID="password" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:TextBox ID="TextBox1" runat="server" Width="0px"></asp:TextBox>
                    <asp:Button ID="Button1" runat="server" Text="登录" />
                </p>
            </td>
        </tr>
    </table>
    </form>
    <%--    <form id="form1" runat="server">
    <div>
    </div>
    </form>--%>
</body>
</html>