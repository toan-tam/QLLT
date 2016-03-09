using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project.views.phong
{
    public partial class FormThemPhong : System.Web.UI.Page
    {
        DatabaseDataContext db = new DatabaseDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            var tbl_phongs = db.Phongs;

            lst_Phong.DataSource = tbl_phongs;
            lst_Phong.DataBind();

            // [Toàn] hiển thị danh sách Phông ở sidebar
            if (Request.QueryString["act"]== "display" && Request.QueryString["id"] != "" && Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"]);
                var tbl_Phong10 = db.Hsrecords.Where(o => o.MaPhong == id).Take(10);
                list_HS.DataSource = tbl_Phong10;
                list_HS.DataBind();
            }

            Page.DataBind();

        }

        // [Toàn] expand children of Phông in sidebar
        protected void a_Expand_Click(object sender, EventArgs e)
        {
            LinkButton link = sender as LinkButton;

            if (link != null)
            {
                int a_expand_id = int.Parse(link.CommandName);
                var tbl_Phong10 = db.Phongs.Where(o => o.MaPhong == a_expand_id).Take(10);
                   
            }

        }

        protected void btn_huybo_Click(object sender, EventArgs e)
        {
            txt_TenPhong.Text = txta_GhiChu.Text = "";

        }

        //[Toàn] Hiển thị danh sách các hồ sơ ở content
        protected void a_Phong_Click(object sender, EventArgs e)
        {
            LinkButton link = sender as LinkButton;

            if (link != null)
            {
                int a_expand_id = int.Parse(link.CommandName);
                Response.Redirect("/views/phong/FormThemPhong.aspx?act=display&id=" + a_expand_id);

            }


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
                Response.Redirect(Request.Url.ToString());
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

        // [Toàn] Nested listview in sidebar
        protected void lst_Phong_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            ListViewDataItem dataItem = (ListViewDataItem)e.Item;

            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                Phong phong = (Phong)dataItem.DataItem;

                long CurrentCategoryID = phong.MaPhong;

                var query = db.Hsrecords.Where(o => o.MaPhong == CurrentCategoryID).Take(10);

                ListView lst_HoSo = (ListView)e.Item.FindControl("lst_HoSo");
                lst_HoSo.DataSource = query.ToList<Hsrecord>();

                lst_HoSo.DataBind();
            }
        }
    }
}