<%@ Page Language="C#" MasterPageFile="~/Services/Services.master" AutoEventWireup="true"
    CodeFile="BPM.aspx.cs" Inherits="Services_BPM" Title="Business Process Management (BPM)" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <h2>
        Business Process Management (BPM)</h2>
    <p>
        BPM is about increasing effectiveness and efficiency within business processes.
        BPM consists of defining, measuring, and improving how a company accomplishes its
        objectives. An effective BPM strategy will result in processes that 1) accomplish
        the companies goals with the least cost and 2) are flexible to account for changing
        markets and business needs.
    </p>
    <p>
        To discuss how Roderick Consulting Group can help you meet your process management
        goals, please
        <asp:HyperLink ID="ContactUsHyperLink" runat="server" NavigateUrl="~/ContactUs.aspx?subject=BPM">contact us</asp:HyperLink>.
        For further reading on BPM, see our
        <asp:HyperLink ID="BPMResourcesHyperLink" runat="server" NavigateUrl="~/Resources/BPM.aspx">resources section</asp:HyperLink>.
    </p>
</asp:Content>
