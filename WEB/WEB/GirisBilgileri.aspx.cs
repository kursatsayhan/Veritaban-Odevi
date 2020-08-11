using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WEB
{
    public partial class GirisBilgileri : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToBoolean(Session["giris"]) != true) { Response.Redirect("Giris.aspx?msg=Oncelikle giris yapmalisiniz"); }
            Label7.Text= Session["Kullanici"].ToString();
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            string eposta = TextBox1.Text;
            string kullaniciadi = Session["Kullanici"].ToString();

            DB.epostaguncelle(eposta,kullaniciadi);
            Label5.Visible = true;
            Label5.Text = "E posta güncellendi...";
            TextBox1.Text = "";
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string kullaniciadi = Session["Kullanici"].ToString();
            DataSet ds = DB.kisikayitcek(kullaniciadi);

            TextBox1.Text = ds.Tables[0].Rows[0][1].ToString();
            TextBox4.Text = ds.Tables[0].Rows[0][2].ToString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string kullaniciadi = TextBox4.Text;
            string kullaniciadigiris = Session["Kullanici"].ToString();
            DB.kullaniciadiguncelle(kullaniciadi,kullaniciadigiris);
            Label4.Visible = true;
            Label4.Text = "Kullanıcıadi guncellendi";
            Session["Kullanici"] = kullaniciadi;
            TextBox4.Text = "";
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            string yeni1 = TextBox3.Text;
            string eski1 = TextBox2.Text;
            string eski = ComputeSha256Hash(eski1);
            string yeni = ComputeSha256Hash(yeni1);
            
            string kullaniciadi = Session["Kullanici"].ToString();
            if (DB.giriskontrol(kullaniciadi,eski))
            {
                DB.sifreguncelle(yeni,kullaniciadi);
                Label6.Visible = true;
                Label6.Text = "Sifre Guncellendi";
                TextBox2.Text = "";
                TextBox3.Text = "";

            }
            else
            {
                Label6.Visible = true;
                Label6.Text = "Eski sifre yanlış...";
                TextBox2.Text = "";
                TextBox3.Text = "";

            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Profil.aspx");
        }
        static string ComputeSha256Hash(string rawData)
        {

            using (SHA256 sha256Hash = SHA256.Create())
            {
                // ComputeHash - returns byte array  
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(rawData));

                // Convert byte array to a string   
                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < bytes.Length; i++)
                {
                    builder.Append(bytes[i].ToString("x2"));
                }
                return builder.ToString();
            }
        }
    }
}