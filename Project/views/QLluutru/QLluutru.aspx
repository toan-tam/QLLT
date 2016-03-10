<%@ Page Title="" Language="C#" MasterPageFile="~/views/layout/Site.Master" AutoEventWireup="true" CodeBehind="QLluutru.aspx.cs" Inherits="Project.views.QLluutru.QLluutru" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <div class="row">
        <div class="col-sm-3">
            <div class="row menu-left">
                <div class="col-sm-12  div_content">
                    <div class="row nav_bar header_padding text-center">Quản lý lưu trữ</div>
                    <br />

                    <asp:ListView ID="lst_Phong" runat="server" ItemPlaceholderID="place_holder_phong" OnItemDataBound="lst_Phong_ItemDataBound">
                        <LayoutTemplate>
                            <asp:PlaceHolder runat="server" ID="place_holder_phong" />
                            <asp:DataPager ID="lst_Phong" runat="server" PageSize="10"></asp:DataPager>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <div class="row margin_b1">

                                <div class="col-sm-12 col-xs-12 font_bold font_14" style="padding: 0px">

                                    <div class="panel-group" id="accordition">
                                        <div class="panel panel_sidebar">
                                            <div class="panel-heading">
                                                <p class="panel-title">
                                                    <asp:LinkButton CssClass="font_12 padding_sidebar" data-toggle="collapse" data-parent="#accordion" href='<%# "#" + Eval("MaPhong") %>' OnClick="a_Expand_Click" CommandName='<%#Eval("MaPhong") %>' runat="server"> <span class="glyphicon glyphicon-list-alt"></span></asp:LinkButton>
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
                                                                <asp:LinkButton ID="Link_HoSo" OnClick="Link_HoSo_Click" CommandName='<%#Eval("Hsrecords_Id") %>' runat="server">Hồ sơ số  <%#Eval("Hososo") %></asp:LinkButton>
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
        <div class="col-sm-9 div_content_QLphong">


            <% if (Request.QueryString["act"] == "display")
                {%>

            <div class="row nav_bar header_padding text-center">Quản lý hồ sơ</div>
            <br />
            <asp:Button ID="btn_HS_insert" OnClick="btn_HS_insert_Click" runat="server" CssClass="btn btn-primary font_12 font_bold" Text="Thêm mới" />

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
                    <asp:DataPager ID="list_HS" runat="server" PageSize="24">
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
                            <img src="../../images/hosoicon.png" width="80" alt="Alternate Text" />
                        </div>

                        <%--<p>Hồ sơ <%#Eval("Hososo")%></p>--%>
                        <asp:LinkButton ID="Link_HoSo" OnClick="Link_HoSo_Click" CommandName='<%#Eval("Hsrecords_Id") %>' runat="server">Hồ sơ số  <%#Eval("Hososo") %></asp:LinkButton>
                    </td>
                </ItemTemplate>
            </asp:ListView>
            <% }%>

            <% if (Request.QueryString["act"] == "displayVB")
                {%>
            <div class="row nav_bar header_padding text-center">Quản lý văn bản</div>
            <br />
            <asp:Button ID="btn_VB_insert" runat="server" CssClass="btn btn-primary font_12 font_bold" OnClick="btn_VB_insert_Click" Text="Thêm mới" />
            <table class="table table-bordered">
                <asp:ListView ID="lst_VB" runat="server" ItemPlaceholderID="place_holder_phong">
                    <LayoutTemplate>
                        <table class="table table-bordered text-center">
                            <%--<tr>
                                <th colspan="12" class="font_18 text-center">Danh sách văn bản</th>
                            </tr>--%>
                            <tr class="font_14 font_bold">
                                <td>SoKHVB</td>
                                <td>Số tờ</td>
                                <td>Ngôn ngữ</td>
                                <td>Trích yếu ND</td>

                                <td>Tác giả</td>
                                <td>Tên Loại</td>
                                <td>Trình trạng vật lý</td>
                                <td>TrinhLD</td>

                                <td>Mức độ mật</td>
                                <td>Mức độ truy cập</td>
                                <td>Ý kiến GQ</td>
                                <td>Xem Nội dung</td>
                            </tr>
                            <asp:PlaceHolder runat="server" ID="place_holder_phong" />
                        </table>
                        <asp:DataPager ID="lst_Phong" runat="server" PageSize="30">
                        </asp:DataPager>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>

                                <asp:LinkButton runat="server" ID="LinkButton1" PostBackUrl='<%# "~/views/vanban/FormHienThiVB.aspx?vbid=" + Eval("VBrecordID") %>'><%#Eval("SoKHVB") %></asp:LinkButton></td>
                            <td><%#Eval("SoTo") %></td>
                            <td><%#Eval("NgonNgu") %></td>
<<<<<<< HEAD
=======

>>>>>>> 56d2c11a2090777f08d9e76fbcbf6076c1a61eb5
                            <td>
                                <%#Eval("TrichYeuND") %>
                            </td>
                            <td><%#Eval("TacGia") %></td>
                            <td><%#Eval("TenLoaiVB") %></td>
                            <td>
                                <%#Eval("TinhTrangVL") %>
                            </td>
                            <td><%#Eval("TrinhLD") %></td>
                            <td><%#Eval("MucDoMat") %></td>
                            <td>
                                <%#Eval("MucDoTruyCap") %>
                            </td>
                            <td><%#Eval("YKienGQ") %></td>
                            <td>
                                <%--<asp:LinkButton runat="server" ID="link_hienthi_vb" PostBackUrl='<%# Eval("LinkFile") %>' ForeColor='<%# Eval("LinkColor") %>'> <%# Eval("LinkText") %></asp:LinkButton>--%>
                                <a id="Link_File" runat="server" href='<%# Eval("LinkFile") %>' ><%# Eval("LinkText") %></a>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:ListView>

            </table>
            <%} %>
        </div>
    </div>
</asp:Content>
