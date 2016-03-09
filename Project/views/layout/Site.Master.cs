using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project.views.layout
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //[Toàn] class active for navigation
            string li_item = Request.QueryString["active"];
            if (li_item  != "" && li_item != null)
            {
                switch (li_item)
                {
                    case "DM":
                        Li_DM.Attributes.Add("class", "active");
                        break;

                    case "TT":
                        Li_TT.Attributes.Add("class", "active");
                        break;

                    case "HT":
                        Li_HT.Attributes.Add("class", "active");
                        break;

                    case "GT":
                        Li_GT.Attributes.Add("class", "active");
                        break;

                    case "LT":
                        Li_LT.Attributes.Add("class", "active");
                        break;

                    case "BC":
                        Li_BC.Attributes.Add("class", "active");
                        break;
                    default:
                        break;
                }
            }
     
        }

        protected void a_QLDM_Click(object sender, EventArgs e)
        {

            //[Toàn] class active for navigation
            LinkButton button = (LinkButton)sender;
            string buttonId = button.ID;

            switch (buttonId)
            {
                case "Link_TT":
                    Response.Redirect("/?active=TT");

                    break;
                case "Link_HT":
                    Response.Redirect("/?active=TT");

                    break;
                case "Link_GT":
                    Response.Redirect("/?active=TT");

                    break;
                case "Link_DM":
                    Response.Redirect("/views/QLdanhmuc/QLdanhmuc.aspx?active=DM");

                    break;
                case "Link_LT":
                    Response.Redirect("/views/QLluutru/QLluutru.aspx?active=LT");

                    break;
                case "Link_BC":
                    Response.Redirect("/?active=TT");

                    break;
                default:
                    break;
            }

        }
    }
}