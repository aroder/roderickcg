<%@ Page Language="C#" MasterPageFile="~/One.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Samples_Default" Title="Untitled Page" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>
        Portfolio/Samples</h2>
    <p>
        We will slowly be adding samples of our work here.
    </p>
    <ul>
        <li><asp:HyperLink ID="link1" runat="server" NavigateUrl="~/Samples/TreeViewUsingJQuery/TreeViewUsingJQuery.aspx">TreeView Menu Using JQuery</asp:HyperLink></li>
    </ul>
</asp:Content>

