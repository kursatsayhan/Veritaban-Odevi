using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WEB
{
    public partial class ArkadasOnerileri : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToBoolean(Session["giris"]) != true) { Response.Redirect("Giris.aspx?msg=Oncelikle giris yapmalisiniz"); }
            int id = DB.idcek(Session["Kullanici"].ToString());
            
            GridView1.DataSource = DB.ArkadasOnerileri(id);
            GridView1.DataBind(); 
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Profil.aspx");
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int secili = GridView1.SelectedIndex;
            string ad = GridView1.Rows[secili].Cells[2].Text;
            Session["FilmAdı"] = ad;
            Response.Redirect("FilmDetay.aspx");
        }
    }
}