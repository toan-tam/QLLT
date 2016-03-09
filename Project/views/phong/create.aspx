<%@ Page Title="" Language="C#" MasterPageFile="~/views/layout/Site.Master" AutoEventWireup="true" CodeBehind="create.aspx.cs" Inherits="Project.views.phong.create" %>
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
        <div class="col-sm-9 div_content">
            <div class="row nav_bar header_padding text-center">Quản lý Phông lưu trữ</div>
            <br />
            <div class="table-responsive font_bold" style="padding: 6px;">

                <% if (Request.QueryString["act"] == "display")
                    {%>

                <asp:ListView ID="list_HS" runat="server" GroupItemCount="8">
                    <LayoutTemplate>
                        <table class="table table-responsive">
                            <tr>
                                <td>
                                    <table class="table table_group">
                                        <asp:PlaceHolder runat="server" ID="groupPlaceHolder"></asp:PlaceHolder>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <asp:DataPager ID="list_HS" runat="server" PageSize="8">
                            <Fields>
                                <asp:NextPreviousPagerField FirstPageText="&lt;&lt;" ShowFirstPageButton="True" ShowNextPageButton="False" />
                                <asp:NumericPagerField />
                                <asp:NextPreviousPagerField LastPageText="&gt;&gt;" ShowLastPageButton="True" ShowPreviousPageButton="False" />
                            </Fields>
                        </asp:DataPager>
                    </LayoutTemplate>
                    <GroupTemplate>
                        <tr>
                            <asp:PlaceHolder runat="server" ID="itemPlaceHolder"></asp:PlaceHolder>
                        </tr>
                    </GroupTemplate>
                    <ItemTemplate>
                        <td>
                            <div class="row margin_b10">
                                <img src="../../images/badge.png" width="70" alt="Alternate Text" />
                            </div>

                            <p>Hồ sơ <%#Eval("Hososo")%></p>
                        </td>
                    </ItemTemplate>
                </asp:ListView>
                <% }
                    else
                    {%>

                <table class="table table-condensed">
                    <tr>
                        <th colspan="4" class=" text-center font_18">THÊM MỚI PHÔNG</th>
                    </tr>
                    <tr>
                        <td>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td>Tên phông: </td>
                        <td colspan="3">
                            <asp:TextBox ID="txt_TenPhong" class="form-control" runat="server" Width="100%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Ghi chú: </td>
                        <td colspan="3">
                            <asp:TextBox ID="txta_GhiChu" class="form-control" TextMode="MultiLine" Width="100%" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td colspan="3">
                            <asp:Button ID="btn_themmoi" class="btn btn-primary font_12 font_bold" runat="server" Text="Thêm mới" OnClick="btn_themmoi_Click" />
                            <asp:Button ID="btn_huybo" class="btn btn-danger font_12 font_bold" runat="server" Text="Hủy bỏ" OnClick="btn_huybo_Click" />
                            <asp:Button ID="btn_quaylai" class="btn btn-warning font_12 font_bold" runat="server" Text="Quay lại" OnClick="btn_quaylai_Click" />
                        </td>
                    </tr>
                </table>
                <%} %>
            </div>
        </div>
    </div>
</asp:Content>
