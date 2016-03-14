using Project.shared;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project.views.kho
{
    public partial class show : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Thông báo thành công
            if (Session["info"] != null)
            {
                div_alert.CssClass = "alert alert-success";
                lbl_ShowInfo.ForeColor = System.Drawing.Color.Green;
                lbl_ShowInfo.Text = Session["info"].ToString();
                Session["info"] = null;
            }

            if (!IsPostBack)
            {
                i = 1;
                BindListKho();
            }

            if (hidden_id.Value != null && hidden_id.Value != "")
            {
                id_global = int.Parse(hidden_id.Value);
            }
            btn_sua.Click += Btn_sua_Click;

        }

        private void Btn_sua_Click(object sender, EventArgs e)
        {
            try
            {

                Kho kho = db.Khos.Where(o => o.MaKho == id_global).SingleOrDefault();

                if (txt_TenKho.Text != null && txt_TenKho.Text != "")
                {
                    kho.TenKho = txt_TenKho.Text;
                }
                if (txta_GhiChu.Text != null && txta_GhiChu.Text != "")
                {
                    kho.GhiChu = txta_GhiChu.Text;
                }

                db.SubmitChanges();
                Session["info"] = "Sửa Phông thành công";
                Response.Redirect("/views/kho/show.aspx");
            }
            catch (Exception ex)
            {
                Util.ShowExceptionError(ex, lbl_ShowInfo, div_alert, "Sửa Phông thất bại. ");
            }
        }

        // sử dụng cho sửa
        private int id_global;

        public int i { get; set; }
        // Toàn : tăng i cho số thứ tự
        public void IncreaseI()
        {
            i++;
        }

        DatabaseDataContext db = new DatabaseDataContext();

        // hiện form thêm kho
        protected void btn_show_insert_Click(object sender, EventArgs e)
        {
            div_insert.Style["display"] = "block";
            btn_themmoi.Style["display"] = "";
            btn_sua.Style["display"] = "none";
        }

        // xử lý thêm mới kho
        protected void btn_themmoi_Click(object sender, EventArgs e)
        {
            string ten_kho = txt_TenKho.Text;
            string ghi_chu = txta_GhiChu.Text;

            if (ten_kho == "" || ten_kho == null)
            {
                Util.ShowExceptionError(lbl_ShowInfo, div_alert, "Bạn phải nhập tên kho!");
                return;
            }

            Kho tbl_kho = new Kho();

            tbl_kho.TenKho = ten_kho;
            tbl_kho.GhiChu = ghi_chu;

            try
            {
                db.Khos.InsertOnSubmit(tbl_kho);
                db.SubmitChanges();
                Session["info"] = "Thêm mới Kho thành công";
                Response.Redirect("/views/kho/show.aspx");

            }
            catch (Exception ex)
            {
                Util.ShowExceptionError(ex, lbl_ShowInfo, div_alert, "Thêm mới Kho thất bại. ");
            }
        }

        // Reset lại form thêm kho
        protected void btn_huybo_Click(object sender, EventArgs e)
        {
            txt_TenKho.Text = "";
            txta_GhiChu.Text = "";
        }

        // ẩn form thêm kho
        protected void btn_quaylai_Click(object sender, EventArgs e)
        {
            div_insert.Style["display"] = "none";
        }

        protected void BindListKho()
        {
            var tbl_khos = db.Khos.OrderByDescending(o=>o.MaKho);
            lst_Kho.DataSource = tbl_khos;
            lst_Kho.DataBind();
        }

        // đẩy dữ liệu lên form để chuẩn bị sửa
        protected void btn_edit_kho_Click(object sender, EventArgs e)
        {
            if (Util.getCommandName(sender) != null)
            {
                int id_kho = int.Parse(Util.getCommandName(sender));

                try
                {

                    Kho kho = db.Khos.Where(o => o.MaKho == id_kho).SingleOrDefault();
                    txt_TenKho.Text = kho.TenKho;
                    txta_GhiChu.Text = kho.GhiChu;

                    div_insert.Style["display"] = "block";
                    btn_themmoi.Style["display"] = "none";
                    btn_sua.Style["display"] = "";
                    hidden_id.Value = id_kho.ToString();
                }
                catch (Exception ex)
                {
                    Util.ShowExceptionError(ex, lbl_ShowInfo, div_alert, "Sửa thất bại!");
                }
            }
        }

        //xóa kho
        protected void btn_remove_kho_Click(object sender, EventArgs e)
        {
            if (Util.getCommandName(sender) != null)
            {
                try
                {
                    int id_kho = int.Parse(Util.getCommandName(sender));

                    //Xóa phông
                    Kho kho = db.Khos.Where(o => o.MaKho == id_kho).SingleOrDefault();

                    db.Khos.DeleteOnSubmit(kho);
                    db.SubmitChanges();
                    Session["info"] = "Xóa thành công";
                    Response.Redirect("/views/kho/show.aspx");
                }
                catch (Exception ex)
                {
                    Util.ShowExceptionError(lbl_ShowInfo, div_alert, "Xóa thất bại! Do có liên quan đến những bảng khác");
                }
            }
        }
    }
}