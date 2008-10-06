<%@ Page Language="C#" MasterPageFile="~/masters/One.master" AutoEventWireup="true" CodeFile="Default.aspx.cs"
    Inherits="_Default" Title="Roderick Consulting Group - Offering services in integration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <h2>
        Business and Technology</h2>
    <p>
        Roderick Consulting Group specializes in providing expert-level technology consulting
        to help companies maximize their return on technology investment. Your business relies
        on the right mix of people, process, and technology, and we provide solutions to
        connect them.
    </p>
    <h2>
        Types of Projects</h2>
    <p>
        Click on any of the following for details on how we can provide value to your company:
    </p>
    <dl>
        <dt><asp:HyperLink ID="Web20HyperLink" runat="server" NavigateUrl="~/Services/Web20.aspx">Web 2.0</asp:HyperLink></dt>
        <dd>
            A web presence that includes Web 2.0 features can present new opportunities and develop a stronger customer base.
        </dd>
        <dt><asp:HyperLink ID="B2BHyperLink" runat="server" NavigateUrl="~/Services/B2B.aspx">Business-to-Business</asp:HyperLink></dt>
        <dd>
            Your business does not operate in a vacuum. Connect effectively with customers,
            vendors, and other third parties.</dd>
        <dt><asp:HyperLink ID="EAIHyperLink" runat="server" NavigateUrl="~/Services/EAI.aspx">Application Integration</asp:HyperLink></dt>
        <dd>
            Information tends to be scattered across many applications, even in small companies.</dd>
        <dt><asp:HyperLink ID="BPMHyperLink" runat="server" NavigateUrl="~/Services/BPM.aspx">Business Process Management</asp:HyperLink></dt>
        <dd>
            Leverage technology to minimize costs and magnify your efforts</dd>
        <dt><asp:HyperLink ID="SOAHyperLink" runat="server" NavigateUrl="~/Services/SOA.aspx">Service-Oriented Architecture</asp:HyperLink></dt>
        <dd>
            SOA and Web Services can make your business more agile.</dd>
    </dl>
    
    <asp:Literal ID="LatestBlogPostsLiteral" runat="server" />
    
</asp:Content>
