<%@ Page Title="" Language="C#" MasterPageFile="~/views/layout/Site.Master" AutoEventWireup="true" CodeBehind="QLdanhmuc.aspx.cs" Inherits="Project.views.QLdanhmuc.QLdanhmuc" %>
<%@ Register TagPrefix="uc" TagName="sidebarQLDM" Src="~/views/partials/sidebarQLDanhmuc.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <div class="row">
        <uc:sidebarQLDM runat="server" />
        <div class="col-sm-9 div_content" style="padding: 20px 0 0 0">
        </div>
    </div>
</asp:Content>
