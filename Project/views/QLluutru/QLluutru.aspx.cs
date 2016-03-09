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
            var tbl_phongs = db.Phongs;

            lst_Phong.DataSource = tbl_phongs;
            lst_Phong.DataBind();

            // [Toàn] hiển thị danh sách Phông ở sidebar
            if (Request.QueryString["act"] == "display" && Request.QueryString["id"] != "" && Request.QueryString["id"] != null)
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

    }
}