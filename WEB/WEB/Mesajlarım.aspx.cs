using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WEB
{
    public partial class Mesajlarım : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToBoolean(Session["giris"]) != true) { Response.Redirect("Giris.aspx?msg=Oncelikle giris yapmalisiniz"); }            
            int kullaniciid = DB.idcek(Session["Kullanici"].ToString());
            GridView1.DataSource= DB.Mesajlarım(kullaniciid);
            GridView1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Profil.aspx");
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int secili = GridView1.SelectedIndex;
            string ad = GridView1.Rows[secili].Cells[1].Text;

            int id = Convert.ToInt32(DB.ismegoreid(ad).Tables[0].Rows[0][0].ToString());
            Session["Arkadas"] = id;
            Response.Redirect("ArkadasProfil.aspx");
        }
    }
}