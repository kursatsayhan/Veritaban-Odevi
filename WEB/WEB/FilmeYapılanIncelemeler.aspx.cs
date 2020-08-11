using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WEB
{
    public partial class FilmeYapılanIncelemeler : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToBoolean(Session["giris"]) != true) { Response.Redirect("Giris.aspx?msg=Oncelikle giris yapmalisiniz"); }
            string film = Session["FilmAdı"].ToString();
            int filmid = Convert.ToInt32(DB.ismegorefilm(film).Tables[0].Rows[0][0].ToString());
            GridView1.DataSource = DB.incelemeCek(filmid);
            GridView1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("FilmDetay.aspx");
        }
    }
}