<%@ Page Title="" Language="C#" MasterPageFile="~/views/layout/Site.Master" AutoEventWireup="true" CodeBehind="FormThemVB.aspx.cs" Inherits="Project.views.vanban.FormThemVB" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <div class="table-responsive font_bold">
        <asp:Panel id="div_alert" runat="server">
            <asp:Label ID="lbl_ShowInfo" runat="server" ForeColor="#009933" ></asp:Label>
        </asp:Panel>
        <%--<form runat="server" id="form_add_vb">--%>
            <table class="table table-condensed">
                <tr>
                    <th colspan="4" class="tilte_themmoiHS">Thêm mới văn bản vào Hồ sơ</th>
                </tr>
                <tr>
                    <td>Hồ sơ</td>
                    <td colspan="3">
                        <asp:TextBox ID="txt_HoSo" runat="server" Width="100%" ReadOnly="true"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Số hồ sơ</td>
                    <td>
                        <asp:TextBox ID="txt_SoHS" runat="server"></asp:TextBox>
                    </td>
                    <td>Cơ quan lưu trữ</td>
                    <td>
                        <asp:DropDownList ID="ddl_CQLuuTru" runat="server" Width="100%"></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>Số/Ký hiệu văn bản</td>
                    <td>
                        <asp:TextBox ID="txt_SoKHVB" runat="server"></asp:TextBox>
                    </td>
                    <td>Số lượng tờ</td>
                    <td>
                        <asp:TextBox ID="txt_SLTo" runat="server"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>Phông</td>
                    <td>
                        <asp:DropDownList ID="ddl_Phong" runat="server" Width="100%"></asp:DropDownList>
                    </td>
                    <td>Mục lục số</td>
                    <td>
                        <asp:TextBox ID="txt_MucLucSo" runat="server"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>Thời gian</td>
                    <td>
                        <asp:TextBox ID="txt_TG" runat="server"></asp:TextBox>
                    </td>
                    <td>Ký hiệu thông tin</td>
                    <td>
                        <asp:TextBox ID="txt_KHThongTin" runat="server"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>Ngôn ngữ</td>
                    <td>
                        <asp:DropDownList ID="ddl_NgonNgu" runat="server">
                            <asp:ListItem>Tiếng Việt</asp:ListItem>
                            <asp:ListItem>English</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>Tờ số</td>
                    <td>
                        <asp:TextBox ID="txt_ToSo" runat="server"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>Trích yếu</td>
                    <td colspan="3">
                        <asp:TextBox ID="txta_TrichYeu" TextMode="MultiLine" Width="100%" Rows="5" runat="server"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>Tác giả văn bản</td>
                    <td colspan="3">
                        <asp:TextBox ID="txt_TGVB" runat="server" Width="100%"></asp:TextBox>
                    </td>
                </tr>


                <tr>
                    <td>Loại văn bản</td>
                    <td colspan="3">
                        <asp:DropDownList ID="ddl_LoaiVB" runat="server" Width="50%"></asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <td>Tình trạng vật lý</td>
                    <td>
                        <asp:TextBox ID="txt_TTVL" runat="server"></asp:TextBox>
                    </td>
                    <td>Bút tích</td>
                    <td>
                        <asp:TextBox ID="txt_ButTich" runat="server"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>Độ mật</td>
                    <td>
                        <asp:TextBox ID="txt_DoMat" runat="server"></asp:TextBox>
                    </td>
                    <td>Mức độ tin cậy</td>
                    <td>
                        <asp:TextBox ID="txt_MucDoTinCay" runat="server"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>Ghi chú</td>
                    <td colspan="3">
                        <asp:TextBox ID="txt_GhiChu" TextMode="MultiLine" Width="100%" Rows="5" runat="server"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>File tài liệu</td>
                    <td colspan="3">
                        <asp:FileUpload ID="ful_TaiLieu" runat="server" />
                    </td>
                </tr>

                <tr>
                    <td></td>
                    <td colspan="3">
                        <asp:Button ID="btn_themmoi" runat="server" Text="Thêm mới" OnClick="btn_themmoi_Click" />
                        <asp:Button ID="btn_huybo" runat="server" Text="Hủy bỏ" OnClick="btn_huybo_Click" />
                        <asp:Button ID="btn_quaylai" runat="server" Text="Quay lại" Visible="False" />
                    </td>
                </tr>
            </table>
        <%--</form>--%>
    </div>

</asp:Content>
