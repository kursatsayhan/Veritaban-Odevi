<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FilmEkle.aspx.cs" Inherits="WEB.FilmEkle" %>

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
    </style>
</head>
<body class=form style="height: 931px; width:1741px">
    <form id="form1" runat="server">
        
        <div class=myDiv1 style="height: 835px; width: 1156px">
            <br />
            <br />
            <asp:Button class=myButton ID="Button3" runat="server" OnClick="Button3_Click" Text="Dataları Ekle" />
            <br />
            <asp:Label ID="Label1" runat="server" Font-Size="Large" Text="Film Adı :"></asp:Label>
            <asp:TextBox placeholder="" class="textbox" ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Font-Size="Large" Text="Yonetmen :"></asp:Label>
            <asp:DropDownList placeholder="" CssClass="textbox2" ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                
            </asp:DropDownList>
            <br />
            <br />
            <asp:Label ID="Label7" runat="server" Font-Size="Large" Text="Kategori :"></asp:Label>
            <asp:DropDownList placeholder="" CssClass="textbox2" ID="DropDownList5" runat="server">
                
            </asp:DropDownList>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Font-Size="Large" Text="Senarist :"></asp:Label>
            <asp:DropDownList placeholder="" CssClass="textbox2" ID="DropDownList2" runat="server">
                
            </asp:DropDownList>
            <br />
            <br />
            <asp:Label ID="Label4" runat="server" Font-Size="Large" Text="Dil :"></asp:Label>
            <asp:DropDownList placeholder="" CssClass="textbox2" ID="DropDownList3" runat="server">
                
            </asp:DropDownList>
            <br />
            <br />
            <asp:Label ID="Label5" runat="server" Font-Size="Large" Text="Odul :"></asp:Label>
            <asp:DropDownList placeholder="Cinsiyet..." CssClass="textbox2" ID="DropDownList4" runat="server">
                
            </asp:DropDownList>
            <br />
            <asp:Label ID="Label6" runat="server" Font-Size="Large" Text="Dakikası :"></asp:Label>
            <asp:TextBox placeholder="" class="textbox" ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button class=myButton ID="Button1" runat="server" OnClick="Button1_Click" Text="Ekle" />
            <br />
            <asp:Label ID="Label8" runat="server" Text="Label" Visible="False"></asp:Label>
            <br />
            <br />
            <br />
            <br />
            <br />
            <asp:Button class=myButton ID="Button2" runat="server" OnClick="Button2_Click" Text="Yonetici Sayfasına Dön" />
        </div>
        
    </form>
</body>
</html>
