<%@ Page Language="C#" MasterPageFile="~/Services/Services.master" AutoEventWireup="true"
    CodeFile="B2B.aspx.cs" Inherits="Services_B2B" Title="Business-to-Business Integration (B2B)" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <h2>
        Business-to-Business Integration (B2B)</h2>
    <p>
        In today's business environment, companies work together and rely on each other.
        A well-planned B2B strategy will allow clean integration of data and processes between
        you and your vendors, customers, service organizations, and other third parties.
        The more automated your B2B transactions become, the better positioned your business
        is to grow.
    </p>
    <p>
        For more information on the benefits of B2B Integration or to discuss how Roderick
        Consulting Group can help you meet your B2B goals, please
        <asp:HyperLink ID="ContactUsHyperLink" runat="server" NavigateUrl="~/ContactUs.aspx?subject=B2B">contact us</asp:HyperLink>.
<%--        For further reading on B2B Integration, see our
        <asp:HyperLink ID="B2BReferenceHyperLink" runat="server" NavigateUrl="~/Resources/B2B.aspx">resources section</asp:HyperLink>.
--%>    </p>
</asp:Content>
