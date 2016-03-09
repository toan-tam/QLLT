<%@ Page Title="" Language="C#" MasterPageFile="~/views/layout/Site.Master" AutoEventWireup="true" CodeBehind="show.aspx.cs" Inherits="Project.views.phong.Show" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <div class="row">
        <div class="col-sm-3">
            <div class="row">
                <div class="col-sm-11  div_content">
                    <div class="row nav_bar header_padding text-center">Quản lý danh mục</div>
                    <br />

                    <div class="row margin_b1">
                        <div class="list-group font_bold ">
                            <a href="/views/phong/Show.aspx" class="list-group-item">Quản lý Phông lưu trữ</a>
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
        <div class="col-sm-9 div_content_QLphong">
            <div class="row nav_bar header_padding text-center">Quản lý Phông lưu trữ</div>
            <br />
            <asp:Button ID="btn_show_insert" runat="server" CssClass="btn btn-primary font_12 font_bold" OnClick="btn_show_insert_Click" Text="Thêm mới" />

            <div class="table-responsive font_bold" style="padding: 6px;">
                <asp:ListView ID="lst_Phong" runat="server" ItemPlaceholderID="place_holder_phong">
                    <LayoutTemplate>
                        <table class="table table-bordered text-center">
                            <tr>
                                <th colspan="4" class="font_18 text-center">Danh sách Phông lưu trữ</th>
                            </tr>
                            <tr class="font_14">
                                <td>Ảnh Phông lưu trữ</td>
                                <td>Tên Phông lưu trữ</td>
                                <td>Ghi chú</td>
                               <%-- <td>Thao tác</td>--%>
                            </tr>
                            <asp:PlaceHolder runat="server" ID="place_holder_phong" />
                        </table>
                        <asp:DataPager ID="lst_Phong" runat="server" PageSize="10">

                        </asp:DataPager>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>
                                <div style="padding-left: 30%">
                                    <asp:Image Height="60" ImageUrl="~/images/badge.png" class="img-rounded img-responsive" runat="server" />
                                </div>
                            </td>
                            <td><%#Eval("TenPhong") %></td>
                            <td><%#Eval("GhiChu") %></td>
                           <%-- <td>
                                <asp:LinkButton ID="btn_edit_phong" CommandName='<%#Eval("MaPhong") %>' OnClick="btn_edit_phong_Click" CssClass="btn btn-info btn-xs" runat="server">
                                    <span class="glyphicon glyphicon-edit"></span> &nbsp;Sửa

                                </asp:LinkButton>
                            </td>--%>
                        </tr>
                    </ItemTemplate>
                </asp:ListView>
            </div>

        </div>
</asp:Content>
