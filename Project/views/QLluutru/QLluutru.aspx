<%@ Page Title="" Language="C#" MasterPageFile="~/views/layout/Site.Master" AutoEventWireup="true" CodeBehind="QLluutru.aspx.cs" Inherits="Project.views.QLluutru.QLluutru" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <div class="row">
        <div class="col-sm-3">
            <div class="row menu-left">
                <div class="col-sm-12  div_content">
                    <div class="row nav_bar header_padding text-center">Quản lý lưu trữ</div>
                    <br />

                    <asp:ListView ID="lst_Phong" runat="server" ItemPlaceholderID="place_holder_phong" OnItemDataBound="lst_Phong_ItemDataBound" OnPagePropertiesChanging="lst_Phong_PagePropertiesChanging">
                        <LayoutTemplate>
                            <asp:PlaceHolder runat="server" ID="place_holder_phong" />
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

                    <div class="text-center">
                        <asp:DataPager ID="Pager_Phong" runat="server" PagedControlID="lst_Phong" PageSize="10">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="false" ShowPreviousPageButton="true" PreviousPageText="Trước"
                                    ShowNextPageButton="false" />
                                <asp:NumericPagerField ButtonType="Link" />
                                <asp:NextPreviousPagerField ButtonType="Link" ShowNextPageButton="true" ShowLastPageButton="false" ShowPreviousPageButton="false" NextPageText="Sau" />
                            </Fields>
                        </asp:DataPager>
                    </div>
                </div>


            </div>
        </div>
        <div class="col-sm-9 div_content_QLphong">


            <% if (Request.QueryString["act"] == "display")
                {%>

            <div class="row nav_bar header_padding text-left"><a runat="server" id="link_Phong_tittle" class="a_title"></a>  > Danh sách hồ sơ</div>
            <br />
            <asp:Panel ID="div_alert" runat="server">
                <asp:Label ID="lbl_ShowInfo" runat="server" ForeColor="#009933"></asp:Label>
            </asp:Panel>
            <asp:Button ID="btn_HS_insert" OnClick="btn_HS_insert_Click" runat="server" CssClass="btn btn-primary font_12 font_bold" Text="Thêm mới" />
            <br />
            <br />
            <asp:ListView ID="lst_HS" runat="server" ItemPlaceholderID="tablePlaceHolder" OnPagePropertiesChanging="lst_HS_PagePropertiesChanging">
                <LayoutTemplate>
                    <table class="table table-responsive table-bordered text-center">
                        <tr class="font_12 font_bold">
                            <td>Hồ sơ số</td>
                            <td>Mục lục số</td>
                            <td>Hộp số</td>

                            <td>Tiêu đề</td>

                            <td>Bút tích</td>
                            <td>Số lượng tờ</td>
                            <td>Thao tác</td>
                        </tr>
                        <asp:PlaceHolder runat="server" ID="tablePlaceHolder"></asp:PlaceHolder>
                    </table>
                </LayoutTemplate>
                <ItemTemplate>
                    <tr>
                        <td>
                            <asp:LinkButton ID="Link_HoSo" OnClick="Link_HoSo_Click" CommandName='<%#Eval("Hsrecords_Id") %>' runat="server">Hồ sơ số  <%#Eval("Hososo") %></asp:LinkButton>
                        </td>
                        <td><%#Eval("Muclucso") %></td>
                        <td><%#Eval("Hopso") %></td>
                        <td><%#Eval("Tieude") %></td>
                        <td><%#Eval("Buttich") %></td>
                        <td><%#Eval("Soluongto") %></td>
                        <td>
                            <asp:LinkButton ID="btn_edit_HS" CommandName='<%#Eval("Hsrecords_Id") %>' CssClass="btn btn-info btn-xs" runat="server">
                                    <span class="glyphicon glyphicon-edit"></span> &nbsp;Sửa

                            </asp:LinkButton>
                            <br />
                            <br />
                            <asp:LinkButton ID="btn_remove_HS" OnClick="btn_remove_HS_Click" CommandName='<%#Eval("Hsrecords_Id") %>' OnClientClick="return confirm('Bạn có chắc chắn muốn xóa?')" CssClass="btn btn-info btn-xs" runat="server">
                                     <span class="glyphicon glyphicon-remove"></span> &nbsp;Xóa
                            </asp:LinkButton>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>

            <div class="text-center">
                <asp:DataPager ID="Pager_HS" runat="server" PagedControlID="lst_HS" PageSize="10">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="false" ShowPreviousPageButton="true" PreviousPageText="Trước"
                            ShowNextPageButton="false" />
                        <asp:NumericPagerField ButtonType="Link" />
                        <asp:NextPreviousPagerField ButtonType="Link" ShowNextPageButton="true" ShowLastPageButton="false" ShowPreviousPageButton="false" NextPageText="Sau" />
                    </Fields>
                </asp:DataPager>
            </div>

            <% }%>

            <% if (Request.QueryString["act"] == "displayVB")
                {%>
            <div class="row nav_bar header_padding text-left"><a runat="server" id="link_phong_title1" class="a_title"></a> > <a id="link_hoso_title" runat="server" class="a_title"></a> > Danh sách văn bản</div>
            <br />
            <asp:Panel ID="div_alert1" runat="server">
                <asp:Label ID="lbl_ShowInfo1" runat="server" ForeColor="#009933"></asp:Label>
            </asp:Panel>
            <asp:Button ID="btn_VB_insert" runat="server" CssClass="btn btn-primary font_12 font_bold" OnClick="btn_VB_insert_Click" Text="Thêm mới" />
            <table class="table table-bordered">
                <asp:ListView ID="lst_VB" runat="server" ItemPlaceholderID="place_holder_phong" OnPagePropertiesChanging="lst_VB_PagePropertiesChanging">
                    <LayoutTemplate>
                        <table class="table table-bordered text-center">
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
                                <td>Thao tác</td>
                            </tr>
                            <asp:PlaceHolder runat="server" ID="place_holder_phong" />
                        </table>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>
                                <asp:LinkButton runat="server" ID="LinkButton1" PostBackUrl='<%# "~/views/vanban/FormHienThiVB.aspx?vbid=" + Eval("VBrecordID") %>'><%#Eval("SoKHVB") %></asp:LinkButton></td>
                            <td><%#Eval("SoTo") %></td>
                            <td><%#Eval("NgonNgu") %></td>
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
                                <%-- <asp:LinkButton runat="server" ID="link_hienthi_vb" PostBackUrl='<%# Eval("LinkFile") %>'>Xem</asp:LinkButton>--%>
                                <a id="Link_File" runat="server" href='<%# Eval("LinkFile") %>'><%# Eval("LinkText") %></a>
                            </td>
                            <td>
                                <asp:LinkButton ID="btn_edit_phong" CommandName='<%#Eval("VBrecordID") %>' CssClass="btn btn-info btn-xs" runat="server">
                                    <span class="glyphicon glyphicon-edit"></span> &nbsp;Sửa

                                </asp:LinkButton>
                                <br />
                                <br />
                                <asp:LinkButton ID="btn_remove_phong" OnClick="btn_remove_phong_Click" CommandName='<%#Eval("VBrecordID") %>' OnClientClick="return confirm('Bạn có chắc chắn muốn xóa?')" CssClass="btn btn-info btn-xs" runat="server">
                                     <span class="glyphicon glyphicon-remove"></span> &nbsp;Xóa
                                </asp:LinkButton>
                            </td>

                        </tr>
                    </ItemTemplate>
                </asp:ListView>

                <div class="text-center">
                    <asp:DataPager ID="Pager_VB" runat="server" PagedControlID="lst_VB" PageSize="10">
                        <Fields>
                            <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="false" ShowPreviousPageButton="true" PreviousPageText="Trước"
                                ShowNextPageButton="false" />
                            <asp:NumericPagerField ButtonType="Link" />
                            <asp:NextPreviousPagerField ButtonType="Link" ShowNextPageButton="true" ShowLastPageButton="false" ShowPreviousPageButton="false" NextPageText="Sau" />
                        </Fields>
                    </asp:DataPager>
                </div>
            </table>
            <%} %>
        </div>
    </div>
</asp:Content>
