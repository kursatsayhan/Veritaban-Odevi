using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WEB
{
    public partial class FilmEkle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToBoolean(Session["yonetici"]) != true) { Response.Redirect("Giris.aspx?msg=Oncelikle giris yapmalisiniz");}
            else
            {
               
                
                
            }
        }           

        protected void Button1_Click(object sender, EventArgs e)
        {
            string filmadi = TextBox1.Text;
            string dakika = TextBox2.Text;
            string kat = DropDownList5.SelectedValue;
            string yom = DropDownList1.SelectedValue;
            string sen = DropDownList2.SelectedValue;
            string dil = DropDownList3.SelectedValue;
            string odu = DropDownList4.SelectedValue;
            int dak = Convert.ToInt32(dakika);
            int kid = Convert.ToInt32(DB.katid(kat).Tables[0].Rows[0][0].ToString());
            int yid = Convert.ToInt32(DB.yonid(yom).Tables[0].Rows[0][0].ToString());
            int sid = Convert.ToInt32(DB.senid(sen).Tables[0].Rows[0][0].ToString());
            int did = Convert.ToInt32(DB.dilid(dil).Tables[0].Rows[0][0].ToString());
            int oid = Convert.ToInt32(DB.Odulid(odu).Tables[0].Rows[0][0].ToString());

            DB.FilmEkle(filmadi, yid, sid, kid, oid, did, dak);

            TextBox1.Text = "";
            TextBox2.Text = "";
            

            Label8.Visible = true;
            Label8.Text = "Film Eklendi...";


        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Yonetici.aspx");
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            DataSet ds = DB.YonetmenCek();
            DropDownList1.DataSource = ds.Tables[0];
            DropDownList1.DataTextField = ds.Tables[0].Columns[0].ToString();
            DropDownList1.DataValueField = ds.Tables[0].Columns[0].ToString();
            DropDownList1.DataBind();

            DataSet ds2 = DB.SenaristCek();
            DropDownList2.DataSource = ds2.Tables[0];
            DropDownList2.DataTextField = ds2.Tables[0].Columns[0].ToString();
            DropDownList2.DataValueField = ds2.Tables[0].Columns[0].ToString();
            DropDownList2.DataBind();

            DataSet ds3 = DB.DilCek();
            DropDownList3.DataSource = ds3.Tables[0];
            DropDownList3.DataTextField = ds3.Tables[0].Columns[0].ToString();
            DropDownList3.DataValueField = ds3.Tables[0].Columns[0].ToString();
            DropDownList3.DataBind();

            DataSet ds4 = DB.OdulCek();
            DropDownList4.DataSource = ds4.Tables[0];
            DropDownList4.DataTextField = ds4.Tables[0].Columns[0].ToString();
            DropDownList4.DataValueField = ds4.Tables[0].Columns[0].ToString();
            DropDownList4.DataBind();

            DataSet ds5 = DB.kategoriCek();
            DropDownList5.DataSource = ds5.Tables[0];
            DropDownList5.DataTextField = ds5.Tables[0].Columns[0].ToString();
            DropDownList5.DataValueField = ds5.Tables[0].Columns[0].ToString();
            DropDownList5.DataBind();
        }
    }
}