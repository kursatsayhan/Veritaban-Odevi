<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FilmDataEkle.aspx.cs" Inherits="WEB.FilmDataEkle" %>

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

  border-radius:30px 30px 30px 30px  
}
.textbox {
     border:none;
     border-bottom:1px solid #ffffff;
     background-color:transparent;
     outline:none;
     height:50px;
     width:300px;
     font-size:12px;
     color:#ffffff;
     
}.myButton {
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
    </style>
</head>
<body class=form style="height: 829px; width:1741px">
    <form id="form1" runat="server">
        
        <div class=myDiv1 style="height: 645px; width: 815px">
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Font-Size="Large" Text="Kategori :"></asp:Label>
            <asp:TextBox placeholder="" class="textbox" ID="TextBox1" runat="server"></asp:TextBox>
            <asp:Button ID="Button1" CssClass="myButton" runat="server" Text="Ekle" OnClick="Button1_Click" />
            <asp:Label ID="Label6" runat="server" Font-Size="Large" Text="Başarılı" Visible="False"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Font-Size="Large" Text="Yonetmen :"></asp:Label>
            <asp:TextBox placeholder="" class="textbox" ID="TextBox2" runat="server"></asp:TextBox>
            <asp:Button ID="Button2" CssClass="myButton" runat="server" Text="Ekle" OnClick="Button2_Click" />
            <asp:Label ID="Label7" runat="server" Font-Size="Large" Text="Başarılı" Visible="False"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Font-Size="Large" Text="Senarist :"></asp:Label>
            <asp:TextBox placeholder="" class="textbox" ID="TextBox3" runat="server"></asp:TextBox>
            <asp:Button ID="Button3" CssClass="myButton" runat="server" Text="Ekle" OnClick="Button3_Click" />
            <asp:Label ID="Label8" runat="server" Font-Size="Large" Text="Başarılı" Visible="False"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label4" runat="server" Font-Size="Large" Text="Dil :"></asp:Label>
            <asp:TextBox placeholder="" class="textbox" ID="TextBox4" runat="server"></asp:TextBox>
            <asp:Button ID="Button4" CssClass="myButton" runat="server" Text="Ekle" OnClick="Button4_Click" />
            <asp:Label ID="Label9" runat="server" Font-Size="Large" Text="Başarılı" Visible="False"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label5" runat="server" Font-Size="Large" Text="Odul :"></asp:Label>
            <asp:TextBox placeholder="" class="textbox" ID="TextBox5" runat="server"></asp:TextBox>
            <asp:Button ID="Button5" CssClass="myButton" runat="server" Text="Ekle" OnClick="Button5_Click" />
            <asp:Label ID="Label10" runat="server" Font-Size="Large" Text="Başarılı" Visible="False"></asp:Label>
            <br />
            <br />
            <br />
            <br />
            <br />
            <asp:Button ID="Button6" CssClass="myButton" runat="server" Text="Yonetici" OnClick="Button6_Click" />
        </div>
        
    </form>
</body>
</html>
