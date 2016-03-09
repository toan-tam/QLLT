using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project.views.vanban
{
    public partial class FormHienThiVB : System.Web.UI.Page
    {
        DatabaseDataContext db = new DatabaseDataContext();
        long vb_id = -1000;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //get id of Vb
                if (long.TryParse(Request["vbid"], out vb_id))
                {
                    //nếu tồn tại id của vb thì load dữ liệu ra
                    var objs = db.Vbrecords.Where(o => o.Vbrecords_Id == vb_id);
                    if (objs.Count() > 0)
                    {
                        Vbrecord obj = objs.SingleOrDefault();
                        txt_HoSo.Text = obj.Hsrecords_Id.ToString();

                        txt_SoKHVB.Text = obj.SoKHVB;
                        txt_SLTo.Text = obj.Soto.ToString();
                        //ddl_NgonNgu
                        txta_TrichYeu.Text = obj.TrichyeuND;
                        txt_TGVB.Text = obj.Tacgia;
                        //obj.Tenloai = ddl_LoaiVB.SelectedValue;
                        txt_TTVL.Text = obj.Tinhtrangvatly;
                        txt_ButTich.Text = obj.TrinhLD;
                        txt_DoMat.Text = obj.Mucdomat;
                        txt_MucDoTinCay.Text = obj.Mucdotruycap;
                        txt_GhiChu.Text = obj.YkienGQ;

                        var fobjs = db.VbFileAttaches.Where(o => o.Vbrecords_ID == vb_id);
                        if (fobjs.Count() > 0)
                        {
                            //nếu có file attach thì hiển thị link
                            link_File_Doc.Text = "Link File";
                            link_File_Doc.NavigateUrl = Request.Url.GetLeftPart(UriPartial.Authority) +  fobjs.SingleOrDefault().DestFileName; //"\\uploads\\DATN_DuongNH-Report-Success.doc"; // fobjs.SingleOrDefault().DestFileName);
                        }
                        else
                        {
                            //nếu có file attach thì hiển thị Thông báo k có file attach
                            link_File_Doc.Text = "Không có file đính kèm";
                            link_File_Doc.ForeColor = System.Drawing.Color.Red;
                        }


                    }
                }

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
            txta_TrichYeu.ReadOnly = false;
            txt_ButTich.ReadOnly = false;
            txt_DoMat.ReadOnly = false;
            txt_GhiChu.ReadOnly = false;
            txt_HoSo.ReadOnly = false;
            txt_KHThongTin.ReadOnly = false;
            txt_MucDoTinCay.ReadOnly = false;
            txt_MucLucSo.ReadOnly = false;
            txt_SLTo.ReadOnly = false;
            txt_SoHS.ReadOnly = false;
            txt_SoKHVB.ReadOnly = false;
            txt_TG.ReadOnly = false;
            txt_TGVB.ReadOnly = false;
            txt_ToSo.ReadOnly = false;
            txt_TTVL.ReadOnly = false;

            ddl_CQLuuTru.Enabled = true;
            ddl_LoaiVB.Enabled = true;
            ddl_NgonNgu.Enabled = true;
            ddl_Phong.Enabled = true;
        }

        protected void btn_huybo_Click(object sender, EventArgs e)
        {
            txta_TrichYeu.ReadOnly = true;
            txt_ButTich.ReadOnly = true;
            txt_DoMat.ReadOnly = true;
            txt_GhiChu.ReadOnly = true;
            txt_HoSo.ReadOnly = true;
            txt_KHThongTin.ReadOnly = true;
            txt_MucDoTinCay.ReadOnly = true;
            txt_MucLucSo.ReadOnly = true;
            txt_SLTo.ReadOnly = true;
            txt_SoHS.ReadOnly = true;
            txt_SoKHVB.ReadOnly = true;
            txt_TG.ReadOnly = true;
            txt_TGVB.ReadOnly = true;
            txt_ToSo.ReadOnly = true;
            txt_TTVL.ReadOnly = true;

            ddl_CQLuuTru.Enabled = false;
            ddl_LoaiVB.Enabled = false;
            ddl_NgonNgu.Enabled = false;
            ddl_Phong.Enabled = false;
        }
    }
}