<%@ Page Language="C#" MasterPageFile="~/Services/Services.master" AutoEventWireup="true"
    CodeFile="DotNetDev.aspx.cs" Inherits="Services_DotNetDev" Title=".NET Development" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <h2>
        .NET Development</h2>
    <p>
        We offer the services of expert, Microsoft-certified .NET consultants. From planning
        an initial architecture to implementing a completed solution, Roderick Consulting
        Group can provide guidance and hands-on technical skills to help your business obtain
        a better return on your investment in technology.
    </p>
    <h2>
        Working on a .NET Project?</h2>
    <p>
        To discuss how we might be able to assist in an existing or possible .NET project,
        please
        <asp:HyperLink ID="ContactUsHyperLink" runat="server" NavigateUrl="~/ContactUs.aspx?subject=.NET Development">contact us</asp:HyperLink>.
    </p>
</asp:Content>
