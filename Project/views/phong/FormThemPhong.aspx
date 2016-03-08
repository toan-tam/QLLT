<%@ Page Title="" Language="C#" MasterPageFile="~/views/layout/Site.Master" AutoEventWireup="true" CodeBehind="FormThemPhong.aspx.cs" Inherits="Project.views.phong.FormThemPhong" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <div class="table-responsive font_bold">
        <form runat="server">
            <table class="table table-condensed">
                <tr>
                    <th colspan="4" class="tilte_themmoiHS">Quản lý phông</th>
                </tr>
                <tr>
                    <td>Tên phông: </td>
                    <td colspan="3">
                        <asp:TextBox ID="txt_TenPhong" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="3">
                        <asp:Button ID="btn_themmoi" runat="server" Text="Thêm mới" />
                        <asp:Button ID="btn_huybo" runat="server" Text="Hủy bỏ" />
                        <asp:Button ID="btn_quaylai" runat="server" Text="Quay lại" />
                    </td>
                </tr>
            </table>
        </form>
    </div>
</asp:Content>
