using Project.shared;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project.views.vanban
{
    public partial class FormThemVB : System.Web.UI.Page
    {
        //[Duong]
        DatabaseDataContext db = new DatabaseDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
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

                //lấy dữ liệu cho ddl_loaiVb
                ddl_LoaiVB.DataSource = db.Vbrecords.Select(element => new
                {
                    Tenloai = element.Tenloai
                }).Distinct(); // db.Vbrecords.GroupBy(o => o.Tenloai);
                ddl_LoaiVB.DataTextField = "Tenloai";
                ddl_LoaiVB.DataValueField = "Tenloai";
                ddl_LoaiVB.DataBind();


            }
        }

        protected void btn_themmoi_Click(object sender, EventArgs e)
        {
            try
            {
                if (ful_TaiLieu.HasFile)
                {
                    if (ful_TaiLieu.PostedFile.ContentLength < 1024000000) //1GB
                    {
                        string filename = Request.PhysicalApplicationPath + "uploads\\" + ful_TaiLieu.FileName; // Path.GetFileName(ful_TaiLieu.FileName);
                        ful_TaiLieu.SaveAs(filename);
                        //div_alert.CssClass = "alert alert-succes";
                        //lbl_ShowInfo.Text = "Upload status: File uploaded!";

                        //kiểm tra xem upload có thành công không
                        if (File.Exists(filename))
                        {
                            //nếu thành công thì save văn bản vào csdl
                            Vbrecord obj = new Vbrecord();
                            //obj.
                        }
                        else
                        {
                            div_alert.CssClass = "alert alert-danger";
                            lbl_ShowInfo.Text = "Lỗi Upload file";
                        }
                    }
                    else
                    {
                        div_alert.CssClass = "alert alert-danger";
                        lbl_ShowInfo.Text = "Vui lòng chọn file upload có dung lượng dưới 1GB!";
                    }
                }
            }
            catch (Exception ex)
            {
                Util.ShowExceptionError(ex, lbl_ShowInfo, div_alert);
            }

        }

        protected void btn_huybo_Click(object sender, EventArgs e)
        {

        }
    }
}