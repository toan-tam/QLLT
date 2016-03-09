<%@ Page Title="" Language="C#" MasterPageFile="~/views/layout/Site.Master" AutoEventWireup="true" CodeBehind="QLluutru.aspx.cs" Inherits="Project.views.QLluutru.QLluutru" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <div class="row">
        <div class="col-sm-3">
            <div class="row">
                <div class="col-sm-11  div_content">
                    <div class="row nav_bar header_padding text-center">Quản lý lưu trữ</div>
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

                                                            <li class="list-group-item" id="li_HoSo" runat="server">- &nbsp; 
                                                                <asp:LinkButton ID="Link_HoSo" OnClick="Link_HoSo_Click" CommandName='<%#Eval("Hososo") %>' runat="server">Hồ sơ số  <%#Eval("Hososo") %></asp:LinkButton>
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
                <% }%>
            </div>
        </div>
    </div>
</asp:Content>
