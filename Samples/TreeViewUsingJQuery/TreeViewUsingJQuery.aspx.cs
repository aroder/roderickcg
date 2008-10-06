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
using System.Collections.Generic;
using System.Text;


public partial class Samples_TreeViewUsingJQuery : System.Web.UI.Page
{
    bool specialLinkSet = false;
    string specialLink = "Default2.aspx";
    string defaultLink = "none";
    string[] firstLevel = new string[] { "I", "II", "III" };
    string[] secondLevel = new string[] { "A", "B", "C" };
    string[] thirdLevel = new string[] { "1", "2", "3" };
    string[] fourthLevel = new string[] { "i", "ii", "iii" };
    List<string[]> _levels = new List<string[]>();

    protected void Page_Load(object sender, EventArgs e)
    {
        _levels.Add(firstLevel);
        _levels.Add(secondLevel);
        _levels.Add(thirdLevel);
        _levels.Add(fourthLevel);

        lit.Text = GenerateList(0);
    }
    private string GenerateList(int level)
    {
        StringBuilder sb = new StringBuilder();
        sb.Append(UL(level, false));
        foreach (string item in _levels[level])
        {
            sb.Append(LI(level, false));
            string classes = "menuItem";
            if (0 == level) classes += " topLevel";
            if (3 > level) classes += " expandedBranch";
            sb.AppendFormat("<div class='{0}' level='{1}'>", classes, level);

            sb.Append((level < 3) ? "<img src='leftnav_arrow.gif' /><img src='leftnav_arrow_down.gif' />" : string.Empty);

            if (!specialLinkSet && level == 3)
            {
                sb.AppendFormat("<a href='{0}'>", specialLink);
                specialLinkSet = true;
            }
            else
            {
                sb.AppendFormat("<a href='{0}'>", defaultLink);
            }
            sb.Append(item);
            sb.Append("</a>");
            sb.Append("</div>");
            if (3 > level)
            {
                sb.Append(GenerateList(level + 1));
            }
            sb.Append(LI(level, true));
        }
        sb.Append(UL(level, true));
        return sb.ToString();
    }
    private string LI(int level, bool isClose)
    {
        StringBuilder sb = new StringBuilder();
        int depth = level + 1;
        if (!isClose) for (int i = 0; i < depth; i++) sb.Append("\t");
        sb.Append(isClose ? "</li>\r\n" : string.Format("<li>", level.ToString()));
        return sb.ToString();
    }
    private string UL(int level, bool isClose)
    {
        StringBuilder sb = new StringBuilder();
        int depth = level;
        if (isClose) for (int i = 0; i < depth; i++) sb.Append("\t");
        sb.Append(isClose ? "</ul>" : "<ul>\r\n");
        return sb.ToString();

    }
}
