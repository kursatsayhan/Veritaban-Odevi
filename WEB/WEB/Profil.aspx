<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profil.aspx.cs" Inherits="WEB.Profil" %>

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
        .myDiv2 {  
  -webkit-box-shadow: 5px 5px 100px 1px #000000;
box-shadow: 5px 5px 100px 1px #000000;
  background: rgb(23,234,217);
background: linear-gradient(300deg, rgba(23,234,217,1) 0%, rgba(96,120,234,1) 100%);
background-repeat: no-repeat; 
  margin-left:50px;
  margin-top:0px;
  border-radius:30px 30px 30px 30px  ;
  text-align:center;
}
    .myDiv1 {  
  -webkit-box-shadow: 5px 5px 100px 1px #000000;
box-shadow: 5px 5px 100px 1px #000000;
  background: rgb(23,234,217);
background: linear-gradient(300deg, rgba(23,234,217,1) 0%, rgba(96,120,234,1) 100%);
background-repeat: no-repeat; 
  margin-left:900px;
  margin-top:-800px;
  border-radius:30px 30px 30px 30px;
  text-align:center;
  
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
    </style>
</head>
<body class="form" style="height: 921px">
    <form id="form1" runat="server">
        
        <div class=myDiv2 style="height: 801px; width: 502px">
    
            <br />
            <br />
            <asp:Image ID="Image1" runat="server" Height="180px" Width="320px" />
            <br />
            <br />
            <br />
            <br />
            <br />
&nbsp;
            <asp:Label class=demoFont ID="Label1" runat="server" Text="Adı :"></asp:Label>
            <br />
        
            <br />
            <br />
            <br />
&nbsp;
            <asp:Label class=demoFont ID="Label2" runat="server" Text="Eğitim Durumu :"></asp:Label>
            <br />
            <br />
            <br />
            <br />
&nbsp;
            <asp:Label class=demoFont ID="Label4" runat="server" Text="Şehir :"></asp:Label>
            <br />
            <br />
            <br />
            <br />
&nbsp;
            <asp:Label class=demoFont ID="Label5" runat="server" Text="Doğum Tarihi :"></asp:Label>
            <br />
            <br />
            <br />
&nbsp;
            <asp:Label class=demoFont ID="Label6" runat="server" Text="Cinsiyet :"></asp:Label>
        </div>
        <div class=myDiv1 style="height: 801px; width: 355px">
            <br />
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button class=myButton ID="Button3" runat="server" Text="Anasayfa" Width="282px" OnClick="Button3_Click" />
            <br />
            <br />
            <asp:Button class=myButton ID="Button1" runat="server" Text="Düzenle" Width="238px" OnClick="Button1_Click" />
            <br />
            <br />
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button class=myButton ID="Button2" runat="server" Text="Giris Bilgileri" Width="282px" OnClick="Button2_Click" />
            <br />
            <br />
            <asp:Button class=myButton ID="Button4" runat="server" Text="Arkadaş Önerileri" Width="282px" OnClick="Button4_Click" />
            <br />
            <br />
            <asp:Button class=myButton ID="Button5" runat="server" Text="Mesajlarım" Width="282px" OnClick="Button5_Click" />
            <br />
        </div>

        

    </form>
    <p>
        &nbsp;</p>
    </body>
</html>
