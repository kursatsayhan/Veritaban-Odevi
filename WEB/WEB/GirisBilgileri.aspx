<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GirisBilgileri.aspx.cs" Inherits="WEB.GirisBilgileri" %>

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
            background: linear-gradient(135deg, #5B247A 0%, #1BCEDF 100%);
        }
        .myDiv1 {  
  -webkit-box-shadow: 5px 5px 100px 1px #000000;
box-shadow: 5px 5px 100px 1px #000000;
  background: rgb(23,234,217);
background: linear-gradient(300deg, rgba(23,234,217,1) 0%, rgba(96,120,234,1) 100%);
background-repeat: no-repeat; 
  margin-left:400px;
  margin-top:100px;
  border-radius:30px 30px 30px 30px;
  text-align:center;
        }
        .textbox {
     border:none;
     border-bottom:1px solid #ffffff;
     background-color:transparent;
     outline:none;
     height:50px;
     width:300px;
     font-size:18px;
     color:#ffffff;
     
}.textbox1 {
     border:none;
     border-bottom:1px solid #ffffff;
     background-color:transparent;
     outline:none;
     height:30px;
     width:200px;
     font-size:11px;
     color:#ffffff;
     
}
 .textbox2 {
     border:none;
     border-bottom:1px solid #ffffff;
     background-color:transparent;
     outline:none;
     height:50px;
     width:300px;
     font-size:18px;
     color:#000000;
     
}
::placeholder{
    color:#ffffff;
    opacity:0.5;
    font-size:16px;
}
.myButton {
	background:linear-gradient(to bottom, #56b4c4 5%, #4c39db 100%);
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
}
 .demoFont {
font-family: "Comic Sans MS", cursive, sans-serif;
font-size: 20px;
letter-spacing: 1px;
word-spacing: 6px;
color: #000000;
font-weight: 700;
text-decoration: none;
font-style: normal;
font-variant: small-caps;
text-transform: none;
}
 .myButton {
	background:linear-gradient(to bottom, #56b4c4 5%, #4c39db 100%);
	background-color:#56b4c4;
	border-radius:42px;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:16px;
	font-weight:bold;
	padding:8px 76px;
	text-decoration:none;
	text-shadow:4px 1px 0px #1c7d8a;
}
.myButton:hover {
	background:linear-gradient(300deg, #4c39db 5%, #56b4c4 100%);
	background-color:#4c39db;
}
.myButton:active {
	position:relative;
	top:1px;
}
        #Select1 {
            width: 149px;
            height: 17px;
        }
    </style>
</head>
<body class="form" style="height: 921px">
    <form id="form1" runat="server">
        <div class=myDiv1 style="height: 801px; width: 355px">
            <asp:Label ID="Label7" runat="server" Text="Label" Font-Size="Large"></asp:Label>
            <br />
            &nbsp;<br />
            <asp:Button class=myButton ID="Button3" runat="server" Height="32px" Text="Güncellemek için Bilgileri Çek" Width="321px" OnClick="Button3_Click" Font-Size="X-Small" />
            <br />
&nbsp;<asp:TextBox placeholder="e posta..." class="textbox" ID="TextBox1" runat="server" CssClass="textbox"></asp:TextBox>
            <br />
            <asp:Label ID="Label5" runat="server" Text="Label" Font-Size="Large" Visible="False"></asp:Label>
            <br />
            <asp:Button class=myButton ID="Button4" runat="server" Height="54px" Text="Kaydet" Width="237px" OnClick="Button4_Click" />
            <br />
            <br />
            <asp:TextBox placeholder="eski sifre..." class="textbox" ID="TextBox2" runat="server" CssClass="textbox" TextMode="Password"></asp:TextBox>
            <br />
            <br />
            <asp:TextBox placeholder="yeni sifre..." class="textbox" ID="TextBox3" runat="server" CssClass="textbox" TextMode="Password"></asp:TextBox>
            <br />
            <br />
            <br />
            <asp:Label ID="Label6" runat="server" Text="Label" Font-Size="Large" Visible="False"></asp:Label>
            <br />
            <asp:Button class=myButton ID="Button5" runat="server" Height="54px" Text="Kaydet" Width="237px" OnClick="Button5_Click" />
            <br />
            <br />
            <asp:TextBox placeholder="kullanici adi..." class="textbox" ID="TextBox4" runat="server" CssClass="textbox"></asp:TextBox>
            &nbsp;
            <br />
            <br />
            <br />
            &nbsp; <asp:Label ID="Label4" runat="server" Text="Label" Font-Size="Large" Visible="False"></asp:Label>
            <br />
            <br />
&nbsp;<asp:Button class=myButton ID="Button1" runat="server" Height="54px" Text="Kaydet" Width="237px" OnClick="Button1_Click" />
            <br />
            <br />
            <br />
            <br />
            &nbsp;
            <asp:Button class=myButton ID="Button2" runat="server" Height="54px" Text="Profile Dön" Width="237px" OnClick="Button2_Click" />
            <br />
            <br />
        </div>
    </form>
</body>
</html>
