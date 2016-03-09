using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project.views.phong
{
    public partial class Show : System.Web.UI.Page
    {
        DatabaseDataContext db = new DatabaseDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            var tbl_phongs = db.Phongs;

            lst_Phong.DataSource = tbl_phongs;
            lst_Phong.DataBind();

            Page.DataBind();
        }

        protected void btn_show_insert_Click(object sender, EventArgs e)
        {
            Response.Redirect("/views/phong/create.aspx");
        }
    }
}