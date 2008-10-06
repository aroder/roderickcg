<%@ Page Language="C#" MasterPageFile="~/masters/One.master" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs"
    Inherits="ContactUs" Title="Contact Us" Async="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">

    <script language="javascript" type="text/javascript">
    function ResetContactUsForm() {
        var NameTextBox = document.getElementById('<%= NameTextBox.ClientID %>');
        var PhoneOrEmailTextBox = document.getElementById('<%= PhoneOrEmailTextBox.ClientID %>');
        var SubjectTextBox = document.getElementById('<%= SubjectTextBox.ClientID %>');
        var MessageTextBox = document.getElementById('<%= MessageTextBox.ClientID %>');
        
        NameTextBox.value = '';
        PhoneOrEmailTextBox.value = '';
        SubjectTextBox.value = '';
        MessageTextBox.value = '';
    }
    </script>

    <h2>
        Contact Us</h2>
    <asp:MultiView ID="ContactUsMultiView" runat="server" ActiveViewIndex="0">
        <asp:View ID="FormView" runat="server">
            <asp:ValidationSummary ID="ValidationSummary" runat="server" />
            <table>
                <tr>
                    <td>
                        Name:
                    </td>
                    <td>
                        <asp:TextBox ID="NameTextBox" runat="server"></asp:TextBox>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                        Phone or Email:</td>
                    <td>
                        <asp:TextBox ID="PhoneOrEmailTextBox" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="rfvPhoneOrEmailTextBox" runat="server" ControlToValidate="PhoneOrEmailTextBox"
                            Text="*" ErrorMessage="Please submit a valid email or phone number so we can return your message." />
                    </td>
                </tr>
                <tr>
                    <td>
                        Subject:
                    </td>
                    <td>
                        <asp:TextBox ID="SubjectTextBox" runat="server"></asp:TextBox></td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        Message:
                    </td>
                    <td valign="top">
                        <asp:TextBox ID="MessageTextBox" runat="server" Rows="6" Wrap="true" TextMode="MultiLine"></asp:TextBox>
                    </td>
                    <td valign="top">
                        <asp:RequiredFieldValidator ID="rfvMessageTextBox" runat="server" ControlToValidate="MessageTextBox"
                            Text="*" ErrorMessage="Please submit a message." />
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td>
                        <asp:Button ID="SubmitButton" runat="server" Text="Submit" OnClick="SubmitButton_Click" />
                        &nbsp;
                        <asp:Button ID="ResetButton" runat="server" Text="Reset" CausesValidation="false"
                            OnClientClick="ResetContactUsForm(); return false;" /></td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="ConfirmationView" runat="server">
            <asp:Label ID="SmtpConfirmationLabel" runat="server"></asp:Label>
        </asp:View>
    </asp:MultiView>
</asp:Content>
