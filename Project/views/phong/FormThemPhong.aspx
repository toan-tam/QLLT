<%@ Page Title="" Language="C#" MasterPageFile="~/views/layout/Site.Master" AutoEventWireup="true" CodeBehind="FormThemPhong.aspx.cs" Inherits="Project.views.phong.FormThemPhong" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <form runat="server">
        <div class="row">
            <div class="col-sm-3">
                <div class="row">
                    <div class="col-sm-11  div_content">
                        <div class="row nav_bar header_padding text-center">Quản lý danh mục</div>
                        <br />

                        <asp:ListView ID="lst_Phong" runat="server" ItemPlaceholderID="place_holder_phong">
                            <LayoutTemplate>
                                <asp:PlaceHolder runat="server" ID="place_holder_phong" />
                            </LayoutTemplate>
                            <ItemTemplate>
                                <div class="row margin_b1">
                                    <div class="col-sm-4 col-xs-4">
                                        <asp:Image Height="60" ImageUrl="~/images/badge.png" class="img-rounded img-responsive" runat="server" />
                                    </div>

                                    <div class="col-sm-8 col-xs-8 font_bold font_14" style="padding-top: 8%">
                                        <p>
                                            <asp:LinkButton OnClick="a_Expand_Click" CommandName='<%#Eval("MaPhong") %>' runat="server">+</asp:LinkButton>
                                            <asp:LinkButton OnClick="a_Phong_Click" CommandName='<%#Eval("MaPhong") %>' runat="server"><%#Eval("TenPhong") %></asp:LinkButton>
                                        </p>
                                        <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                                        <ul class="list-group side_bar_ul">
                                            <asp:ListView ID="lst_HoSo" runat="server" ItemPlaceholderID="place_holder_hoso">
                                                <ItemTemplate>
                                                    <asp:PlaceHolder ID="place_holder_hoso" runat="server" />

                                                    <li class="list-group-item" id="li_HoSo" runat="server"></li>

                                                </ItemTemplate>
                                            </asp:ListView>
                                        </ul>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:ListView>
                    </div>


                </div>
            </div>
            <div class="col-sm-9 div_content"  style="padding:0">

                <div class="table-responsive font_bold">

                    <% if (Request.QueryString["act"] == "display")
                        {%>
                    <asp:DataList ID="dtl_HoSo" runat="server"  CssClass="table table-responsive text-center" RepeatColumns="8" RepeatDirection="Horizontal" ShowFooter="False" ShowHeader="False">
                        <ItemTemplate>
                            <div class="row margin_b10">
                                <img src="../../images/badge.png" width="70" alt="Alternate Text" />
                            </div>

                            <p>Hồ sơ <%#Eval("Hososo")%></p>
                        </ItemTemplate>
                    </asp:DataList>
                    <% }
                        else
                        {%>

                    <table class="table table-condensed">
                        <tr>
                            <th colspan="4" class="tilte_themmoiHS">Quản lý phông</th>
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
                                <asp:Button ID="btn_themmoi" class="btn btn-primary" runat="server" Text="Thêm mới" OnClick="btn_themmoi_Click" />
                                <asp:Button ID="btn_huybo" class="btn btn-danger" runat="server" Text="Hủy bỏ" OnClick="btn_huybo_Click" />
                                <asp:Button ID="btn_quaylai" class="btn btn-warning" runat="server" Text="Quay lại" OnClick="btn_quaylai_Click" />
                            </td>
                        </tr>
                    </table>
                    <%} %>
                </div>
            </div>
        </div>

    </form>
</asp:Content>
