using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WEB
{
    public partial class Profil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            
            if (Convert.ToBoolean(Session["giris"]) != true) { Response.Redirect("Giris.aspx?msg=Oncelikle giris yapmalisiniz"); }
            int id = DB.idcek(Session["Kullanici"].ToString()); 
            if (DB.hakkindakontrol(id))
            {
                DataSet set = DB.hakkindacek(id);
                Label1.Text = set.Tables[0].Rows[0][1].ToString();
                Label2.Text = set.Tables[0].Rows[0][2].ToString();
                Label4.Text = set.Tables[0].Rows[0][3].ToString();
                Label5.Text = set.Tables[0].Rows[0][4].ToString();
                Label6.Text = set.Tables[0].Rows[0][5].ToString();
            }
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("KisiDuzenle.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("GirisBilgileri.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Anasayfa.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("ArkadasOnerileri.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("Mesajlarım.aspx");
        }
    }
}