<%@ Page Title="" Language="C#" MasterPageFile="~/views/layout/Site.Master" AutoEventWireup="true" CodeBehind="timkiem.aspx.cs" Inherits="Project.views.timkiem.timkiem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <div class="row">
        <div class="form-group col-sm-12 border_ddd font_13">
            <div class="col-sm-12">
                <br />
            </div>
            <div class="col-sm-2">
                <div class="margintop_20px"></div>
                <label for="ddl_tieuchi">Tìm kiếm cho: </label>
            </div>
            <div class="col-sm-2">
                <div class="radio">
                    <label>
                        <input type="radio" name="rd_loai" id="rd_hoso" runat="server" checked="true"/>Hồ sơ</label>
                </div>
                <div class="radio">
                    <label>
                        <input type="radio" name="rd_loai"  id="rd_vanban" value="vanban" runat="server"/>Văn bản
                    </label>
                </div>
            </div>

            <div class="col-sm-2">
                <label>Tên trường:</label><br />
                <asp:DropDownList runat="server" ID="ddl_dynamic_attribute" CssClass="form-control input-sm">
                    <asp:ListItem Text="" />
                    <asp:ListItem Text="" />
                </asp:DropDownList>
            </div>


            <div class="col-sm-4">
                <label>Từ khóa:</label><br />
                <asp:TextBox runat="server" ID="txta_timkiem" CssClass="form-control input-sm" />
            </div>
            <div class="col-sm-2">
                <br />
                <asp:Button Text="Tìm kiếm" ID="btn_timkiem" CssClass="btn btn-primary font_bold" OnClick="btn_timkiem_Click" runat="server" />
            </div>

            <br />
            <br />
            <br />
            <br />
            <hr />

            <label>Kết quả tìm kiếm</label>


            <div class="col-sm-12 table-responsive" id="div_list_container" runat="server">
                <asp:ListView runat="server" ID="lst_result" ItemPlaceholderID="placeholderTimkiem">
                    <LayoutTemplate>
                        <asp:Table ID="tbl_result" runat="server"></asp:Table>
                    </LayoutTemplate>
                    <ItemTemplate>


                    </ItemTemplate>
                </asp:ListView>
            </div>
        </div>

    </div>
</asp:Content>
