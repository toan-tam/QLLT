using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Project.models
{
    public class HSRecord_ett
    {
        public int Record_id { get; set; }
        public string Tenphong { get; set; }
        public string Tenkho { get; set; }
        public string KHTT { get; set; }
        public string Namchinhly { get; set; }
        public string Donvi { get; set; }
        public string Vande { get; set; }
        public string Muclucso { get; set; }
        public string Hopso { get; set; }
        public string Tieude { get; set; }
        public string Chugiai { get; set; }
        public string ThoigianBD { get; set; }
        public string ThoigianKT { get; set; }
        public string Soluongto { get; set; }
        public string Ngongu { get; set; }
        public string Buttich { get; set; }
        public string ThoihanBQ { get; set; }
        public string ChedoSD { get; set; }
        public string TinhtrangVL { get; set; }
        public string NguoilapHS { get; set; }
        public string Tencongtrinh { get; set; }
        public string Tenhangmuc { get; set; }
        public string Tengiaidoan { get; set; }
        public string Hopdongso { get; set; }

        public int Book_id { get; set; }

        public HSRecord_ett() { }

        public HSRecord_ett(Hsrecord tbl_record)
        {
            Record_id = tbl_record.Hsrecords_Id;
            Tenkho = tbl_record.Tenkho;
            Tenphong = tbl_record.Tenphong;
            KHTT = tbl_record.KHTT;
            Namchinhly = tbl_record.Namchinhly;
            Donvi = tbl_record.Donvi;
            Vande = tbl_record.Vande;
            Muclucso = tbl_record.Muclucso;
            Hopso = tbl_record.Hopso;
            Tieude = tbl_record.Tieude;
            Chugiai = tbl_record.Chugiai;
            ThoigianBD = tbl_record.ThoigianBD;
            ThoigianKT = tbl_record.ThoigianKT;
            Soluongto = tbl_record.Soluongto;
            Ngongu = tbl_record.Ngonngu;
            Buttich = tbl_record.Buttich;
            ThoihanBQ = tbl_record.ThoihanBQ;
            ChedoSD = tbl_record.ChedoSD;
            TinhtrangVL = tbl_record.TinhtrangVL;
            NguoilapHS = tbl_record.NguoilapHS;
            Tencongtrinh = tbl_record.Tencongtrinh;
            Tenhangmuc = tbl_record.Tenhangmuc;
            Tengiaidoan = tbl_record.Tengiaidoan;
            Hopdongso = tbl_record.Hopdongso;
            Book_id = (int)tbl_record.Hsbooks_Id;
        }
    }
}