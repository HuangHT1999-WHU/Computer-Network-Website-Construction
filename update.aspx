<%@ Page Language="C#" AutoEventWireup="true" CodeFile="update.aspx.cs" Inherits="news.update" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>新闻网站管理</title>
</head>
<body bgcolor="#99ccff" text="#000000" background="back.jpg">
    <form id="form1" runat="server">
    <table width="90%" border="0" align="center">
        <tr>
            <td width="808">
                <div align="center">
                    <font color="#ff0000"><b><font size="3" color="red">新闻网站首页自动发布-管理</font></b></font>
                </div>
            </td>
        </tr>
        <tr>
            <td width="808" height="3">
                <div align="center">
                    请选择新闻类型：
                    <asp:DropDownList ID="DropDownList2" runat="server" />
                    <asp:Button ID="Button3" Text="确定" runat="server" />
                </div>
            </td>
        </tr>
        <tr>
            <td width="808">
                <div align="center">
                    <asp:DataGrid ID="MyList" AllowPaging="true" PageSize="10" OnPageIndexChanged="MyList_Page"
                        PagerStyle-Visible="false" runat="server" Width="800px" GridLines="None" ShowFooter="false"
                        CellPadding="2" CellSpacing="1" font-name="宋体" Font-Size="8pt" EnableViewState="false"
                        AutoGenerateColumns="false" DataKeyField="id" OnDeleteCommand="MyDataGrid_Delete">
                        <Columns>
                            <asp:BoundColumn ItemStyle-Width="150px" HeaderText="" DataField="shijian" />
                            <asp:HyperLinkColumn ItemStyle-Width="400px" HeaderText="" DataNavigateUrlField="id"
                                DataNavigateUrlFormatString="xiu.aspx?id={0}" DataTextField="biaoti" Target="_new" />
                            <asp:ButtonColumn ItemStyle-Width="100px" Text="删除" CommandName="Delete" />
                        </Columns>
                    </asp:DataGrid>
                </div>
            </td>
        </tr>
        <tr>
            <td width="808" height="13">
                <div align="center">
                    <table width="98%" border="0" align="center">
                        <tr>
                            <td width="70%">
                                <div align="center" style="width: 556px">
                                    新闻搜素：
                                    <asp:TextBox ID="TextBox1" runat="server" class="input" title="请输入关键字！！" Width="461px"
                                        Height="17px" />
                                </div>
                            </td>
                            <td width="14%">
                                <div align="center">
                                    <asp:DropDownList ID="DropDownList1" runat="server">
                                        <asp:ListItem Value="zuozhe">按作者查找</asp:ListItem>
                                        <asp:ListItem Value="biaoti">按标题查找</asp:ListItem>
                                        <asp:ListItem Value="neirong">按内容查找</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </td>
                            <td width="14%">
                                <div align="center">
                                    <asp:Button Text="查找" OnClick="SubmitBtn_Click" ID="Button1" class="input1" Width="70"
                                        Height="19" runat="server" />
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
        <tr>
            <td width="808" height="13">
                <table width="98%" border="0" align="center">
                    <tr>
                        <td width="50" height="11">
                            <div align="center">
                                <font size="2" color="#0000A0">分页</font>
                            </div>
                        </td>
                        <td width="50" height="11">
                            <div align="center">
                                <asp:LinkButton ID="btnFirst" runat="server" Text="首页" CommandName="Pager" CommandArgument="First"
                                    ForeColor="Navy" Font-Names="verdana" Font-Size="10pt" OnCommand="PagerButtonClick" />
                            </div>
                        </td>
                        <td width="50" height="11">
                            <div align="center">
                                <asp:LinkButton ID="btnPrev" runat="server" Text="上一页" CommandName="Pager" CommandArgument="Prev"
                                    ForeColor="Navy" Font-Names="verdana" Font-Size="10pt" OnCommand="PagerButtonClick" />
                            </div>
                        </td>
                        <td width="50" height="11">
                            <div align="center">
                                <asp:LinkButton ID="btnNext" runat="server" Text="下一页" CommandName="Pager" CommandArgument="Next"
                                    ForeColor="Navy" Font-Names="verdana" Font-Size="10pt" OnCommand="PagerButtonClick" />
                            </div>
                        </td>
                        <td width="50" height="11">
                            <div align="center">
                                <asp:LinkButton ID="btnLast" runat="server" Text="尾页" CommandName="Pager" CommandArgument="Last"
                                    ForeColor="Navy" Font-Names="verdana" Font-Size="10pt" OnCommand="PagerButtonClick" />
                            </div>
                        </td>
                        <td width="50" height="11">
                            <div align="center">
                                <font color="#000000" size="2">页</font> <font color="#FF0000" size="2">
                                    <asp:Label ID="lblCurrentpage" runat="server" /></font>
                            </div>
                        </td>
                        <td width="50" height="11">
                            <div align="center">
                                <font color="#0000A0" size="2">页</font> <font color="#FF0000" size="2">
                                    <asp:Label ID="lblPageCount" runat="server" /></font>
                            </div>
                        </td>
                        <td width="50" height="11">
                            <div align="center">
                                <font color="#0000A0" size="2">共<font color="#FF0000" size="2"><asp:Label ID="lblRecordCount"
                                    runat="server" /></font>条</font>
                            </div>
                        </td>
                        <td width="50" height="11">
                            <div align="center">
                                <font color="#FF0000" size="2">10</font> <font color="#0000A0" size="2">条记录/页</font>
                            </div>
                        </td>
                        <td width="50" height="11">
                            <div align="center">
                                <font color="#0000A0" size="2">转到第<asp:TextBox class="input" ID="txtIndex" runat="server"
                                    Width="2" Height="1" Columns="2" Font-Size="1px" ForeColor="#0000A0" OnTextChanged="txtIndex_Changed" />页</font>
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <p align="center">
        &nbsp;</p>
    </form>
</body>
</html>
