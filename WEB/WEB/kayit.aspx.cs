using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;

namespace WEB
{
    public partial class kayit : System.Web.UI.Page
    {
        public bool varMi;

        protected void Page_Load(object sender, EventArgs e)
        {
            string kadi = TextBox3.Text;

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
           
            string eposta = TextBox2.Text;
            string kullaniciadi = TextBox3.Text;
            string sifre = ComputeSha256Hash(TextBox4.Text);
            string adi = TextBox5.Text;
            varMi = DB.kullaniciadikontrol(kullaniciadi);
            if (varMi)
            {
                
                Label3.Visible = true;
            }
            else if (!varMi)
            {
                
                Label3.Visible = false;

                DB.dataekle(eposta, kullaniciadi, sifre,adi);
                Label2.Visible = true;
                
                TextBox2.Text = "";
                TextBox3.Text = "";
                TextBox4.Text = "";
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