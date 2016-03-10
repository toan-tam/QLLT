using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project.views.auth
{
    public partial class DangNhap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_dangnhap_Click(object sender, EventArgs e)
        {
            if (txt_matkhau.Value == "admin" && txt_tendangnhap.Text== "admin")
            {
                Response.Redirect("/views/pages/gioithieu.aspx?active=GT");
            }
        }
    }
}