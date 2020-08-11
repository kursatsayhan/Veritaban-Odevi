using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WEB
{
    public partial class KisiDuzenle : System.Web.UI.Page
    {
        string adi, egitim, sehir, dt, cinsiyet;

        protected void Button3_Click(object sender, EventArgs e)
        {
            int id = DB.idcek(Session["Kullanici"].ToString());
            if (DB.hakkindakontrol(id))
            {
                DataSet dataSet =  DB.hakkindacek(id);
                TextBox1.Text= dataSet.Tables[0].Rows[0][1].ToString();
                TextBox2.Text = dataSet.Tables[0].Rows[0][2].ToString();
                TextBox3.Text = dataSet.Tables[0].Rows[0][3].ToString();
                TextBox4.Text = dataSet.Tables[0].Rows[0][4].ToString();
                DropDownList1.SelectedValue= dataSet.Tables[0].Rows[0][5].ToString();
                
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToBoolean(Session["giris"]) != true) { Response.Redirect("Giris.aspx?msg=Oncelikle giris yapmalisiniz"); }
            int id = DB.idcek(Session["Kullanici"].ToString());
            if (!DB.hakkindakontrol(id))
            {
                string adi = DB.adcek(id).Tables[0].Rows[0][0].ToString();
                TextBox1.Text = adi;
                TextBox1.Enabled = false;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int id = DB.idcek(Session["Kullanici"].ToString()); ;
            if (DB.hakkindakontrol(id))
            {
                adi = TextBox1.Text;
                egitim = TextBox2.Text;
                sehir = TextBox3.Text;
                dt = TextBox4.Text;
                
                cinsiyet = DropDownList1.SelectedValue;

                DB.profilguncelle(adi, egitim, sehir, dt, cinsiyet, id);
                Label4.Visible = true;
                
                TextBox1.Text = "";
                TextBox2.Text = "";
                TextBox3.Text = "";
                TextBox4.Text = "";
                DropDownList1.SelectedValue = "";
                
                Label4.Text = "Güncelleme Başarılı";
                
            }
            else
            {
                string adi1 = TextBox1.Text;
                string egitim1 = TextBox2.Text;
                string sehir1 = TextBox3.Text;
                string dt1 = TextBox4.Text;
                

                string cinsiyet1 = DropDownList1.SelectedValue;

                DB.profilekle(id,adi1, egitim1, sehir1, dt1, cinsiyet1);
                
                TextBox1.Text = "";
                TextBox2.Text = "";
                TextBox3.Text = "";
                TextBox4.Text = "";
                DropDownList1.SelectedValue = "";
                Label4.Visible = true;
                Label4.Text = "Kayıt Başarılı";
            }

                    
                    
               
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Profil.aspx");
        }
    }
}