<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FilmeAlıntıYap.aspx.cs" Inherits="WEB.FilmeAlıntıYap" %>

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
	border-radius:5px;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:12px;
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
<body class="form">
    <form id="form1" runat="server">
        
        <asp:TextBox ID="TextBox1" runat="server" Height="84px" Width="485px"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Ekle" Width="222px" CssClass="myButton" OnClick="Button1_Click" />
        <asp:Label ID="Label1" runat="server" Text="Alıntı Ekleme Başarılı..." Visible="False"></asp:Label>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <asp:Button ID="Button2" runat="server" CssClass="myButton" Text="Film Detay Sayfasına Dön" Width="311px" OnClick="Button2_Click" />
        
    </form>
</body>
</html>
