<%@ Page Language="C#" MasterPageFile="~/Resources/Resources.master" AutoEventWireup="true"
    CodeFile="EAI.aspx.cs" Inherits="Resources_EAI" Title="Enterprise Application Integration (EAI)" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <h2>
        Enterprise Application Integration (EAI)</h2>
    <p>
        EAI uses best practices and principles to integrate existing enterprise computer
        applications. Most organizations operate using many applications, and these applications
        are almost never designed to "talk to" each other. You may have one application
        that services all your needs for human resources, a different application for managing
        customers, and a completely different one for supply-chain management (or even multiple
        ordering systems if you have multiple suppliers).
    </p>
    <p>
        The big difference between EAI and an unstructured integration approach is organization
        and flexibility. EAI allows easier adjustment for change and when you need to add
        a new application to the mix of existing applications.
    </p>
    <h2>Will EAI Benefit Me?</h2>
    <p>
        That depends on your organization.  Good indicators that an EAI solution is right for you include the following:
    </p>
    <ul>
        <li>You enter the same data more than once for any transaction</li>
        <li>You have a particular system that would be more useful if it could use data from other systems</li>
        <li>You are introducing a new application into your business</li>
        <li>You are experiencing rapid growth</li>
        <li>You perform manual tasks that could be automated if application X could get to the data in application Y</li>
    </ul>
    <h2>Additional Information</h2>
    <ul>
        <li><asp:HyperLink ID="EAIAtWikipediaHyperLink" runat="server" NavigateUrl="http://en.wikipedia.org/wiki/Enterprise_application_integration">EAI at Wikipedia</asp:HyperLink></li>
        <li><asp:HyperLink ID="WhatIsEAIHyperLink" runat="server" NavigateUrl="http://searchsoa.techtarget.com/sDefinition/0,,sid26_gci213523,00.html">What is EAI?</asp:HyperLink></li>
        <li><asp:HyperLink ID="EAIBetterThanPoint2PointHyperLink" runat="server" NavigateUrl="http://www.greenhatconsulting.com/egov/faq.html#point2point">Why is EAI better than point-to-point integration?</asp:HyperLink></li>
        <li><asp:HyperLink ID="IntegrationConsortiumHyperLink" runat="server" NavigateUrl="http://www.integrationconsortium.org/">The Integration Consortium</asp:HyperLink></li>
    </ul>
</asp:Content>
