using Project.shared;
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
        public int i { get; set; }

        private int id_global;
        // Toàn : tăng i cho số thứ tự
        public void IncreaseI()
        {
            i++;
        }

        DatabaseDataContext db = new DatabaseDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) // không phải post back(nhấn F5); postback : Những xử lý mà ko nhấn F5
            {
                this.i = 1;
                btn_sua.Style["display"] = "none";

                BindListPhong();

                Page.DataBind();
            }

            //Thông báo thành công
            if (Session["info"] != null)
            {
                div_alert.CssClass = "alert alert-success";
                lbl_ShowInfo.ForeColor = System.Drawing.Color.Green;
                lbl_ShowInfo.Text = Session["info"].ToString();
                Session["info"] = null;
            }
            

            if (hidden_id.Value != null && hidden_id.Value != "")
            {
                id_global = int.Parse(hidden_id.Value);
            }
            btn_sua.Click += btn_sua_Click;
        }


        protected void btn_show_insert_Click(object sender, EventArgs e)
        {
            div_insert.Style["display"] = "block";
            btn_themmoi.Style["display"] = "";
            btn_sua.Style["display"] = "none";
        }

        // lấy dữ liệu đẩy lên form để chuẩn bị sửa
        protected void btn_edit_phong_Click(object sender, EventArgs e)
        {
            if (Util.getCommandName(sender) != null)
            {
                int id_phong = int.Parse(Util.getCommandName(sender));

                try
                {

                    Phong phong = db.Phongs.Where(o => o.MaPhong == id_phong).SingleOrDefault();
                    txt_TenPhong.Text = phong.TenPhong;
                    txta_GhiChu.Text = phong.GhiChu;

                    div_insert.Style["display"] = "block";
                    btn_themmoi.Style["display"] = "none";
                    btn_sua.Style["display"] = "";
                    hidden_id.Value = id_phong.ToString();
                }
                catch (Exception ex)
                {
                    Util.ShowExceptionError(ex, lbl_ShowInfo, div_alert, "Sửa thất bại!");
                }
            }
        }



        // Ẩn div Thêm mới
        protected void btn_quaylai_Click(object sender, EventArgs e)
        {
            div_insert.Style["display"] = "none";
        }

        protected void btn_huybo_Click(object sender, EventArgs e)
        {
            txt_TenPhong.Text = "";
            txta_GhiChu.Text = "";
        }


        // xứ lý thêm mới Phông
        protected void btn_themmoi_Click(object sender, EventArgs e)
        {

            string ten_phong = txt_TenPhong.Text;
            string ghi_chu = txta_GhiChu.Text;

            if (ten_phong == "" || ten_phong == null)
            {
                Util.ShowExceptionError(lbl_ShowInfo, div_alert, "Bạn phải nhập tên trường!");
                return;
            }

            Phong tbl_phong = new Phong();

            tbl_phong.TenPhong = ten_phong;
            tbl_phong.GhiChu = ghi_chu;

            try
            {
                db.Phongs.InsertOnSubmit(tbl_phong);
                db.SubmitChanges();
                Session["info"] = "Thêm mới Phông thành công";
                Response.Redirect("/views/phong/show.aspx");

            }
            catch (Exception ex)
            {
                Util.ShowExceptionError(ex, lbl_ShowInfo, div_alert, "Thêm mới Phông thất bại. ");
            }
        }

        // Xứ lý xóa phông
        protected void btn_remove_phong_Click(object sender, EventArgs e)
        {
            if (Util.getCommandName(sender) != null)
            {
                try
                {
                    int id_phong = int.Parse(Util.getCommandName(sender));

                    //Xóa phông
                    Phong phong = db.Phongs.Where(o => o.MaPhong == id_phong).SingleOrDefault();

                    db.Phongs.DeleteOnSubmit(phong);
                    db.SubmitChanges();
                    Session["info"] = "Xóa thành công";
                    Response.Redirect("/views/phong/show.aspx");
                }
                catch (Exception ex)
                {
                    Util.ShowExceptionError(lbl_ShowInfo, div_alert, "Xóa thất bại! Do có liên quan đến những bảng khác");
                }
            }
        }

        // xử lý sửa Phông
        protected void btn_sua_Click(object sender, EventArgs e)
        {
            try
            {

                Phong phong = db.Phongs.Where(o => o.MaPhong == id_global).SingleOrDefault();

                phong.TenPhong = txt_TenPhong.Text;
                phong.GhiChu = txta_GhiChu.Text;

                db.SubmitChanges();
                Session["info"] = "Sửa Phông thành công";
                Response.Redirect("/views/phong/show.aspx");
            }
            catch (Exception ex)
            {
                Util.ShowExceptionError(ex, lbl_ShowInfo, div_alert, "Sửa Phông thất bại. ");
            }
        }

        // Use for paging
        protected void lst_Phong_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            Pager_Phong.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);

            BindListPhong();
        }


        protected void BindListPhong()
        {
            var tbl_phongs = db.Phongs.OrderByDescending(o => o.MaPhong);

            lst_Phong.DataSource = tbl_phongs;
            lst_Phong.DataBind();
        }
    }
}