<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FilmDetay.aspx.cs" Inherits="WEB.FilmDetay" %>

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
	border-radius:42px;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:28px;
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
        #form1 {
            height: 875px;
        }
    </style>
</head>
<body class="form" >
    <form class="form" id="form1" runat="server">
        <asp:Button ID="Button10" runat="server" Height="38px" OnClick="Button10_Click" Text="FilmAra" Width="219px" />
        <asp:Button ID="Button11" runat="server" Height="38px" OnClick="Button11_Click" Text="Anasayfa" Width="219px" />
        <br />
        <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" Height="439px" Width="1464px">
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
        <br />
        <asp:Label ID="Label3" runat="server" Text="Filmin İzlenme Sayısı : " Font-Bold="True" Font-Italic="False" Font-Size="Large"></asp:Label>
        <br />
        <br />
        <asp:Button ID="Button7" runat="server" Text="Bu Filmi İzledim" Height="34px" Width="237px" OnClick="Button7_Click" />
        &nbsp;&nbsp;<asp:Label ID="Label2" runat="server" Text="Film İzlendi." Visible="False"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button8" runat="server" Text="Arkadaşına Öner" Height="34px" Width="237px" OnClick="Button8_Click" />
    &nbsp;<asp:DropDownList ID="DropDownList1" runat="server" Height="55px" Visible="False" Width="243px">
        </asp:DropDownList>
        <asp:Button ID="Button9" runat="server" Text="Öner" Height="34px" Visible="False" Width="237px" OnClick="Button9_Click" />
        <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
        <br />
        <br />
        <br />
        <br />
        <br />
        <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="Large" Text="Filmin Ortalama Puanı :"></asp:Label>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Filme Alıntı Yap" Height="34px" Width="237px" OnClick="Button1_Click" />
    &nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" Text="Filme Inceleme Yap" Height="34px" Width="237px" OnClick="Button2_Click" />
    &nbsp;&nbsp;
        <asp:Button ID="Button3" runat="server" Text="Filme Puan Ver" Height="34px" Width="237px" OnClick="Button3_Click" />
        <br />
        <br />
        <asp:Button ID="Button4" runat="server" Text="Filme Yapılan Alıntılar" Height="34px" Width="237px" OnClick="Button4_Click" />
    &nbsp;&nbsp;
        <asp:Button ID="Button5" runat="server" Text="Filme Yapılan Incelemeler" Height="34px" Width="237px" OnClick="Button5_Click" />
    &nbsp;&nbsp;
        <asp:Button ID="Button6" runat="server" Text="Filme Verilen Puanlar" Height="34px" Width="237px" OnClick="Button6_Click" />
    </form>
</body>
</html>