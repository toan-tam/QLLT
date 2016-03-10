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
        public static void ShowExceptionError(Exception ex, Label target_showInfo, Panel div_alert, string msg)
        {
            div_alert.CssClass = "alert alert-danger";
            target_showInfo.ForeColor = System.Drawing.Color.Red;
            target_showInfo.Text = msg + "<br> Thông tin lỗi: <br>" + ex.ToString();
        }

        // [Toàn] function to get CommandName of current control clicked
        public static string getCommandName(object sender)
        {
            LinkButton link = sender as LinkButton;

            if (link != null)
            {
                return link.CommandName;
               
            }

            return null;
        }

        public static void set_selected_val_4_ddl(DropDownList ddl, string val_search)
        {
            ddl.ClearSelection(); //making sure the previous selection has been cleared
            ddl.Items.FindByValue(val_search).Selected = true;
        }
    }
}