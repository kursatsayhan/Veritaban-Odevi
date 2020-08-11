using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WEB
{
    public partial class FilmDetay : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Convert.ToBoolean(Session["giris"]) != true) { Response.Redirect("Giris.aspx?msg=Oncelikle giris yapmalisiniz"); }
            string film = Session["FilmAdı"].ToString();
            GridView1.DataSource = DB.ismegorefilm(film);
            GridView1.DataBind();
            DataSet ds = DB.ismegorefilm(film);
            int id = DB.idcek(Session["Kullanici"].ToString());
            int fid = Convert.ToInt32(ds.Tables[0].Rows[0][0].ToString());

            string izlenme = DB.İzlenmeSayısı(fid).Tables[0].Rows[0][0].ToString();
            Label3.Text = "Filmin İzlenme Sayısı : " + izlenme;

            Label4.Text = "Filmin Ortalama Puanı : " + DB.ortalamapuan(fid).Tables[0].Rows[0][0].ToString();
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            DataSet ds;
            int id = DB.idcek(Session["Kullanici"].ToString());
            ds = DB.ArkadasCek(id);
            DropDownList1.DataSource = ds.Tables[0];
            DropDownList1.DataTextField = ds.Tables[0].Columns[0].ToString();
            DropDownList1.DataValueField = ds.Tables[0].Columns[0].ToString();
            DropDownList1.DataBind();

            DropDownList1.Visible = true;
            Button9.Visible = true;

            
        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            DataSet ds;
            int id = DB.idcek(Session["Kullanici"].ToString());
            ds = DB.ArkadasCek(id);
            int secili = DropDownList1.SelectedIndex;
            int arkadas = Convert.ToInt32(ds.Tables[0].Rows[secili][1].ToString());

            string film = Session["FilmAdı"].ToString();
            
            int filmid = Convert.ToInt32(DB.ismegorefilm(film).Tables[0].Rows[0][0].ToString());
            DB.ArkadasaFilmOner(id, arkadas, filmid);
            Label1.Visible = true;
            Label1.Text = "Oneri Başarılı..";
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            int id = DB.idcek(Session["Kullanici"].ToString());
            string film = Session["FilmAdı"].ToString();
            int filmid = Convert.ToInt32(DB.ismegorefilm(film).Tables[0].Rows[0][0].ToString());
            DB.Filmizleme(id, filmid);
            
            Label2.Visible = true;
            

        }

        protected void Button10_Click(object sender, EventArgs e)
        {
            Response.Redirect("FilmAra.aspx");
        }

        protected void Button11_Click(object sender, EventArgs e)
        {
            Response.Redirect("Anasayfa.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("FilmeAlıntıYap.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("FilmeYapılanAlıntılar.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("FilmiIncele.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("FilmeYapılanIncelemeler.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("FilmePuanVer.aspx");
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            Response.Redirect("FilmeVerilenPuanlar.aspx");
        }
    }
}