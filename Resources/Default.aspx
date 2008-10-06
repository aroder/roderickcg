<%@ Page Language="C#" MasterPageFile="~/Resources/Resources.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Resources_Default" Title="Resources" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <h2>
        Resources</h2>
    <p>
        The following information is provided as free, unbiased information on some of our
        areas of expertise.
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
