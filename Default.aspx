<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="news._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>������վ��ҳ�Զ�����</title>
    <meta http-equiv="Content-Type" content="text/html;charset=gb2312" />
    <style type="text/css">
        #form1
        {
            height: 492px;
        }
    </style>
</head>
<body bgcolor="#99CCFF" text="#000000" style="height:503px">
    <form id="form1" runat="server">
    <table width="610" border="0" align="center" style="height: 430px">
        <tr>
            <td width="608"height="20">
                <h3 align="center">
                    ������վ��ҳ�Զ�����
                </h3>
            </td>
        </tr>
        <tr>
            <td width="608"height="10">
                <font color="#FF0000">[�ڲ�����].......................
                </font>
            </td>
        </tr>
        <tr>
            <td width="608"height="13">
                <div align="center">
                    <asp:DataGrid ID="MyList" runat="server" width="600" ShowFooter="false" CellPadding="2"
                        CellSpacing="1" Font-Name="����" Font-Size="8pt" EnableViewState="false" AutoGenerateColumns="false">
                        <Columns>
                            <asp:TemplateColumn HeaderText="����" HeaderStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:HyperLink Text='<% # FormatString(DataBinder.Eval(Container.DataItem,"biaoti").ToString()) %>'
                                        NavigateUrl='<%#"Shownews.aspx?id="+ DataBinder.Eval(Container.DataItem,"ID").ToString() %>'
                                        runat="server" />
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="ʱ��" HeaderStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <%#DataBinder.Eval(Container.DataItem,"shijian") %>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                             <asp:TemplateColumn HeaderText="����" HeaderStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <%#DataBinder.Eval(Container.DataItem,"zuozhe") %>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="���ʴ���" HeaderStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <%#DataBinder.Eval(Container.DataItem,"click") %>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                        </Columns>
                    </asp:DataGrid>
                </div>
            </td>
        </tr>
        <tr>
            <td width="608" height="13">
                <div align="right">
                    &gt;&gt;&gt;[<a href="login.aspx" target="_blank">���Ź���</a>[<a href="http://news.sohu.com/">��������</a>]
                </div>
            </td>
        </tr>
        <tr>
            <td width="608" height="10">
                &nbsp;
            </td>
        </tr>

        <tr>
            <td width="608" height="10">
                <font color="#FF0000">[�ⲿ����]...................
                </font>
            </td>
        </tr>
        <tr>
            <td width="608" height="13">
                <div align="center">
                    <asp:DataGrid ID="MyList1" runat="server" Width="600px" ShowFooter="false" CellPadding="2"
                        CellSpacing="1" Font-Name="����" Font-Size="8pt" EnableViewState="false" AutoGenerateColumns="false">
                        <Columns>
                            <asp:TemplateColumn HeaderText="����" HeaderStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:HyperLink ID="HyperLink1" Text='<%#FormatString(DataBinder.Eval(Container.DataItem,"biaoti").ToString()) %>'
                                        NavigateUrl='<%#"Shownews.aspx?id="+DataBinder.Eval(Container.DataItem,"id").ToString() %>'
                                        runat="server" />
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="ʱ��" HeaderStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <%#DataBinder.Eval(Container.DataItem,"shijian") %>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="����" HeaderStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <%#DataBinder.Eval(Container.DataItem,"zuozhe") %>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="���ʴ���" HeaderStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <%#DataBinder.Eval(Container.DataItem,"click") %>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                        </Columns>
                    </asp:DataGrid>
                </div>
            </td>
        </tr>
        <tr>
            <td width="608" height="13">
                <div align="right">
                    &gt;&gt;&gt;[<a href="login.aspx" target="_blank">���Ź���</a>][<a href="http://news.sohu.com/">��������</a>]
                </div>
            </td>
        </tr>
    </table>
    <div>
        <div align="center">
            All rights reserved<font color="#FF0000">&copy; </font>
        </div>
    </div>
    </form>
</body>
</html>
