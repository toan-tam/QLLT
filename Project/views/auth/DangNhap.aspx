<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DangNhap.aspx.cs" Inherits="Project.views.auth.DangNhap" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Đăng nhập hệ thống</title>
    <link href="../../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../../css/site.css" rel="stylesheet" />
</head>
<style>
    body {
        padding: 0;
    }
</style>
<body>
    <center>
         <div style=" background-image:url(/images/bg_login.png) ; min-height:707px;"> 
             <div style="height:355px; width:614px;">
                 <div style="height:180px; width:450px; float:left"></div>
                 <div style="width:80%;float:left; background-color: white; color: #5588cc; border: 2px solid #0094ff">
                        <h3 class="text-center font_bold bg-info" style="color: blue;margin:0; padding:15px;">SỞ NỘI VỤ TỈNH LẠNG SƠN</h3>
                     <h2 class="text-center font_bold" style="color: blue">CHI CỤC VĂN THƯ LƯU TRỮ</h2>
                     <form id="form1" runat="server" style="padding:0px 30px 10px 30px;">
                        <table class="table table-responsive table-condensed font_bold">
                            
                            <tr>
                                <td><br></td>
                            </tr>
                            <tr>
                                <td>Tên đăng nhập</td>
                                <td>
                                    <asp:TextBox ID="txt_tendangnhap" CssClass="form-control input-sm" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                             <tr>
                                <td>Mật khẩu</td>
                                <td>
                                    <input type="password" id="txt_matkhau" class="form-control input-sm" runat="server" />
                                 </td>
                            </tr>
                            <tr class="text-right">
                                <td colspan="2">
                                    <asp:Button ID="btn_dangnhap" OnClick="btn_dangnhap_Click" CssClass="btn btn-primary font_bold font_12" runat="server" Text="Đăng nhập"></asp:Button>
                                </td>
                            </tr>
                        </table>
                    </form> 


                 </div>
                
             </div>     
             
                   
         </div>
     </center>
    <script src="../../js/jquery.js"></script>
    <script src="../../js/bootstrap.min.js"></script>
</body>
</html>
