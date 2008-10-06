<%@ Page Language="C#" MasterPageFile="~/Services/Services.master" AutoEventWireup="true"
    CodeFile="Web20.aspx.cs" Inherits="Services_Web20" Title="Untitled Page" %>

<asp:Content ContentPlaceHolderID="MainContentPlaceHolder" ID="content" runat="server">
    <h2>
        Web 2.0</h2>
    <p>
        Web 2.0 concepts offer the ability for you to reach more customers and to do more
        on the web with less effort. Our consultants have been involved in web development
        since the early days of the web, and have a broad exposure to many social and web-based
        services.
    </p>
    <h2>
        Want to Discuss Web 2.0 and Your Business?</h2>
    <p>
        To discuss how a Web 2.0 features can save development time and help you reach a
        more targeted audience--or for help implementing a web-based solution, please
        <asp:HyperLink ID="ContactUsHyperLink" runat="server" NavigateUrl="~/ContactUs.aspx?subject=Web%202.0">contact us</asp:HyperLink>.
        For further reading on Web 2.0, see our 
        <asp:HyperLink ID="Web20ReferenceHyperLink" runat="server" NavigateUrl="~/Resources/Web20.aspx">resources section</asp:HyperLink>.
    </p>
</asp:Content>
