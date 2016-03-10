using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace Project.models
{
    public class Vbrecord_ett
    {
        public long VBrecordID { get; set; }
        public string SoKHVB { get; set; }
        public int? SoTo { get; set; }
        public string NgonNgu { get; set; }
        public string TrichYeuND { get; set; }
        public string TacGia { get; set; }
        public string TenLoaiVB { get; set; }
        public string TinhTrangVL { get; set; }
        public string TrinhLD { get; set; }
        public string MucDoMat { get; set; }
        public string MucDoTruyCap { get; set; }
        public string YKienGQ { get; set; }
        public string LinkFile { get; set; }
        public string FileAttachType { get; set; }

        public Vbrecord_ett() {  }

        public Vbrecord_ett(Vbrecord vbobj, string domain_str)
        {
            VBrecordID = vbobj.Vbrecords_Id;
            SoKHVB = vbobj.SoKHVB;
            SoTo = vbobj.Soto;
            NgonNgu = vbobj.Ngonngu;
            TrichYeuND = vbobj.TrichyeuND;
            TacGia = vbobj.Tacgia;
            TenLoaiVB = vbobj.Tenloai;
            TinhTrangVL = vbobj.Tinhtrangvatly;
            TrinhLD = vbobj.TrinhLD;
            MucDoMat = vbobj.Mucdomat;
            MucDoTruyCap = vbobj.Mucdotruycap;
            YKienGQ = vbobj.YkienGQ;

            var vbFileAttach = vbobj.VbFileAttaches.Where(o => o.Vbrecords_ID == vbobj.Vbrecords_Id);

            if (vbFileAttach.Count() > 0)
            {
                var faobj = vbFileAttach.SingleOrDefault();
                if (faobj.FileType != null && faobj.FileType != "")
                {
                    if (faobj.FileType == ".gif" || faobj.FileType == ".png" || faobj.FileType == ".jpeg" || faobj.FileType == ".jpg")
                    {
                        LinkFile = domain_str + faobj.DestFileName.Replace('\\', '/');
                    }
                    else
                    {
                        if (faobj.FileType == ".doc" || faobj.FileType == ".docx" || faobj.FileType == ".xls" || faobj.FileType == ".xlsx" || faobj.FileType == ".ppt" || faobj.FileType == ".pptx" || faobj.FileType == ".pdf")
                        {
                            LinkFile = "http://docs.google.com/gview?url=" + domain_str + faobj.DestFileName.Replace('\\', '/');
                        }
                    }
                }

                // faobj.DestFileName;
                FileAttachType = faobj.FileType;
            }
           
        }
    }
}