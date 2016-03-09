using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project.shared
{
    public class Util
    {
        public static void ShowExceptionError(Exception ex, Label target_showInfo, Panel div_alert)
        {
            div_alert.CssClass = "alert alert-danger";
            target_showInfo.ForeColor = System.Drawing.Color.Red;
            target_showInfo.Text = "Thêm mới Hồ sơ thất bại. <br> Thông tin lỗi: <br>" + ex.ToString();
        }
    }
}