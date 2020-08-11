using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WEB
{
    public partial class FilmeAlıntıYap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToBoolean(Session["giris"]) != true) { Response.Redirect("Giris.aspx?msg=Oncelikle giris yapmalisiniz"); }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int id = DB.idcek(Session["Kullanici"].ToString());
            
            string film = Session["FilmAdı"].ToString();

            int filmid = Convert.ToInt32(DB.ismegorefilm(film).Tables[0].Rows[0][0].ToString());
            string alinti = TextBox1.Text;
            DB.alıntı(id, filmid, alinti);
            Label1.Visible = true;
            TextBox1.Text = "";
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("FilmDetay.aspx");
        }
    }
}