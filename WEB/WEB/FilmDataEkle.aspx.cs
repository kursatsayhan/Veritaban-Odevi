using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WEB
{
    public partial class FilmDataEkle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToBoolean(Session["yonetici"]) != true) { Response.Redirect("Giris.aspx?msg=Oncelikle giris yapmalisiniz"); }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string kategori = TextBox1.Text;
            DB.KategoriEkle(kategori);
            Label6.Visible = true;
            TextBox1.Text = "";
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string yonetmen = TextBox2.Text;
            DB.YonetmenEkle(yonetmen);
            Label7.Visible = true;
            TextBox2.Text = "";
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string senarist = TextBox3.Text;
            DB.SenaristEkle(senarist);
            Label8.Visible = true;
            TextBox3.Text = "";
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            string dil = TextBox4.Text;
            DB.DilEkle(dil);
            Label9.Visible = true;
            TextBox4.Text = "";
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            string odul = TextBox5.Text;
            DB.OdulEkle(odul);
            Label10.Visible = true;
            TextBox5.Text = "";
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            Response.Redirect("Yonetici.aspx");

        }
    }
}