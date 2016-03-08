using Project.controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //HSRecord_ctrl record_ctrl = new HSRecord_ctrl();
            //var rs = record_ctrl.GetDataByBookID(11);

            //switch (rs.Error)
            //{
            //    case models.ErrorCode.Sucess:

            //        PagedDataSource pg = new PagedDataSource();
            //        pg.DataSource = rs.Data;
            //        pg.AllowPaging = true;
            //        pg.PageSize = 24;



            //        DataList_Hoso.DataSource = pg;
            //        DataList_Hoso.DataBind();
            //        break;
            //    case models.ErrorCode.Fail:
            //        break;
            //    case models.ErrorCode.NaN:
            //        break;
            //    default:
            //        break;
            //}
        }
    }
}