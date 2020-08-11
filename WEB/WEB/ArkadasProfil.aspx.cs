using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WEB
{
    public partial class ArkadasProfil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            arkadas arkadas = new arkadas();
            if (Convert.ToBoolean(Session["giris"]) != true) { Response.Redirect("Giris.aspx?msg=Oncelikle giris yapmalisiniz"); }
            
            int ida = Convert.ToInt32(Session["Arkadas"].ToString());
            int kullaniciid = DB.idcek(Session["Kullanici"].ToString());
            if (DB.hakkindakontrol(ida))
            {
                DataSet set = DB.hakkindacek(ida);
                Label1.Text = set.Tables[0].Rows[0][1].ToString();
                Label2.Text = set.Tables[0].Rows[0][2].ToString();
                Label4.Text = set.Tables[0].Rows[0][3].ToString();
                Label5.Text = set.Tables[0].Rows[0][4].ToString();
                Label6.Text = set.Tables[0].Rows[0][5].ToString();
            } 

            if(DB.Arkadaskontrol(ida,kullaniciid))
            {
                Button2.Enabled = false;
                //Label7.Visible = true;
                Button2.Text = "Zaten Arkadaşsınız";
                Button6.Visible = true;
            }


        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int arkadasid = Convert.ToInt32(Session["Arkadas"].ToString());
            int kullaniciid = DB.idcek(Session["Kullanici"].ToString());
            DB.ArkadasEkle(arkadasid, kullaniciid);

            Button2.Enabled = false;
            Button2.Text = "Zaten Arkadaşsınız";
            Label7.Visible = true;
            Label7.Text = "Arkadaş Eklendi...";
            Button6.Visible = true;
            

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Anasayfa.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("KisiAra.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("Mesaj.aspx");
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            int ida = Convert.ToInt32(Session["Arkadas"].ToString());
            int kullaniciid = DB.idcek(Session["Kullanici"].ToString());
            DB.ArkadasSil(kullaniciid, ida);
            Label8.Visible = true;
            Button6.Enabled = false;
        }
    }
}