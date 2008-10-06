<%@ Page Language="C#" MasterPageFile="~/masters/One.master" AutoEventWireup="true" CodeFile="TreeViewUsingJQuery.aspx.cs"
    Inherits="Samples_TreeViewUsingJQuery" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContextMenuContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

    <script src="jquery.js" type="text/javascript"></script>

    <script type="text/javascript">
        //returns boolean true if the menuItem div is a branch
        function isBranch(jqueryMenuItemDiv) {
            return jqueryMenuItemDiv.hasClass("collapsedBranch") || jqueryMenuItemDiv.hasClass("expandedBranch");
        }
        //returns void
        //jqueryBranchDiv - should be a jquery object representing the branches (div class="menuItem") to collapse or expand
        //collapseSiblings - true if the siblings of the expanded branch should be collapsed
        //animate - true if animation is desired in the toggle; false if it should just snap into place
        function ToggleBranch(jqueryBranchDiv, collapseSiblings, animate) {
            if (isBranch(jqueryBranchDiv)) {
                if (animate) {
                    jqueryBranchDiv.parent("li").children("ul").animate({ "height":"toggle", "opacity":"toggle"}, "500");
                } else {
                    jqueryBranchDiv.parent("li").children("ul").toggle();
                }
                
                jqueryBranchDiv.children("img:first").toggle();
                jqueryBranchDiv.children("img:last").toggle();
                jqueryBranchDiv.toggleClass("collapsedBranch");
                jqueryBranchDiv.toggleClass("expandedBranch");

                if (collapseSiblings) {
                    jqueryBranchDiv.parent("li").siblings().children("div").each(function() {
                        $(this).parent("li").children("ul").hide();
                        $(this).children("img:first").show()
                        $(this).children("img:last").hide();
                        $(this).addClass("collapsedBranch");
                        $(this).removeClass("expandedBranch");
                    });
                }
            }
        }

        $(document).ready(function() {

            $("#leftnav div.menuItem").each(function(i) {
                //set padding-left appropriate to the current level
                $(this).css("padding-left", ($(this).attr("level") * 10 + 10) + "px");
                //collapse everything at the start
                $(this).children("img:first").toggle();
                ToggleBranch($(this));
            })
        .hover(function() {
            //apply the hover class to both the div.menuItem as well as the link it contains
            $(this).toggleClass("hover");
            $(this).find("a").toggleClass("hover");

            //must explicitly set the background color, because the top levels have a class applied to them that sets the background-color, which the .hover class will not override
            $(this).css("background-color", "#fff");
            $(this).find("a").css("color", "#000");
        }, function() {
            //reverse the settings that were applied on the on hover function above
            $(this).css("background-color", "")
            $(this).toggleClass("hover");
            $(this).find("a").toggleClass("hover");
            $(this).find("a").css("color", "");
        })
        .click(function() {
            //when the div.menuItem is clicked, it should be toggled and its siblings collapsed
            ToggleBranch($(this), true, true);
        }).each(function(i) {

            //current contains a jquery object representing the anchor element
            var current = $(this).find("a").filter(function() {
                return this.href.toLowerCase() == location.href.toLowerCase();
            });
            
            // current.length will be true if the anchor's href tag matches the current url
            if (current.length) {
                // expand the parents (and the current node) of the node that contains the url of the current page
                current.parents("li").children("div").each(function() {
                    ToggleBranch($(this));
                });

                //make the current page's node bold
                current.css("font-weight", "bold");
            }
        });

            $("#leftnav a").click(function() {
                // disable the menu behavior when a link is clicked
                $(this).parents("li").eq(0).children("div.menuItem").unbind('click');
            });

            //now that padding has been applied, make visible
            $("#leftnav").css("visibility", "visible");

        });
    </script>

    <style type="text/css">
        #leftnav
        {
            /* start out invisible */
            visibility: hidden;
            width: 160px; /*border: 1px solid black;*/
        }
        #leftnav ul, li
        {
            /* remove all default list styles */
            margin-left: 0;
            padding-left: 0;
            list-style: none; /**/
        }
        #leftnav div.menuItem
        {
            /* adding padding to the divs makes them look a little nicer */
            padding-top: 2px;
            padding-bottom: 2px; /**/ /*border: 1px solid #000;*/
        }
        #leftnav div.expandedBranch
        {
            /* Branched that are expanded should be bold */
            font-weight: bold; /**/ /* This does not affect the text that is inside the a tag inside the div.  */
            color: #000; /**/
        }
        #leftnav div.collapsedBranch
        {
        }
        .hover
        {
            background-color: #fff;
            cursor: pointer;
            color: Black;
        }
        #leftnav div > img
        {
            /* The expanded/collapsed images need to have some padding between them and the text */
            padding-right: 10px; /**/
        }
        #leftnav-top
        {
            /* The width and height are necessary to force the div to be the same size as the background image */
            width: 159px;
            height: 18px;
            background: url('leftnav_top.jpg') no-repeat #ffffff; /**/
        }
        #leftnav-bottom
        {
            /* The width and height are necessary to force the div to be the same size as the background image */
            width: 138px;
            height: 49px;
            background: url('leftnav_bottom_slice.jpg') repeat-x #ffffff; /**/ /* Float and position are necessary so the bottom and the bottom-right line up with each other */
            position: relative;
            float: left; /**/
        }
        #leftnav-bottom-right
        {
            /* The width and height are necessary to force the div to be the same size as the background image */
            width: 18px;
            height: 49px;
            background: url('leftnav_bottomright_corner.jpg') no-repeat #ffffff; /**/ /* Float and position are necessary so the bottom and the bottom-right line up with each other */
            position: relative;
            float: left; /**/
        }
        #leftnav-main
        {
            background: url(leftnav_bg_collapsed.jpg) repeat-y;
        }
        #leftnav-main > ul
        {
            /*border: 1px solid black;*/
            width: 150px;
            margin: 0px;
            padding: 3px 0px 3px 0px;
        }
        #leftnav-main A
        {
            color: #666666;
            text-decoration: none;
        }
        /*#leftnav-main A:hover
        {
            color: #000;
        }*/#leftnav div.topLevel
        {
            /* The first-level branches need to have a different background color than the children branches */
            background-color: #FFCC66; /**/ /* Because they are a different color than the background, adding borders gives them the appearance of being separated */
            border-top: 1px solid #ffe28a;
            border-bottom: 1px solid #ffe28a; /**/
        }
    </style>
    <div id="outerDiv" style="padding-left: 100px;">
        <div id="leftnav">
            <div id="leftnav-top">
            </div>
            <div id="leftnav-main">
                <asp:Literal ID="lit" runat="server" />
            </div>
            <div id="leftnav-bottom">
            </div>
            <div id="leftnav-bottom-right">
            </div>
        </div>
    </div>
</asp:Content>
