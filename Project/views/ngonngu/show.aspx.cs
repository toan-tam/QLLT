using Project.shared;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project.views.ngonngu
{
    public partial class show : System.Web.UI.Page
    {
        DatabaseDataContext db = new DatabaseDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) 
            {
                btn_sua.Style["display"] = "none";
                BindData();                
            }
            if (Session["info"] != null)
            {
                div_alert.CssClass = "alert alert-success";
                lbl_ShowInfo.ForeColor = System.Drawing.Color.Green;
                lbl_ShowInfo.Text = Session["info"].ToString();
                Session["info"] = null;
            }
        }
        protected void BindData()
        {
            var lstNN = db.NgonNgus.OrderBy(s => s.STT).ToList();            
            lst_NN.DataSource = lstNN;
            lst_NN.DataBind();
            Page.DataBind();

            var curPage = (Pager_NN.StartRowIndex / Pager_NN.MaximumRows) + 1;
            var leng = curPage * Pager_NN.MaximumRows > lstNN.Count ? lstNN.Count - (Pager_NN.MaximumRows * (curPage - 1)) : Pager_NN.MaximumRows;
            for (int i = 0; i < leng; i++)
            {
                var a = lst_NN.Items[i];
                Label lbl = (Label)lst_NN.Items[i].FindControl("lblSTT");                
                lbl.Text = ((i + 1) + (Pager_NN.MaximumRows * (curPage - 1))).ToString();
            }
        }               
        protected void lst_NN_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e) 
        {
            Pager_NN.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            BindData();
        }
        protected void btn_show_insert_Click(object sender, EventArgs e) 
        {
            div_insert.Style["display"] = "block";
            btn_themmoi.Style["display"] = "";
            btn_sua.Style["display"] = "none";
            txtSTT.Text = (db.NgonNgus.Count() +1).ToString();
        }
        protected void btn_edit_NN_Click(object sender, EventArgs e) 
        {
            if (Util.getCommandName(sender) != null)
            {
                int idNN = int.Parse(Util.getCommandName(sender));
                hidden_id.Value = idNN.ToString();
                try
                {
                    div_insert.Style["display"] = "block";
                    btn_themmoi.Style["display"] = "none";
                    btn_sua.Style["display"] = "";

                    var curNN = db.NgonNgus.FirstOrDefault(s => s.MaNN == idNN);
                    txtTen.Text = curNN.TenNN;
                    txtGhiChu.Text = curNN.GhiChu;
                    txtSTT.Text = curNN.STT.ToString();
                    ckbActive.Checked = curNN.Active.Value;
                }
                catch (Exception ex)
                {
                    Util.ShowExceptionError(ex, lbl_ShowInfo, div_alert, "Sửa thất bại!");
                }

            }
        }
        protected void btn_update(object sender, EventArgs e) 
        {
            NgonNgu obj = new NgonNgu();
            if (hidden_id.Value != "")
            {
                int idNN = int.Parse(hidden_id.Value);
                obj = db.NgonNgus.FirstOrDefault(s => s.MaNN == idNN);
            }
            obj.TenNN = txtTen.Text;
            obj.GhiChu = txtGhiChu.Text;
            obj.STT = int.Parse(txtSTT.Text);
            obj.Active = ckbActive.Checked ? true : false;
            if (hidden_id.Value != "")
            {
                try
                {
                    db.SubmitChanges();
                    Session["info"] = "Sửa ngôn ngữ thành công";
                    Response.Redirect("/views/ngonngu/show.aspx");
                }
                catch (Exception ex)
                {
                    Util.ShowExceptionError(ex, lbl_ShowInfo, div_alert, "Sửa ngôn ngữ thất bại. ");
                }
            }
            else
            {
                try
                {
                    db.NgonNgus.InsertOnSubmit(obj);
                    db.SubmitChanges();
                    Session["info"] = "Thêm mới ngôn ngữ thành công";
                    Response.Redirect("/views/ngonngu/show.aspx");
                }
                catch (Exception ex)
                {
                    Util.ShowExceptionError(ex, lbl_ShowInfo, div_alert, "Thêm mới ngôn ngữ thất bại. ");
                }
            }
            
            
        }
        protected void btn_remove_NN_Click(object sender, EventArgs e) 
        {
            if (Util.getCommandName(sender) != null)
            {
                try
                {
                    int idNN = int.Parse(Util.getCommandName(sender));
                    var curNN = db.NgonNgus.FirstOrDefault(s => s.MaNN == idNN);
                    db.NgonNgus.DeleteOnSubmit(curNN);
                    db.SubmitChanges();
                    Session["info"] = "Xóa thành công";
                    Response.Redirect("/views/ngonngu/show.aspx");
                }
                catch (Exception ex) {
                    Util.ShowExceptionError(lbl_ShowInfo, div_alert, "Xóa thất bại! Do có liên quan đến những bảng khác");
                }
            }
        }
        protected void btn_quaylai_Click(object sender, EventArgs e)
        {
            div_insert.Style["display"] = "none";
            ClearInput();
        }
        protected void btn_huybo_Click(object sender, EventArgs e)
        {
            ClearInput();
        }
        protected void ClearInput() {
            txtTen.Text = "";
            txtGhiChu.Text = "";
            ckbActive.Checked = false;
        }
        protected string GetShortContent(string content, int length)
        {
            string strKq = content;
            if (content.Length > length) {
                strKq = content.Substring(0, length);
                if (strKq.LastIndexOf(" ") != strKq.Length) strKq = strKq.Substring(0, strKq.LastIndexOf(" "));
            }

            return content.Length > length ? strKq + " ..." : content;
        }
    }
}