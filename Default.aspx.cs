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
using System.Configuration;
using System.Xml;
using System.Xml.Xsl;
using System.Text;
using System.IO;

public partial class _Default : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            LoadLatestBlogPosts();
        }
    }

    //read in the blog posts from an RSS feed, using an XSLT stylesheet
    protected void LoadLatestBlogPosts()
    {
        try
        {
            string LatestBlogPostsRssUrl = System.Configuration.ConfigurationManager.AppSettings["LatestBlogPostsRssUrl"];
            string LatestBlogPostsXslUrl = Server.MapPath(string.Format("xsl/{0}", ConfigurationManager.AppSettings["LatestBlogPostsXslFile"]));
            XmlDocument latestBlogPostsDoc = new XmlDocument();
            XslCompiledTransform latestBlogPostsXsl = new XslCompiledTransform();
            StringBuilder latestBlogPostsStringBuilder = new StringBuilder();
            StringWriter latestBlogPostsStringWriter = new StringWriter(latestBlogPostsStringBuilder);

            latestBlogPostsDoc.Load(LatestBlogPostsRssUrl);
            latestBlogPostsXsl.Load(LatestBlogPostsXslUrl);
            latestBlogPostsXsl.Transform(latestBlogPostsDoc, null, latestBlogPostsStringWriter);
            //latestBlogPostsStringBuilder.Append("Cached at " + DateTime.Now.ToString());
            LatestBlogPostsLiteral.Text = latestBlogPostsStringBuilder.ToString();
        }
        catch (Exception ex)
        {
            //no op; since the .text assignment is the last line, then the section will simply not display if there are errors
        }
    }
}
