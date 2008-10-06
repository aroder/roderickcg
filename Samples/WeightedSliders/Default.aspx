<%@ Page Title="" Language="C#" MasterPageFile="~/masters/One.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Samples_WeightedSliders_Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <style type="text/css">
        .sliderValue
        {
            float: right;
        }
        .locked
        {
            background-image: url('images/lock.png');
        }
        .unlocked
        {
            background-image: url('images/unlock.png');
        }
        .lockedIndicator
        {
            cursor: pointer;
            width: 32px;
            height: 32px;
        }
        .hidden
        {
            visibility: hidden;
        }
        .errorMessageText
        {
            color: Red;
            font-weight: bold;
        }
        .successMessageText
        {
            color: Green;
            font-weight: bold;
        }
    </style>

    <script src="http://code.jquery.com/jquery-latest.js"></script>

    <link rel="stylesheet" href="http://dev.jquery.com/view/tags/ui/latest/themes/flora/flora.all.css"
        type="text/css" media="screen" title="Flora (Default)">

    <script type="text/javascript" src="http://dev.jquery.com/view/tags/ui/latest/ui/ui.core.js"></script>

    <script type="text/javascript" src="http://dev.jquery.com/view/tags/ui/latest/ui/ui.slider.js"></script>

    <script>
        var allowedTotal;
        $(document).ready(function() {
            $(".ui-slider-1").slider({
                steps: 10
                , startValue: 50
                , slide: function() { UpdateSliderValue($(this)); }
                , change: function() { OnChange($(this)); }
            });

            //the combined total of all slider values will not go over this amount
            allowedTotal = $(".ui-slider-1").length * 50;

            //display the initial slider values
            $(".ui-slider-1").each(function() { UpdateSliderValue($(this)); });

            $(".lockedIndicator").click(function() { ToggleLock($(this).parent()); });

            $(".widgetCode").click(function() {
                $(this).get(0).focus();
                $(this).get(0).select();
            });
        });

        var changeHappening = false;
        //note doing an alert in here causes a jquery error
        function OnChange(jquerySliderObject) {
            if (changeHappening) return;
            changeHappening = true;


            while (GetSlidersTotal() > allowedTotal) {
                sliderHighestUnlockedValue = FindOtherSliderWithLargestUnlockedValue(jquerySliderObject);
                //alert('highest unlocked is ' + sliderHighestUnlockedValue.get(0).id);
                if (0 == sliderHighestUnlockedValue.slider("value")) {
                    jquerySliderObject.slider("moveTo", "-=10", 0);
                } else {
                    sliderHighestUnlockedValue.slider("moveTo", "-=10", 0);
                }
            }

            while (GetSlidersTotal() < allowedTotal) {
                sliderLowestUnlockedValue = FindOtherSliderWithLowestUnlockedValue(jquerySliderObject);
                //alert('lowest unlocked is ' + sliderLowestUnlockedValue.get(0).id);
                if (100 == sliderLowestUnlockedValue.slider("value")) {
                    jquerySliderObject.slider("moveTo", "+=10", 0);
                } else {
                    sliderLowestUnlockedValue.slider("moveTo", "+=10", 0);
                }
            }

            changeHappening = false;
        }

        // update the text of the div displaying the slider's value
        function UpdateSliderValue(jquerySliderObject) {
            jquerySliderObject.parent().parent().find(".sliderValue").text(jquerySliderObject.slider("value"));
        }

        // get the sum of all sliders' values
        function GetSlidersTotal() {
            var total = 0;
            $(".ui-slider-1").each(function() {
                total += $(this).slider("value", 0);
            });
            return total;
        }

        function ToggleLock(jquerySliderObject) {
            var lockedIndicator = jquerySliderObject.find(".lockedIndicator");
            if (lockedIndicator.hasClass("locked")) {
//                lockedIndicator.text('unlocked');
                lockedIndicator.addClass('unlocked');
                lockedIndicator.removeClass("locked");
                lockedIndicator.parent().parent().find(".ui-slider-1").slider("enable");
            } else {
//                lockedIndicator.text('locked');
                lockedIndicator.addClass('locked');
                lockedIndicator.removeClass('unlocked');
                lockedIndicator.parent().parent().find(".ui-slider-1").slider("disable");
            }
        }

        function FindOtherSliderWithLargestUnlockedValue(jquerySliderObject) {
            // if only the current slider is unlocked, return it
            if (1 == $(".ui-slider-1").filter(function() { return FilterLocked($(this)); }).length) {
                return jquerySliderObject;
            }

            // find the largest unlocked slider that is not the current slider
            var largestUnlockedSlider = $(".ui-slider-1").filter(function() { return FilterLocked($(this)); }).eq(0);
            if (largestUnlockedSlider.get()[0].id == jquerySliderObject.get()[0].id) {
                largestUnlockedSlider = $(".ui-slider-1").filter(function() { return FilterLocked($(this)); }).eq(1);
            }
            $(".ui-slider-1").filter(function() { return FilterLocked($(this)); }).each(function() {
                if ($(this).slider("value") > largestUnlockedSlider.slider("value")
                    && ($(this).get()[0].id != jquerySliderObject.get()[0].id)
                ) {
                    largestUnlockedSlider = $(this);
                }
            });
            return largestUnlockedSlider;
        }

        function FindOtherSliderWithLowestUnlockedValue(jquerySliderObject) {
            // if only the current slider is unlocked, return it.
            if (1 == $(".ui-slider-1").filter(function() { return FilterLocked($(this)); }).length) {
                return jquerySliderObject;
            }

            // find the smallest unlocked slider that is not the current slider
            var smallestUnlockedSlider = $(".ui-slider-1").filter(function() { return FilterLocked($(this)); }).eq(0);
            if (smallestUnlockedSlider.get(0).id == jquerySliderObject.get(0).id) {
                smallestUnlockedSlider = $(".ui-slider-1").filter(function() { return FilterLocked($(this)); }).eq(1);
            }
            $(".ui-slider-1").filter(function() { return FilterLocked($(this)); }).each(function() {
                if ($(this).slider("value") < smallestUnlockedSlider.slider("value")
                    && ($(this).get(0).id != jquerySliderObject.get(0).id)
                ) {
                    smallestUnlockedSlider = $(this);
                }
            });
            return smallestUnlockedSlider;
        }

        function FilterLocked(jquerySliderObject) {
            return 0 < jquerySliderObject.parent().parent().find(".unlocked").length;
        }

    </script>
    
        <asp:Label ID="MessageLabel" runat="server" EnableViewState="false" /><br />
    <div id="ControlsDiv" runat="server">
        <%--<input type="button" id="toggleSliderValuesButton" value="Hide or Show Values" onclick="$('.sliderValue').toggleClass('hidden');" /><br />
        <br />--%>
        Slider names (one per line):<br />
        <asp:TextBox ID="SliderNamesTextBox" runat="server" Rows="6" TextMode="MultiLine" /><br />
        <asp:Button ID="CreateWidgetButton" runat="server" Text="Create Sliders" OnClick="CreateWidgetButton_Click" />
        <asp:Button ID="ShowWidgetLinksButton" runat="server" Text="ShowWidgetLinks" OnClick="ShowWidgetLinksButton_Click" />
        <div id="widgetLinks" runat="server" enableviewstate="false" visible="false">
            <table>
                <tr>
                    <td>
                        Paste link in <b>email</b> or <b>IM</b>:
                    </td>
                    <td>
                        <asp:TextBox ID="WidgetLinkTextBox" runat="server" CssClass="widgetCode" EnableViewState="false"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Paste HTML to embed in website:
                    </td>
                    <td>
                        <asp:TextBox ID="WidgetIframeTextBox" runat="server" CssClass="widgetCode" EnableViewState="false" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <asp:Repeater ID="SliderRepeater" runat="server">
        <HeaderTemplate>
            <table>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td>
                    <%# Container.DataItem %>
                </td>
                <td>
                    <div id='slider<%# Container.DataItem %>' class='ui-slider-1' style="margin: 10px;">
                        <div class='ui-slider-handle' style="cursor: pointer;">
                        </div>
                    </div>
                </td>
                <td width="25">
                    <span class="sliderValue hidden"></span>
                </td>
                <td>
                    <div class="lockedIndicator unlocked">&nbsp;</div>
                </td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table></FooterTemplate>
    </asp:Repeater>
    <asp:PlaceHolder ID="WidgetPlaceholder" runat="server"></asp:PlaceHolder>
</asp:Content>
