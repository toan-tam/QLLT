<%@ Page Language="C#" MasterPageFile="~/views/layout/Site.Master" AutoEventWireup="true" CodeBehind="show.aspx.cs" Inherits="Project.views.ngonngu.show" %>

<%@ Register TagPrefix="uc" TagName="sidebarQLDM" Src="~/views/partials/sidebarQLDanhmuc.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <div class="row">

        <uc:sidebarQLDM runat="server" />

        <div class="col-sm-9 div_content_QLphong">
            <div class="row nav_bar header_padding text-left"><a href="/views/QLdanhmuc/QLdanhmuc.aspx?active=DM" class="a_title"> Quản lý danh mục</a> > Quản lý ngôn ngữ</div>
            <br />
            <asp:Panel ID="div_alert" runat="server">
                <asp:Label ID="lbl_ShowInfo" runat="server" ForeColor="#009933"></asp:Label>
            </asp:Panel>
            <asp:Button ID="btn_show_insert" runat="server" CssClass="btn btn-primary font_12 font_bold" OnClick="btn_show_insert_Click" Text="Thêm mới" />
            <div class="div_insert table-responsive" id="div_insert" runat="server">
                <table class="table table-condensed">
                    <tr>
                        <th colspan="4" class=" text-center font_18">THÊM MỚI NGÔN NGỮ</th>
                    </tr>
                    <tr>
                        <td>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td>Tên ngôn ngữ: </td>
                        <td colspan="3">
                            <asp:TextBox ID="txtTen" class="form-control" runat="server" Width="100%"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="rfvtxtTen" ControlToValidate="txtTen" ForeColor="Red" Display="Dynamic" ErrorMessage="Trường này yêu cầu nhập" ValidationGroup="G"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Ghi chú: </td>
                        <td colspan="3">
                            <asp:TextBox ID="txtGhiChu" class="form-control" TextMode="MultiLine" Width="100%" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Số thứ tự </td>
                        <td colspan="3">
                            <asp:TextBox runat="server" ID="txtSTT" class="form-control" Width="100%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Trạng thái: </td>
                        <td colspan="3">
                            <asp:CheckBox runat="server" ID="ckbActive" />
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td colspan="3">
                            <input type="hidden" runat="server" id="hidden_id" />
                            <asp:Button ID="btn_sua" CommandName="Edit" class="btn btn-primary font_12 font_bold" runat="server" Text="Sửa" OnClick="btn_update" ValidationGroup="G" />
                            <asp:Button ID="btn_themmoi" class="btn btn-primary font_12 font_bold" runat="server" Text="Thêm mới" OnClick="btn_update" ValidationGroup="G" />
                            <asp:Button ID="btn_huybo" class="btn btn-danger font_12 font_bold" runat="server" Text="Hủy bỏ" OnClick="btn_huybo_Click" />
                            <asp:Button ID="btn_quaylai" class="btn btn-warning font_12 font_bold" runat="server" Text="Ẩn" OnClick="btn_quaylai_Click" />
                        </td>
                    </tr>
                </table>
            </div>
            <div class="table-responsive font_bold" style="padding: 6px;">
                <asp:ListView ID="lst_NN" runat="server" ItemPlaceholderID="place_holder_NN" OnPagePropertiesChanging="lst_NN_PagePropertiesChanging" >
                    <LayoutTemplate>
                        <table class="table table-bordered text-center">
                            <tr class="font_14">
                                <td>STT</td>
                                <td>Mã ngôn ngữ</td>
                                <td>Tên ngôn ngữ lưu trữ</td>
                                <td>Ghi chú</td>
                                <td>Thao tác</td>
                            </tr>
                            <asp:PlaceHolder runat="server" ID="place_holder_NN" />
                        </table>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><asp:Label runat="server" ID="lblSTT"></asp:Label></td>
                            <td>
                                <%#Eval("MaNN") %>
                            </td>
                            <td><%#Eval("TenNN") %></td>
                            <td><%#GetShortContent(Eval("GhiChu").ToString(),60) %></td>
                            <td>
                                <asp:LinkButton ID="btn_edit_NN" CommandName='<%#Eval("MaNN") %>' OnClick="btn_edit_NN_Click" CssClass="btn btn-info btn-xs" runat="server">
                                    <span class="glyphicon glyphicon-edit"></span> &nbsp;Sửa

                                </asp:LinkButton>
                                <asp:LinkButton ID="btn_remove_NN" CommandName='<%#Eval("MaNN") %>' OnClientClick="return confirm('Bạn có chắc chắn muốn xóa?')" OnClick="btn_remove_NN_Click" CssClass="btn btn-info btn-xs" runat="server">
                                     <span class="glyphicon glyphicon-remove"></span> &nbsp;Xóa
                                </asp:LinkButton>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:ListView>

                <div class="text-center">
                    <asp:DataPager ID="Pager_NN" runat="server" PagedControlID="lst_NN" PageSize="10">
                        <Fields>
                            <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="false" ShowPreviousPageButton="true" PreviousPageText="Trước" ShowNextPageButton="false" />
                            <asp:NumericPagerField ButtonType="Link" />
                            <asp:NextPreviousPagerField ButtonType="Link" ShowNextPageButton="true" ShowLastPageButton="false" ShowPreviousPageButton="false" NextPageText="Sau" />
                        </Fields>
                    </asp:DataPager>
                </div>
            </div>

        </div>
    </div>
</asp:Content>
