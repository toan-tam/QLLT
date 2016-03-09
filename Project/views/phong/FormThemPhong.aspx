<%@ Page Title="" Language="C#" MasterPageFile="~/views/layout/Site.Master" AutoEventWireup="true" CodeBehind="FormThemPhong.aspx.cs" Inherits="Project.views.phong.FormThemPhong" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <div class="row">
        <div class="col-sm-3">
            <div class="row">
                <div class="col-sm-11  div_content">
                    <div class="row nav_bar header_padding text-center">Quản lý Phông</div>
                    <br />

                    <asp:ListView ID="lst_Phong" runat="server" ItemPlaceholderID="place_holder_phong" OnItemDataBound="lst_Phong_ItemDataBound">
                        <LayoutTemplate>
                            <asp:PlaceHolder runat="server" ID="place_holder_phong" />
                            <asp:DataPager ID="lst_Phong" runat="server" PageSize="10"></asp:DataPager>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <div class="row margin_b1">
                                <div class="col-sm-4 col-xs-4">
                                    <asp:Image Height="60" ImageUrl="~/images/badge.png" class="img-rounded img-responsive" runat="server" />
                                </div>

                                <div class="col-sm-8 col-xs-8 font_bold font_14">

                                    <div class="panel-group" id="accordition">
                                        <div class="panel panel_sidebar">
                                            <div class="panel-heading">
                                                <p class="panel-title">
                                                    <asp:LinkButton CssClass="font_12" data-toggle="collapse" data-parent="#accordion" href='<%# "#" + Eval("MaPhong") %>' OnClick="a_Expand_Click" CommandName='<%#Eval("MaPhong") %>' runat="server">+</asp:LinkButton>
                                                    <asp:LinkButton CssClass="font_12" OnClick="a_Phong_Click" CommandName='<%#Eval("MaPhong") %>' runat="server"><%#Eval("TenPhong") %></asp:LinkButton>
                                                </p>
                                            </div>

                                            <div id='<%#Eval("MaPhong") %>' class="panel-collapse collapse">
                                                <div class="panel-body">
                                                    <asp:ListView ID="lst_HoSo" runat="server" ItemPlaceholderID="place_holder_hoso">
                                                        <LayoutTemplate>
                                                            <ul class="list-group side_bar_ul font_12">
                                                                <asp:PlaceHolder runat="server" ID="place_holder_hoso" />
                                                            </ul>
                                                        </LayoutTemplate>
                                                        <ItemTemplate>

                                                            <li class="list-group-item" id="li_HoSo" runat="server">
                                                               - &nbsp;  <asp:LinkButton href="#" CommandName='<%#Eval("Hososo") %>' runat="server">Hồ sơ số  <%#Eval("Hososo") %></asp:LinkButton>
                                                            </li>

                                                        </ItemTemplate>
                                                    </asp:ListView>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:ListView>
                </div>


            </div>
        </div>
        <div class="col-sm-9 div_content" style="padding: 20px 0 0 0">

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

</asp:Content>
