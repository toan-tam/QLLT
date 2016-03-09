using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project.views.phong
{
    public partial class create : System.Web.UI.Page
    {
        DatabaseDataContext db = new DatabaseDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                var phong_input = db.Phongs.Where(o => o.MaPhong == int.Parse(Request.QueryString["id"])).SingleOrDefault();
                txt_TenPhong.Text = phong_input.TenPhong;
                txta_GhiChu.Text = phong_input.GhiChu;
            }
        }



        protected void btn_huybo_Click(object sender, EventArgs e)
        {
            txt_TenPhong.Text = txta_GhiChu.Text = "";

        }


        protected void btn_themmoi_Click(object sender, EventArgs e)
        {

            string ten_phong = txt_TenPhong.Text;
            string ghi_chu = txta_GhiChu.Text;

            if (ten_phong == "" || ten_phong == null)
            {
                Response.Write("<script>alert('Bạn phải nhập trường tên phông');</script>");
                return;
            }

            Phong tbl_phong = new Phong();

            tbl_phong.TenPhong = ten_phong;
            tbl_phong.GhiChu = ghi_chu;

            try
            {
                db.Phongs.InsertOnSubmit(tbl_phong);
                db.SubmitChanges();
                Response.Redirect("/views/phong/show.aspx");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.ToString() + "');</script>");
            }
        }

        protected void btn_quaylai_Click(object sender, EventArgs e)
        {
            Response.Redirect("/");
        }

        protected void btn_capnhat_Click(object sender, EventArgs e)
        {
            long id_phong = long.Parse(Request.QueryString["id"]);
            var phong_input = db.Phongs.Where(o => o.MaPhong == id_phong).SingleOrDefault();


            phong_input.GhiChu = txta_GhiChu.Text;
            phong_input.TenPhong = txt_TenPhong.Text;
            Response.Redirect("/views/phong/show.aspx");
        }
    }
}