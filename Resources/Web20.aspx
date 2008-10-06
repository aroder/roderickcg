<%@ Page Language="C#" MasterPageFile="~/Resources/Resources.master" AutoEventWireup="true"
    CodeFile="Web20.aspx.cs" Inherits="Resources_Web20" Title="Web 2.0" %>

<asp:Content ID="content" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <h2>
        Web 2.0
    </h2>
    <p>
        What is Web 2.0? Web 1.0 consisted of web pages linked together with hyperlinks,
        along with web applications such as e-commerce sites. Web 2.0 adds additional elements,
        such as the social aspect of the web--think Facebook and MySpace. Even if you do
        not participate in these sites, you definitely have had exposure to other social
        elements such as blogs, forum posts, live chat, online collaboration, and RSS feeds.
    </p>
    <p>
        Another feature of Web 2.0 is freely available application programming interfaces
        (API's), which allow developers to create better applications more quickly. For
        example, before Web 2.0, if you wanted a map on your web site, you would have had
        to create one from scratch. Now, you can use Google's, Yahoo's, or Microsoft's maps,
        embedded in your web site.
    </p>
        <h2>
        Will Web 2.0 Features Benefit Me?</h2>
        <p>Web 2.0 is all about interacting better with your users.  Some of the benefits are:</p>
        <ul>
            <li>You will have a more targeted audience for your web presence</li>
            <li>Your users can generate valuable content on your web site and help answer each other's questions</li>
            <li>You will spend less to get more out of your investment in technology</li>
            <li>These same principles can be applied within your organization, encouraging greater collaboration and flexibility</li>
        </ul>
        <h2>Additional Information</h2>
        <ul>
            <li><asp:HyperLink ID="Web20AtWikipediaHyperLink" runat="server" NavigateUrl="http://en.wikipedia.org/wiki/Web_2">Web 2.0 at Wikipedia</asp:HyperLink></li>
            <li><asp:HyperLink ID="PaulGrahamWeb20HyperLink" runat="server" NavigateUrl="http://www.paulgraham.com/web20.html">Paul Graham's Opinion?</asp:HyperLink></li>
            <li><asp:HyperLink ID="Web20SiteListHyperLink" runat="server" NavigateUrl="http://www.go2web20.net/">List of Many Web 2.0 Services</asp:HyperLink></li>
            <li><asp:HyperLink ID="DonHinchcliffesBlogHyperLink" runat="server" NavigateUrl="http://web2.wsj2.com/">Don Hinchcliffe's Web 2.0 Blog</asp:HyperLink></li>
        </ul>
</asp:Content>
