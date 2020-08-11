<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Giris.aspx.cs" Inherits="WEB.Giris" %>

<!DOCTYPE html>

<html  xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
            <style>
.myDiv {  
  -webkit-box-shadow: 5px 5px 100px 1px #000000;
box-shadow: 5px 5px 100px 1px #000000;
  background: rgb(23,234,217);
background: linear-gradient(300deg, rgba(23,234,217,1) 0%, rgba(96,120,234,1) 100%);
background-repeat: no-repeat; 
background-position: center center;
  text-align:center;
  margin-left:750px;
  margin-top:100px;
  border-radius:30px 30px 30px 30px  
}
.form {
            background: #5B247A;
            background: -moz-linear-gradient(-45deg, #5B247A 0%, #1BCEDF 100%);
            background: -webkit-linear-gradient(-45deg, #5B247A 0%, #1BCEDF 100%);
            background: linear-gradient(135deg, #5B247A 0%, #1BCEDF 100%);
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
     
}
::placeholder{
    color:#ffffff;
    opacity:0.5;
    font-size:16px;
}
.label
{
    font-size:40px;
    color:#BAF2F3;
    letter-spacing:10px;
    font-weight:700;
}
.myButton {
	box-shadow: 0px 0px 5px 4px #3770cc;
	background-color:transparent;
	border-radius:17px;
	border:1px solid #4a88e6;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:24px;
    letter-spacing:5px;
	font-weight:bold;
	padding:10px 39px;
	text-decoration:none;
                    }
.myButton:hover {
	background-color:transparent;
}
.myButton:active {
	position:relative;
	top:1px;
}


</style>
</head>
<body class=form style="height: 828px;width:1px">
    <form  id="form1" runat="server">
        <div class=myDiv style="height: 650px; width:350px">
               
            <br />
            <br />
            <asp:Label class="label" ID="Label1" runat="server" Text="LOGIN"></asp:Label>
            <br />
            <br />
            
            <br />
               
            <br />
            <br />
            <br />
               
            <asp:TextBox placeholder="Kullanıcı Adınızı Giriniz" class="textbox" ID="TextBox1" runat="server" CssClass="textbox"></asp:TextBox>
            <br />
               
            
            <br />
            <br />
               
            
            <br />
            <br />
               
            <br />
               
            <asp:TextBox placeholder="Şifrenizi Giriniz" class="textbox" ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
            <br />
            <br />
            <br />
            <br />
            <br />
            <asp:Button class="myButton" ID="Button1" runat="server" Text="Giriş Yap" Height="58px" OnClick="Button1_Click" Width="214px" />
&nbsp;<br />
            <br />
            <asp:Label ID="Label2" runat="server" ForeColor="#FF5050" Text="Kullanıcı adı veya şifre hatalı" Visible="False"></asp:Label>
            <br />
            <br />
            <br />
            <br />
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True"  Font-Size="16px" NavigateUrl="~/kayit.aspx">Kayıtlı değil misin ? Kayıt olmak için tıklayınız...</asp:HyperLink>
        </div>       
   </form>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
</body>
</html>
