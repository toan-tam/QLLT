using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace Project.shared
{
    public class Util
    {
        public static void ShowExceptionError(Exception ex, Page p)
        {
            p.Response.Write(ex.ToString());
        }
    }
}