using Project.shared;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project.views
{
    public partial class FormThemHS : System.Web.UI.Page
    {
        //[Duong]
        DatabaseDataContext db = new DatabaseDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            //lbl_ShowInfo.Text = "xuốn<br> dòng";
            //lbl_ShowInfo.ForeColor = System.Drawing.Color.Black;

            //if (!IsPostBack)
            //{
                //lấy dữ liệu cho ddl_CQLuuTru
                ddl_CQLuuTru.DataSource = db.Khos;
                ddl_CQLuuTru.DataTextField = "TenKho";
                ddl_CQLuuTru.DataValueField = "MaKho";
                ddl_CQLuuTru.DataBind();

                //lấy dữ liệu cho ddl_phong
                ddl_Phong.DataSource = db.Phongs;
                ddl_Phong.DataTextField = "TenPhong";
                ddl_Phong.DataValueField = "MaPhong";
                ddl_Phong.DataBind();
            //}
        }

        protected void btn_themmoi_Click(object sender, EventArgs e)
        {
            try
            {
                //Khởi tạo đối tượng hồ sơ mới và truyền các tham số cần thiết
                Hsrecord obj = new Hsrecord();
                //int rsTryParse = 0;
                obj.MaKho = int.Parse(ddl_CQLuuTru.SelectedValue);
                obj.MaPhong = int.Parse(ddl_Phong.SelectedValue);
                obj.Muclucso = ddl_MucLucSo.SelectedValue;
                obj.Hopso = txt_HopSo.Text;
                obj.Hososo = txt_HSSo.Text;
                obj.Ngonngu = ddl_NgonNgu.SelectedValue;
                obj.KHTT = txt_KHTT.Text;
                obj.Tieude = txt_TDHS.Text;
                obj.Chugiai = txta_ChuGiai.Text;
                obj.ThoigianBD = txt_TGBD.Text;
                obj.ThoigianKT = txt_TGKT.Text;
                obj.Buttich = txt_Buttich.Text;
                obj.Soluongto = txt_SoLuongTu.Text;
                obj.ThoihanBQ = ddl_TGBaoquan.SelectedValue;
                obj.ChedoSD = ddl_CDSD.SelectedValue;
                obj.TinhtrangVL = ddl_TTVL.SelectedValue;
               

                //chèn mơi vào csdl
                db.Hsrecords.InsertOnSubmit(obj);
                

                db.SubmitChanges();

                //Thông báo thành công
                div_alert.CssClass = "alert alert-success";
                lbl_ShowInfo.ForeColor = System.Drawing.Color.Green;
                lbl_ShowInfo.Text = "Thêm mới hồ sơ thành công";
                
            }
            catch (Exception ex)
            {
                //hiển thị thông báo lỗi                
                Util.ShowExceptionError(ex, lbl_ShowInfo, div_alert, "Thêm mới Hồ sơ thất bại. ");
                
            }
            
        }

        protected void btn_huybo_Click(object sender, EventArgs e)
        {
            txta_ChuGiai.Text = "";
            txt_Buttich.Text = "";
            txt_HopSo.Text = "";
            txt_HSSo.Text = "";
            txt_KHTT.Text = "";
            txt_SoLuongTu.Text = "";
            txt_TDHS.Text = "";
            txt_TGBD.Text = "";
            txt_TGKT.Text = "";
        }
    }
}