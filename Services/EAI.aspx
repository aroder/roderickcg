<%@ Page Language="C#" MasterPageFile="~/Services/Services.master" AutoEventWireup="true"
    CodeFile="EAI.aspx.cs" Inherits="Services_EAI" Title="Enterprise Application Integration (EAI)" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <h2>
        Enterprise Application Integration (EAI)</h2>
    <p>
        Any organization that relies on technology has faced the problem of getting two
        or more computer applications to work together. Individual applications are built
        for specific needs of a business, but business processes are hardly ever limited
        to a single application. A good EAI architecture will allow different applications
        to work together to support the business.
    </p>
    <h2>
        Need to Integrate Your IT Assets?</h2>
    <p>
        To discuss whether an EAI project is right for your business, please
        <asp:HyperLink ID="ContactUsHyperLink" runat="server" NavigateUrl="~/ContactUs.aspx?subject=EAI">contact us</asp:HyperLink>.
        For additional reading about EAI, see our
        <asp:HyperLink ID="EAIResourcesHyperLink" runat="server" NavigateUrl="~/Resources/EAI.aspx">resources section</asp:HyperLink>.
    </p>
</asp:Content>
