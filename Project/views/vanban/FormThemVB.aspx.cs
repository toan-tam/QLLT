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
            ddl_Phong.Enabled = false;

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

                //nếu có hồ sơ id thì hiển thị lên txt_HoSo & bind dữ liệu vào ddl_phong
                if (Request["hsid"] != null)
                {
                    var hsid = Request["hsid"];
                    txt_HoSo.Text = hsid;
                    //bind ddl_phong
                    var phongid = db.Hsrecords.Where(o => o.Hsrecords_Id == int.Parse(hsid)).SingleOrDefault().MaPhong;
                    Util.set_selected_val_4_ddl(ddl_Phong, phongid.ToString());
                }
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
                        string filename = "uploads\\" + ful_TaiLieu.FileName;
                        string filepath = Request.PhysicalApplicationPath + filename;// Path.GetFileName(ful_TaiLieu.FileName);
                        ful_TaiLieu.SaveAs(filepath);
                        //div_alert.CssClass = "alert alert-succes";
                        //lbl_ShowInfo.Text = "Upload status: File uploaded!";

                        //kiểm tra xem upload có thành công không
                        if (File.Exists(filepath))
                        {
                            //nếu thành công thì save văn bản vào csdl
                            if (Insert_Vb(filename))
                            {
                                //Thông báo thành công
                                div_alert.CssClass = "alert alert-success";
                                lbl_ShowInfo.ForeColor = System.Drawing.Color.Green;
                                lbl_ShowInfo.Text = "Thêm mới Văn bản thành công";
                            }
                            else
                            {
                                div_alert.CssClass = "alert alert-danger";
                                lbl_ShowInfo.Text = "Đã xảy ra lỗi khi thêm mới văn bản";
                            }
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
                else
                {
                    //nếu không chèn file thì chỉ cần thêm bản ghi vào db
                    Insert_Vb("");
                }
            }
            catch (Exception ex)
            {
                Util.ShowExceptionError(ex, lbl_ShowInfo, div_alert, "Thêm mới Văn bản thất bại. ");
            }

        }

        protected bool Insert_Vb(string filename)
        {
            try
            {
                
                Vbrecord obj = new Vbrecord();
                obj.Hsrecords_Id = long.Parse(txt_HoSo.Text);
                //obj.
                //obj.
                obj.SoKHVB = txt_SoKHVB.Text;
                obj.Soto = int.Parse(txt_SLTo.Text);
                obj.Ngonngu = ddl_NgonNgu.SelectedValue;
                obj.TrichyeuND = txta_TrichYeu.Text;
                obj.Tacgia = txt_TGVB.Text;
                obj.Tenloai = ddl_LoaiVB.SelectedValue;
                obj.Tinhtrangvatly = txt_TTVL.Text;
                obj.TrinhLD = txt_ButTich.Text;
                obj.Mucdomat = txt_DoMat.Text;
                obj.Mucdotruycap = txt_MucDoTinCay.Text;
                obj.YkienGQ = txt_GhiChu.Text;

                db.Vbrecords.InsertOnSubmit(obj);
                db.SubmitChanges();

                if (filename != "")
                {
                    //lưu link đến file
                    VbFileAttach fobj = new VbFileAttach();
                    fobj.Vbrecords_ID = obj.Vbrecords_Id;
                    fobj.DestFileName = "\\" + filename;

                    db.VbFileAttaches.InsertOnSubmit(fobj);

                    db.SubmitChanges();
                    return true;
                }
                else
                {
                    return false;
                }
                

                
            }
            catch
            {
                return false;
            }
        }

        protected void btn_huybo_Click(object sender, EventArgs e)
        {

        }
    }
}