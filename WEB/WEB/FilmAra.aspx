<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FilmAra.aspx.cs" Inherits="WEB.FilmAra" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        .form {
            background: #5B247A;
            background: -moz-linear-gradient(-45deg, #5B247A 0%, #1BCEDF 100%);
            background: -webkit-linear-gradient(-45deg, #5B247A 0%, #1BCEDF 100%);
            background: #5B247A;
            height: 749px;
            width: 1464px;
        } .myButton {
	background-color:#56b4c4;
	border-radius:10px;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:16px;
	font-weight:bold;
	padding:8px 76px;
	text-decoration:none;
	text-shadow:4px 1px 0px #1c7d8a;
            margin-top: 1px;
        }
.myButton:hover {
	background:linear-gradient(300deg, #4c39db 5%, #56b4c4 100%);
	background-color:#4c39db;
}
.myButton:active {
	position:relative;
	top:1px;
}.textbox {
     border-bottom:1px solid #ffffff;
     background-color:transparent;
     outline:none;
     font-size:12px;
     color:#ffffff;
            border-left-style: none;
            border-left-color: inherit;
            border-left-width: medium;
            border-right-style: none;
            border-right-color: inherit;
            border-right-width: medium;
            border-top-style: none;
            border-top-color: inherit;
            border-top-width: medium;
        }
    </style>
</head>
<body class="form" >
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:TextBox class=textbox ID="TextBox1" runat="server" Width="461px" Height="34px"></asp:TextBox>
        <asp:Button class=myButton ID="Button1" runat="server" Text="ARA" Width="208px" Font-Size="Small" Height="38px" OnClick="Button1_Click" />
        <asp:Button ID="Button11" runat="server" Height="37px" Text="Anasayfa" Width="246px" CssClass="myButton" OnClick="Button11_Click" />
        <br />
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" Height="535px" Width="682px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" >
            <Columns>
                <asp:ButtonField ButtonType="Button" CommandName="Select" HeaderText="Profile Git" ShowHeader="True" Text="SEÇ" />
            </Columns>
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
            <RowStyle BackColor="White" ForeColor="#003399" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <SortedAscendingCellStyle BackColor="#EDF6F6" />
            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
            <SortedDescendingCellStyle BackColor="#D6DFDF" />
            <SortedDescendingHeaderStyle BackColor="#002876" />
        </asp:GridView>
    </form>
</body>
</html>