using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Net.Mail;

public partial class ContactUs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (null != Request.QueryString["subject"])
            {
                SubjectTextBox.Text = Request.QueryString["subject"];
            }
        }
    }
    protected void SubmitButton_Click(object sender, EventArgs e)
    {
        ContactUsMultiView.ActiveViewIndex = 1;

        System.Text.StringBuilder sb = new System.Text.StringBuilder();
        sb.Append(String.Format("FROM: {0}\r\n", NameTextBox.Text));
        sb.Append(String.Format("PHONE OR EMAIL: {0}\r\n", PhoneOrEmailTextBox.Text));
        sb.Append(String.Format("SUBJECT: {0}\r\n", SubjectTextBox.Text));
        sb.Append(String.Format("MESSAGE:\r\n{0}", MessageTextBox.Text));
        MailMessage msg = new MailMessage("roderickcg@roderickcg.com", "roderickcg@roderickcg.com", String.Format("Contact Us Form.  From: {0} Subject: {1}", NameTextBox.Text, SubjectTextBox.Text), sb.ToString());
        SmtpClient smtp = new SmtpClient();

        smtp.SendCompleted += new SendCompletedEventHandler(SmtpClient_SendCompleted);

        try
        {
            smtp.SendAsync(msg, msg);
        }
        catch (SmtpException ex)
        {
            SmtpConfirmationLabel.Text = "SmtpException: " + ex.Message + "<br />Source: " + ex.Source + "<br />Stack Trace: " + ex.StackTrace + "<br />Status Code from SMTP Server: " + ex.StatusCode;
        }
        catch (Exception ex)
        {
            SmtpConfirmationLabel.Text = "Exception: " + ex.Message + "<br />Source: " + ex.Source + "<br />Stack Trace: " + ex.StackTrace;
        }

        //smtp.Send(msg);
    }

    protected void SmtpClient_SendCompleted(object sender, System.ComponentModel.AsyncCompletedEventArgs e)
    {
        MailMessage msg = (MailMessage)e.UserState;

        if (null == e.Error)
        {
            SmtpConfirmationLabel.Text += "Thank you!  We have received your message and will respond shortly.";
        }
        else
        {
            SmtpConfirmationLabel.Text += "There was a problem submitting your message: " + e.Error.ToString();
        }
    }
}
