<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="layout.aspx.cs" Inherits="Project.views.layout.layout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../../css/site.css" rel="stylesheet" />
</head>
<body>
    <div class="container-fluid div_above">
        <div class="row">
            <div class="col-xs-9 col-sm-9">
                <a href="../../index.aspx">
                    <img src="../../images/badge.png" />
                </a>
                <font color="red" size="3">
                    CHI CỤC VĂN THƯ LƯU TRỮ TỈNH QUẢNG NINH
                </font>
            </div>
            <div class="col-xs-3 col-sm-3">
                <br />
                <div class="pull-right"><a href="#">Đăng nhập</a>&nbsp;</div>
                <div class="pull-right">&nbsp;</div>
                <div class="pull-right"><a href="#">Đăng ký</a></div>
            </div>

        </div>
        <div class="row text-center">
            <font size="5" class="font_bold">PHẦN MỀM QUẢN LÝ LƯU TRỮ</font>
        </div>
        <br />
        <br />
    </div>
    <nav class="navbar navbar-default nav_bar">
        <div class="container-fluid">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav">
                    <li><a href="#">Trang chủ</a></li>
                    <li><a href="#">Quản trị Hệ thống</a></li>
                    <li><a href="#">Giới thiệu về Chi cục</a></li>
                    <li><a href="#">Quản lý danh mục</a></li>
                    <li><a href="#">Quản lý lưu trữ</a></li>
                    <li><a href="#">Tra cứu báo cáo</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-3">
                <div class="row">
                    <div class="col-sm-11  div_content">
                        <div class="row nav_bar header_padding text-center">Quản lý lưu trữ</div>
                    </div>
                </div>
            </div>
            <div class="col-sm-9 div_content">
                <div class="row nav_bar header_padding">Giới thiệu</div>
            </div>
        </div>
    </div>

    <footer>
        <div class="row">
            <div class="col-sm-5">
                <h4 class="font_bold">CHI CỤC VĂN THƯ LƯU TRỮ TỈNH QUẢNG NINH</h4>
                Địa chỉ: ............................................................................................................................<br />
                Điện thoại: ......................................................................................................................<br />
                Email: ..............................................................................................................................<br />
            </div>
            <div class="col-sm-7 author">
                <div class="pull-right">Đơn vị cung cấp phần mềm: Trường Đại học Xây Dựng</div>
            </div>
        </div>
    </footer>
    <script src="../../js/jquery.js"></script>
    <script src="../../js/bootstrap.min.js"></script>
</body>
</html>
