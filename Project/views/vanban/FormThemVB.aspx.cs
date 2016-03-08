using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project.views.vanban
{
    public partial class FormThemVB : System.Web.UI.Page
    {
        DatabaseDataContext db = new DatabaseDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {

            if(!IsPostBack)
            {
                
            }
        }
    }
}