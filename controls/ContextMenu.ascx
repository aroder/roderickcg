<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ContextMenu.ascx.cs" Inherits="controls_ContextMenu" %>

    <asp:SiteMapDataSource ID="ContextMenuDS" runat="server" StartingNodeOffset="1" ShowStartingNode="false" />
    <div class="content_menu">
        <asp:Repeater ID="ContextMenuRepeater" runat="server" DataSourceID="ContextMenuDS">
            <HeaderTemplate>
                <div>
                    <%# Page.TemplateSourceDirectory.Split('/')[Page.TemplateSourceDirectory.Split('/').GetUpperBound(0)] %>
                </div>
            </HeaderTemplate>
            <ItemTemplate>
                <a href='<%# Eval("url") %>'>
                    <%# Eval("title") %>
                </a>
            </ItemTemplate>
        </asp:Repeater>
    </div>
