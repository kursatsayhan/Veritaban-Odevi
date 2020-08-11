using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WEB
{
    public partial class Anasayfa : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToBoolean(Session["giris"]) != true) { Response.Redirect("Giris.aspx?msg=Oncelikle giris yapmalisiniz"); }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Profil.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Session["giris"] = false;
            Response.Redirect("Giris.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("KisiAra.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("FilmAra.aspx");
        }
    }
}