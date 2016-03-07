using Project.models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Project.controllers
{
    public class HSRecord_ctrl
    {
        QLLuuTruDataContext db = new QLLuuTruDataContext();

        public HSRecord_ctrl() { }

        public Result<List<HSRecord_ett>> GetDataByBookID(int id)
        {
            Result<List<HSRecord_ett>> rs = new Result<List<HSRecord_ett>>();
            try
            {
                List<HSRecord_ett> listOfRecord = new List<HSRecord_ett>();
                var data = db.Hsrecords.Where(o => o.Hsbooks_Id == id);

                if (data.Count() > 0)
                {
                    foreach (var item in data)
                    {
                        HSRecord_ett temp = new HSRecord_ett(item);
                        listOfRecord.Add(temp);
                    }

                    rs.Data = listOfRecord;
                    rs.Error = ErrorCode.Sucess;
                    return rs;
                }

                rs.Data = null;
                return rs;
            }
            catch (Exception e)
            {
                rs.Data = null;
                rs.Error = ErrorCode.Fail;
                rs.ErrorInfo = e.ToString();
                return rs;
            }
        }
    }
}