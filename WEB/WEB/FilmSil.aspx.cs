using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WEB
{
    public partial class FilmSil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToBoolean(Session["yonetici"]) != true)
                Response.Redirect("Giris.aspx?msg=Oncelikle giris yapmalisiniz");
            else
                if (!IsPostBack)
            {
                DataSet Film = DB.FilmCek();
                GridView1.DataSource = Film.Tables[0];
                GridView1.DataBind();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(GridView1.SelectedRow.Cells[1].Text);
            DB.FilmSil(id);
            Label1.Visible = true;
            Label1.Text = "Silme Başarılı...";
            DataSet Film = DB.FilmCek();
            GridView1.DataSource = Film.Tables[0];
            GridView1.DataBind();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Yonetici.aspx");
        }
    }
}