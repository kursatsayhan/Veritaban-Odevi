using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WEB
{
    public partial class FilmAra : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToBoolean(Session["giris"]) != true) { Response.Redirect("Giris.aspx?msg=Oncelikle giris yapmalisiniz"); }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string arama = TextBox1.Text;
            

            GridView1.DataSource = DB.ismegorefilmara(arama);
            GridView1.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int secili = GridView1.SelectedIndex;
            string ad = GridView1.Rows[secili].Cells[2].Text;
            Session["FilmAdı"] = ad;
            Response.Redirect("FilmDetay.aspx");
        }

        protected void Button11_Click(object sender, EventArgs e)
        {
            Response.Redirect("Anasayfa.aspx");
        }
    }
}