using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WEB
{
    public partial class Mesaj : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToBoolean(Session["giris"]) != true) { Response.Redirect("Giris.aspx?msg=Oncelikle giris yapmalisiniz"); }

            int ida = Convert.ToInt32(Session["Arkadas"].ToString());
            int kullaniciid = DB.idcek(Session["Kullanici"].ToString());
            if(!DB.Arkadaskontrol(ida,kullaniciid))
            {
                Button1.Enabled = false;
                Button1.Text = "Bu kişi arkadaşınız değil";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int ida = Convert.ToInt32(Session["Arkadas"].ToString());
            int kullaniciid = DB.idcek(Session["Kullanici"].ToString());
            string mesaj = TextBox1.Text;
            DB.Mesaj(kullaniciid, ida, mesaj);
            TextBox1.Text = "";
            Label1.Visible = true;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("ArkadasProfil.aspx");
        }
    }
}