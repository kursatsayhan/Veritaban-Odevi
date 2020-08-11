using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WEB
{
    public partial class Giris : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string kullaniciadi = TextBox1.Text;
            string sifreyonetici = TextBox2.Text;
            string sifre = ComputeSha256Hash(TextBox2.Text);
            bool checkkullanici =DB.giriskontrol(kullaniciadi, sifre);
            bool checkyonetici = DB.yoneticikontrol(kullaniciadi, sifreyonetici);
            if(checkyonetici)
            {
                Session["yonetici"] = true;
                Session["Yonid"] = kullaniciadi;
                Response.Redirect("Yonetici.aspx");
            }
            else if (checkkullanici)
            {
                Session["giris"] = true;
                Session["Kullanici"] = kullaniciadi;
                Response.Redirect("Anasayfa.aspx");
            }
            else
            {
                Label2.Visible = true;
            }
            

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