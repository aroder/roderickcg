<%@ Page Language="C#" MasterPageFile="~/Services/Services.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Services_Default" Title="Services" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <h2>
        Services</h2>
    <p>
        Our services focus on the benefits of integration, both within your company and
        between you and other organizations. We specialize in the following areas:
    </p>
    <asp:SiteMapDataSource ID="SiteMapDataSource" runat="server" ShowStartingNode="false"
        StartingNodeOffset="1" />
    <asp:Repeater ID="ServicesRepeater" runat="server" DataSourceID="SiteMapDataSource">
        <HeaderTemplate>
            <ul>
        </HeaderTemplate>
        <ItemTemplate>
            <li><a href='<%# Eval("url") %>'>
                <%# Eval("description") %></li>
            </a>
        </ItemTemplate>
        <FooterTemplate>
            </ul>
        </FooterTemplate>
    </asp:Repeater>
</asp:Content>
