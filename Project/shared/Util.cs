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
        public static void ShowExceptionError(Exception ex, Page p)
        {
            p.Response.Write(ex.ToString());
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
    }
}