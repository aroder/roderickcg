<%@ Page Language="C#" MasterPageFile="~/Services/Services.master" AutoEventWireup="true"
    CodeFile="WebAppDev.aspx.cs" Inherits="Services_WebAppDev" Title="Web Application Development" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <h2>
        Web Application Development</h2>
    <p>
        We can provide expert consultants in the area of web development on the ASP.NET
        platform. From determining whether ASP.NET is the right platform for your company's
        web development to developing a custom web application, we can provide guidance
        to ensure the technology fits your company's needs.
    </p>
    <h2>
        Looking for a Web-Based Solution?</h2>
    <p>
        To discuss how a web-based solution might benefit your organization, please
        <asp:HyperLink ID="ContactUsHyperLink" runat="server" NavigateUrl="~/ContactUs.aspx?subject=Web%20Application%20Development">contact us</asp:HyperLink>
        for more information.
    </p>
</asp:Content>
