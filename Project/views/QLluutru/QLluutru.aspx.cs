using Project.shared;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project.views.QLluutru
{
    public partial class QLluutru : System.Web.UI.Page
    {
        DatabaseDataContext db = new DatabaseDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            BindListPhong();
            BindListHS();
            BindListVB();
            Page.DataBind();


            //Thông báo thành công
            if (Session["info"] != null)
            {
                div_alert.CssClass = "alert alert-success";
                lbl_ShowInfo.ForeColor = System.Drawing.Color.Green;
                lbl_ShowInfo.Text = Session["info"].ToString();

                div_alert1.CssClass = "alert alert-success";
                lbl_ShowInfo1.ForeColor = System.Drawing.Color.Green;
                lbl_ShowInfo1.Text = Session["info"].ToString();
                Session["info"] = null;
            }

        }

        // [Toàn] expand children of Phông in sidebar
        protected void a_Expand_Click(object sender, EventArgs e)
        {
            if (Util.getCommandName(sender) != null)
            {
                int a_expand_id = int.Parse(Util.getCommandName(sender));
                var tbl_Phong10 = db.Phongs.Where(o => o.MaPhong == a_expand_id).Take(10);

            }

        }



        //[Toàn] Hiển thị danh sách các hồ sơ ở content
        protected void a_Phong_Click(object sender, EventArgs e)
        {
            if (Util.getCommandName(sender) != null)
            {
                Response.Redirect("/views/QLluutru/QLluutru.aspx?act=display&id=" + Util.getCommandName(sender));

            }


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

        protected void Link_HoSo_Click(object sender, EventArgs e)
        {
            if (Util.getCommandName(sender) != null)
            {
                Response.Redirect("/views/QLluutru/QLluutru.aspx?act=displayVB&id=" + Util.getCommandName(sender));

            }
        }

        protected void btn_VB_insert_Click(object sender, EventArgs e)
        {
            Response.Redirect("/views/vanban/FormThemVB.aspx?hsid=" + Request["id"]);
        }

        protected void btn_HS_insert_Click(object sender, EventArgs e)
        {
            Response.Redirect("/views/hoso/FormThemHS.aspx?phongid=" + Request["id"]);
        }

        // Xóa hồ sơ
        protected void btn_remove_HS_Click(object sender, EventArgs e)
        {
            if (Util.getCommandName(sender) != null)
            {
                try
                {
                    int id_HS = int.Parse(Util.getCommandName(sender));

                    //Xóa phông
                    Hsrecord record_hs = db.Hsrecords.Where(o => o.Hsrecords_Id == id_HS).SingleOrDefault();

                    long id_phong = (long)record_hs.MaPhong;

                    db.Hsrecords.DeleteOnSubmit(record_hs);
                    db.SubmitChanges();
                    Session["info"] = "Xóa thành công";
                    Response.Redirect("/views/QLluutru/QLluutru.aspx?act=display&id="+id_phong);
                }
                catch (Exception ex)
                {
                    Util.ShowExceptionError(lbl_ShowInfo, div_alert, "Xóa thất bại! Do có liên quan đến những bảng khác");
                }
            }
        }

        protected void btn_remove_phong_Click(object sender, EventArgs e)
        {
            if (Util.getCommandName(sender) != null)
            {
                try
                {
                    int id_VB = int.Parse(Util.getCommandName(sender));

                    //Xóa phông
                    Vbrecord record_vb = db.Vbrecords.Where(o => o.Vbrecords_Id == id_VB).SingleOrDefault();

                    long id_hs= (long)record_vb.Hsrecords_Id;

                    db.Vbrecords.DeleteOnSubmit(record_vb);
                    db.SubmitChanges();
                    Session["info"] = "Xóa thành công";
                    Response.Redirect("/views/QLluutru/QLluutru.aspx?act=displayVB&id=" + id_hs);
                }
                catch (Exception ex)
                {
                    Util.ShowExceptionError(lbl_ShowInfo1, div_alert1, "Xóa thất bại! Do có liên quan đến những bảng khác");
                }
            }
        }

        protected void lst_VB_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            Pager_VB.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);

            BindListVB();
        }

        protected void lst_HS_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            Pager_HS.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            BindListHS();
        }

        protected void lst_Phong_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            Pager_Phong.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            BindListPhong();
        }

        protected void BindListVB()
        {
            //[Duong] bind du lieu van ban
            if (Request.QueryString["act"] == "displayVB" && Request.QueryString["id"] != "" && Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"]);
                var tbl_VB = db.Vbrecords.Where(o => o.Hsrecords_Id == id);

                //get domain path
                string domain_path = Page.Request.Url.GetLeftPart(UriPartial.Authority);
                //khoi tao list doi tuong vbrecord_ett
                List<models.Vbrecord_ett> lst_dt = new List<models.Vbrecord_ett>();


                if (tbl_VB.Count() > 0)
                {
                    foreach (var i in tbl_VB)
                    {
                        models.Vbrecord_ett vbobj = new models.Vbrecord_ett(i, domain_path);
                        lst_dt.Add(vbobj);
                    }
                }

                lst_VB.DataSource = lst_dt;
                lst_VB.DataBind();
            }
        }

        protected void BindListHS()
        {

            // [Toàn] Bind hồ sơ
            if (Request.QueryString["act"] == "display" && Request.QueryString["id"] != "" && Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"]);
                var tbl_Phong10 = db.Hsrecords.Where(o => o.MaPhong == id).Take(10);
                lst_HS.DataSource = tbl_Phong10;
                lst_HS.DataBind();
            }
        }

        protected void BindListPhong()
        {
            var tbl_phongs = db.Phongs;

            lst_Phong.DataSource = tbl_phongs;
            lst_Phong.DataBind();
        }


        // lấy Hồ sơ_Id by văn bản ID
        protected string GetHSParentIdByVBID(string id_vanban)
        {
            Vbrecord vb = db.Vbrecords.Where(o => o.Vbrecords_Id == long.Parse(id_vanban)).SingleOrDefault();

            return vb.Hsrecords_Id.ToString();
        }

        // lấy Phông_Id by Hồ sơ ID
        protected string GetPhongParentIdByHSID(string id_hoso)
        {
            Hsrecord hs = db.Hsrecords.Where(o => o.Hsrecords_Id == long.Parse(id_hoso)).SingleOrDefault();

            return hs.MaPhong.ToString();
        }
    }
}