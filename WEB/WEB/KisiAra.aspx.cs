using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WEB
{
    public partial class KisiAra : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToBoolean(Session["giris"]) != true) { Response.Redirect("Giris.aspx?msg=Oncelikle giris yapmalisiniz"); }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string arama = TextBox1.Text;
            DB.KisiAra(arama);

            GridView1.DataSource = DB.KisiAra(arama);
            GridView1.DataBind();
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int secili = GridView1.SelectedIndex;
            string ad = GridView1.Rows[secili].Cells[1].Text;            
             
            int arkadasid = Convert.ToInt32(DB.Kullanciadi(ad).Tables[0].Rows[0][0].ToString());
             
            int id = DB.idcek(Session["Kullanici"].ToString());
            Session["Arkadas"] = arkadasid;
            

            if (arkadasid==id)
            {
                Response.Redirect("Profil.aspx");
            }
            else
            {
                Session["ArkadasID"] = arkadasid;
                Response.Redirect("ArkadasProfil.aspx");
            }
            
        }
    }
}