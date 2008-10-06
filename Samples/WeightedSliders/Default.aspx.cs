using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

public partial class Samples_WeightedSliders_Default : Page
{
    bool _asWidget = false;

    #region PageMethods
    protected void Page_PreInit(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bool.TryParse(Request.QueryString["asWidget"], out _asWidget);
            if (_asWidget) MasterPageFile = "~/masters/blank.master";
        }
        
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (null != Request.QueryString["sliderNames"]) BindSliderRepeater(Request.QueryString["sliderNames"]);
        }
        if (_asWidget) ControlsDiv.Visible = false;

    }
    #endregion

    #region Buttons
    protected void CreateWidgetButton_Click(object sender, EventArgs e)
    {
        BindSliderRepeater(SliderNamesTextBox);
    }
    protected void ShowWidgetLinksButton_Click(object sender, EventArgs e)
    {
        WidgetLinkTextBox.Text = BuildWidgetLink();
        WidgetIframeTextBox.Text = BuildWidgetIframeHtml();
        widgetLinks.Visible = true;
    }
    #endregion

    #region DataBinding
    protected void BindSliderRepeater(string pipeDelimitedList)
    {
        BindSliderRepeater(new List<string>(pipeDelimitedList.Split(new[] { '|' })));
    }

    protected void BindSliderRepeater(TextBox sliderNamesTextBox)
    {
        BindSliderRepeater(GetSliderNameListFromTextBox(sliderNamesTextBox));
    }

    protected void BindSliderRepeater(List<string> sliderNames)
    {
        if (0 == sliderNames.Count)
        {
            MessageLabel.Text = "Slider Names is empty.";
            MessageLabel.CssClass = "errorMessageText";
            return;
        }

        SliderNamesTextBox.Text = string.Join("\r\n", sliderNames.ToArray());

        SliderRepeater.DataSource = sliderNames;
        SliderRepeater.DataBind();
    }
    #endregion

    protected List<string> GetSliderNameListFromTextBox(TextBox box)
    {
        return new List<string>(
            SliderNamesTextBox.Text.Split(
                new[] { '\n', '\r' }
                , StringSplitOptions.RemoveEmptyEntries
            )
        );
    }
    protected string GetBasePath(Page page)
    {
        StringBuilder sb = new StringBuilder();
        string Port = page.Request.ServerVariables["SERVER_PORT"];

        if (Port == null || Port == "80" || Port == "443")

            Port = "";

        else

            Port = ":" + Port;

        string Protocol = page.Request.ServerVariables["SERVER_PORT_SECURE"];

        if (Protocol == null || Protocol == "0")

            Protocol = "http://";

        else

            Protocol = "https://";

        sb.Append(Protocol);
        sb.Append(page.Request.ServerVariables["SERVER_NAME"]);
        sb.Append(Port);
        //sb.Append(page.Request.ApplicationPath);
        sb.Append(page.Request.CurrentExecutionFilePath);

        return sb.ToString();

    }
    protected string ConvertDictionaryToQueryString(Dictionary<string, string> d)
    {
        StringBuilder sb = new StringBuilder();
        sb.Append("?");
        foreach (string key in d.Keys)
        {
            sb.Append(key);
            sb.Append("=");
            sb.Append(d[key]);
            sb.Append("&");
        }
        return sb.ToString().TrimEnd('&');
    }
    protected string BuildWidgetLink()
    {
        Dictionary<string, string> queryStringDictionary = new Dictionary<string, string>();
        queryStringDictionary.Add("asWidget", "true");
        queryStringDictionary.Add("sliderNames", string.Join("|", GetSliderNameListFromTextBox(SliderNamesTextBox).ToArray()));
        return GetBasePath(this) + ConvertDictionaryToQueryString(queryStringDictionary);
    }
    protected string BuildWidgetIframeHtml()
    {
        StringBuilder sb = new StringBuilder();
        sb.Append(
            "<iframe width='640' height='400' frameborder='0' scrolling='no' marginheight='0' marginwidth='0' src='");
        sb.Append(BuildWidgetLink());
        sb.Append("' />");

        return sb.ToString();
    }
}
