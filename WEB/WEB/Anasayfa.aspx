<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Anasayfa.aspx.cs" Inherits="WEB.Anasayfa" %>

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
background-position: center center;
  text-align:center;
  margin-left:100px;
  margin-top:100px;
  border-radius:30px 30px 30px 30px  
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
.myButton:hover {
	background:linear-gradient(300deg, #4c39db 5%, #56b4c4 100%);
	background-color:#4c39db;
}
.myButton:active {
	position:relative;
	top:1px;
}
.myDiv1 {  
  -webkit-box-shadow: 5px 5px 100px 1px #000000;
box-shadow: 5px 5px 100px 1px #000000;
  background: rgb(23,234,217);
background: linear-gradient(300deg, rgba(23,234,217,1) 0%, rgba(96,120,234,1) 100%);
background-repeat: no-repeat; 
background-position: center center;
  text-align:center;
  margin-left:900px;
  margin-top:-645px;
  border-radius:30px 30px 30px 30px  
}
    </style>
</head>
<body class=form style="height: 829px; width:1741px">
    <form id="form1" runat="server">
        <div class=myDiv2 style="height: 645px; width: 337px">
            <br />
            <br />
            <br />
            <asp:Button class="myButton" ID="Button2" runat="server" Text="ÇIKIŞ" OnClick="Button2_Click"/>
            <br />
            <br />
            <br />
            <asp:Button class="myButton" ID="Button1" runat="server" Text="PROFIL" OnClick="Button1_Click"/>
            <br />
            <br />
            <asp:Button class="myButton" ID="Button3" runat="server" Text="Kisi Ara" OnClick="Button3_Click"/>
            <br />
            <br />
            <asp:Button class="myButton" ID="Button4" runat="server" Text="Film Ara" OnClick="Button4_Click"/>
            <br />
            <br />
        </div>
        <div class=myDiv1 style="height: 645px; width: 815px">
            <br />
            <br />
        </div>
        
    </form>
</body>
</html>
