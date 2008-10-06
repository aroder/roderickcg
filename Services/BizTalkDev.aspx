<%@ Page Language="C#" MasterPageFile="~/Services/Services.master" AutoEventWireup="true"
    CodeFile="BizTalkDev.aspx.cs" Inherits="Services_BizTalkDev" Title="BizTalk Development" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <h2>
        BizTalk Server Development</h2>
    <p>
        BizTalk Server is a leading integration product developed by Microsoft and in use
        at many large organizations. Typical uses of BizTalk Server include Enterprise Application
        Integration (EAI), Business-to-Business Integration (B2B), creating a Services-Oriented
        Architecture (SOA), creating an Enterprise Services Bus (ESB), and implementing
        a Business Process Management (BPM) plan.
    </p>
    <p>
        Roderick Consulting Group can provide you with expert BizTalk Server consulting
        services. Please
        <asp:HyperLink ID="ContactUsHyperLink" runat="server" NavigateUrl="~/ContactUs.aspx?subject=BizTalk Development">contact us</asp:HyperLink>
        to discuss your needs for current or future BizTalk Server projects. For further
        reading on BizTalk Server, see our
        <asp:HyperLink ID="BizTalkResourcesHyperLink" runat="server" NavigateUrl="~/Resources/BizTalk.aspx">resources section</asp:HyperLink>.
    </p>
</asp:Content>
