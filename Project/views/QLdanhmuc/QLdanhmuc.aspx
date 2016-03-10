<%@ Page Title="" Language="C#" MasterPageFile="~/views/layout/Site.Master" AutoEventWireup="true" CodeBehind="QLdanhmuc.aspx.cs" Inherits="Project.views.QLdanhmuc.QLdanhmuc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <div class="row">
        <div class="col-sm-3">
            <div class="row">
                <div class="col-sm-11  div_content">
                    <div class="row nav_bar header_padding text-center">Quản lý danh mục</div>
                    <br />

                    <div class="row margin_b1">
                        <div class="list-group font_bold ">
                            <a href="/views/phong/show.aspx" class="list-group-item">Quản lý Phông lưu trữ</a>
                            <a href="#" class="list-group-item">Quản lý Mục lục</a>
                            <a href="#" class="list-group-item">Quản lý danh mục Loại văn bản</a>
                            <a href="#" class="list-group-item">Quản lý danh mục Thời hạn bảo quản</a>
                            <a href="#" class="list-group-item">Quản lý danh mục Chế độ sử dụng</a>
                            <a href="#" class="list-group-item">Quản lý danh mục Tình trạng vật lý</a>
                            <a href="#" class="list-group-item">Quản lý danh mục Ngôn ngữ</a>
                            <a href="#" class="list-group-item">Quản lý danh mục Đơn vị hành chính</a>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <div class="col-sm-9 div_content" style="padding: 20px 0 0 0">
        </div>
    </div>
</asp:Content>
