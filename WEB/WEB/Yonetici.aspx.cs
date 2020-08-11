using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WEB
{
    public partial class Yonetici : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToBoolean(Session["yonetici"]) != true) { Response.Redirect("Giris.aspx?msg=Oncelikle giris yapmalisiniz"); }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("KullaniciSil.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("FilmDataekle.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("FilmEkle.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("FilmSil.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("FilmDuzenle.aspx");
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            Session["yonetici"] = false;
            Response.Redirect("Giris.aspx");
        }
    }
}