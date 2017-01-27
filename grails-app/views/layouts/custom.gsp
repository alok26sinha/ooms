<%@ page import="java.util.Locale" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<link rel="stylesheet" type="text/css" media="screen" href="${createLinkTo(dir:'css',file:'converse.min.css')}" >
	<script src="${createLinkTo(dir:'js/', file:'converse.min.js')}"></script>
    <!-- Include default page title -->
    <title><g:layoutTitle default="Cimbidia" /></title>

    <!-- YUI -->
    <yui:stylesheet dir="reset-fonts-grids" file="reset-fonts-grids.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- Include Favicon -->
    <link rel="shortcut icon" href="${createLinkTo(dir:'images',file:'favicon.ico')}" type="image/x-icon" />

    <!-- Include Main CSS -->
    <link rel="stylesheet" href="${createLinkTo(dir:'js/jquery.megaMenu/',file:'jquery.megamenu.css')}" type="text/css" media="all" />
    <link rel="stylesheet" href="${createLinkTo(dir:'js/jquery.nailthumb',file:'jquery.nailthumb.1.1.css')}" type="text/css" media="all" />
    <link rel="stylesheet" href="${createLinkTo(dir:'js/chosen',file:'chosen.css')}" type="text/css" media="all" />
     <link rel="stylesheet" href="${createLinkTo(dir:'js/jquery.datetimepicker/',file:'jquery.datetimepicker.css')}" type="text/css" media="all" />
   
	<%--<link rel="stylesheet" href="${createLinkTo(dir:'css',file:'jquery.simple-dtpicker.css')}" type="text/css" media="all" />	
  
	
	 --%><%--<script src="${createLinkTo(dir:'js', file:'jquery.simple-dtpicker.js')}" type="text/javascript" ></script>
    --%><%--
    <link rel="stylesheet" href="${createLinkTo(dir:'js/feedback',file:'feedback.css')}" type="text/css" media="all" />
    --%>
 <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="${createLinkTo(dir:'jquery-ui-1.10.3.custom/js/', file:'jquery-ui-1.10.3.custom.js')}" type="text/javascript" ></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.0/jquery.cookie.js"></script>
     <script src="${createLinkTo(dir:'js/jquery.datetimepicker', file:'jquery.datetimepicker.js')}" type="text/javascript" ></script>
   
    <script src="http://code.jquery.com/jquery-migrate-1.1.0.js"></script>
    <!-- Include javascript files -->
<SCRIPT type="text/javascript">
    var Ajax;
if (Ajax && (Ajax != null)) {
	Ajax.Responders.register({
	  onCreate: function() {
        if($('spinner') && Ajax.activeRequestCount>0)
          Effect.Appear('spinner',{duration:0.5,queue:'end'});
	  },
	  onComplete: function() {
        if($('spinner') && Ajax.activeRequestCount==0)
          Effect.Fade('spinner',{duration:0.5,queue:'end'});
	  }
	});
}


function selectCombo(comboBoxElem, value) {
	if (comboBoxElem != null) {
		if (comboBoxElem.options) { 
			for (var i = 0; i < comboBoxElem.options.length; i++) {
	        	if (comboBoxElem.options[i].value == value &&
	                comboBoxElem.options[i].value != "") { //empty string is for "noSelection handling as "" == 0 in js
	                comboBoxElem.options[i].selected = true;
	                break
	        	}
			}
		}
	}
}			

</SCRIPT>

    <!-- Include jQuery UI files -->


    <!-- Include Jquery Validation and Jquery Validation UI plugins -->
    <jqval:resources />
    <jqvalui:resources />


<!--
    <link rel="stylesheet" href="${createLinkTo(dir:'css',file:'buttons.css')}" type="text/css" media="all" />
    -->

<!-- jquery validation messages -->
    <g:if test="${ session?.user?.locale && session?.user?.locale != 'en'}">
        <script src="${createLinkTo(dir:'js/jquery.validation/', file:'messages_'+ session?.user?.locale + '.js')}"  type="text/javascript" ></script>
    </g:if>
    <link rel="stylesheet" href="${createLinkTo(dir:'bootstrap3.0.2/css',file:'bootstrap-allsass.css')}" type="text/css" media="all" />


    <!-- Grails Layout : write head element for page-->
    <g:layoutHead />
 
    <!--link rel="stylesheet" href="${createLinkTo(dir:'bootstrap3.0.2/css',file:'bootstrap-theme.css')}" type="text/css" media="all" /-->
    <link rel="stylesheet" href="${createLinkTo(dir:'font-awesome-4.0.3/css',file:'font-awesome.css')}" type="text/css" media="all" />
    <link rel="stylesheet" href="${resource(dir:'css',file:'cimbidia.css')}" type="text/css" media="all" />
<style type="text/css"> .icon {background:none;} </style>
    

    <g:render template="/common/customCss"/>

    <ga:trackPageview />
    <r:layoutResources/>
</head>
<body class="yui-skin-sam">

<g:render template="/common/customVariables"/>

<div id="doc3">

<%--

<g:if test="${flash.message}">
    <div id="notify-container" style="display: hidden;">
        <div id="notify-message" class="message">${flash.message}</div>
    </div>
</g:if>
 --%>

    <g:if test="${session.useDebugLocale}">

        <div id="debug-header" class="notice box" style="margin-bottom: 0px;">
            You are in DEBUG mode.
            <g:link controller="localization" action="list" class="button icon log">Show all localizations</g:link>
            <g:link controller="localization" action="create" class="button icon add">Create new localization</g:link>
            <div class="right">
                <g:link controller="user" action="disableDebugMode">
                    <img src="${resource(dir: 'images/icons/silk', file: 'cross.png')}" class="middle"/>
                </g:link>
            </div>
            <div id="localizations">
            <!--
                        At some point we may want to display all translations for the page in a single div.
                        For the time being, flash.localizations is empty.
                     -->
                <g:each var="localization" in="${flash.localizations }">
                    <div>
                        ${localization.code } = ${localization.text }
                    </div>
                </g:each>
            </div>
        </div>
    </g:if>

<!-- Header "hd" includes includes logo, global navigation -->
    <g:if test="${session?.user && session?.warehouse}">
        <!--div>
            g:render template="/common/header"/>
        </div-->
        <div class="boostrap">
           <g:include controller="dashboard" action="megamenu" params="[locationId:session?.warehouse?.id,userId:session?.user?.id]"/>
         </div>
        <!--div class="boostrap">
           <g:render template="/common/breadcrumb"/>
        </div>

     <div>
     	<button href="#" id="normalize-button"/>
     </div-->
     
    <%--
    <div class="box center" style="margin:0;">
        <g:globalSearch id="globalSearch" cssClass="globalSearch" name="searchTerms"
                        jsonUrl="${request.contextPath }/json/globalSearch"></g:globalSearch>
    </div>
    --%>
    </g:if>


<!-- Body includes the divs for the main body content and left navigation menu -->
<div class="content-body" style="margin-top: 50px">
    <div id="bd" role="main" class="main drop-shadow"  >
        <div id="yui-main">
            <div id="content" class="yui-b">
                <g:layoutBody />
            </div>
        </div>
    </div>
</div>

    <g:if test="${session.useDebugLocale}">
        <g:render template="/common/localization"/>
    </g:if>


<!-- YUI "footer" block that includes footer information -->
<!-- Include other plugins -->
<script src="${createLinkTo(dir:'bootstrap3.0.2/js/', file:'bootstrap.js')}" type="text/javascript" ></script>


<script src="${createLinkTo(dir:'js/jquery.ui/js/', file:'jquery.ui.autocomplete.selectFirst.js')}" type="text/javascript" ></script>
<script src="${createLinkTo(dir:'js/jquery.cookies/', file:'jquery.cookies.2.2.0.min.js')}" type="text/javascript" ></script>
<script src="${createLinkTo(dir:'js/jquery.cookie/', file:'jquery.cookie.js')}" type="text/javascript" ></script>
<script src="${createLinkTo(dir:'js/jquery.tmpl/', file:'jquery.tmpl.js')}" type="text/javascript" ></script>
<script src="${createLinkTo(dir:'js/jquery.tmplPlus/', file:'jquery.tmplPlus.js')}" type="text/javascript" ></script>
<script src="${createLinkTo(dir:'js/jquery.livequery/', file:'jquery.livequery.min.js')}" type="text/javascript" ></script>
<script src="${createLinkTo(dir:'js/jquery.livesearch/', file:'jquery.livesearch.js')}" type="text/javascript" ></script>
<script src="${createLinkTo(dir:'js/jquery.hoverIntent/', file:'jquery.hoverIntent.minified.js')}" type="text/javascript" ></script>
<script src="${createLinkTo(dir:'js/knockout/', file:'knockout-2.2.0.js')}" type="text/javascript"></script>
<script src="${createLinkTo(dir:'js/', file:'knockout_binding.js')}" type="text/javascript"></script>
<script src="${createLinkTo(dir:'js/jquery.nailthumb', file:'jquery.nailthumb.1.1.js')}" type="text/javascript" ></script>



<g:if test="${System.getenv().get('headless') != 'false'}" env="test">
    <!--headless driver throw error when using watermark-->
</g:if>
<g:else>
    <script src="${createLinkTo(dir:'js/jquery.watermark/', file:'jquery.watermark.min.js')}" type="text/javascript" ></script>
</g:else>
<script src="${createLinkTo(dir:'js/', file:'global.js')}" type="text/javascript" ></script>
<script src="${createLinkTo(dir:'js/jquery.megaMenu/', file:'jquery.megamenu.js')}" type="text/javascript" ></script>
<script src="${createLinkTo(dir:'js/', file:'underscore-min.js')}" type="text/javascript" ></script>
<script src="${createLinkTo(dir:'js/chosen/', file:'chosen.jquery.js')}" type="text/javascript" ></script>
<script src="${createLinkTo(dir:'js/feedback/', file:'feedback.js')}" type="text/javascript" ></script>

<script type="text/javascript">




$(document).ready(function () {
    var cookieValue = $.cookie("cimbidiaSCM-main-fullscreen");
    //alert  ( cookieValue );
    if (cookieValue == "true" ) {
    	$.cookie("cimbidiaSCM-main-fullscreen", "true", { path: '/' });
        $('#navigation-header-box').hide();
        $('#normalize-button').fadeIn('slow');     
        $('#fullscreen-button').hide();
    } else {
    	$.removeCookie("cimbidiaSCM-main-fullscreen", { path: '/' });
        $('#navigation-header-box').fadeIn('slow');
        $('#fullscreen-button').fadeIn('slow');
        $('#normalize-button').hide();
    }

    $('#normalize-button').click(function () {
    	$.removeCookie("cimbidiaSCM-main-fullscreen", { path: '/' });
        $('#navigation-header-box').fadeIn('slow');
        $('#fullscreen-button').fadeIn('slow');
        $('#normalize-button').hide();

    });

    $('#fullscreen-button').click(function () {
    	$.cookie("cimbidiaSCM-main-fullscreen", "true", { path: '/' });
        $('#navigation-header-box').hide();
        $('#normalize-button').fadeIn('slow');     
        $('#fullscreen-button').hide();
    });
});

    <g:if test="${session.useDebugLocale}">
    // Define the localization
    if(typeof cimbidia === "undefined") cimbidia = {};
    if(typeof cimbidia.localization === "undefined") cimbidia.localization = {};
    cimbidia.localization.Localization = function(data) {
        console.log(data);
        var self = this;
        if(!data) data = {};
        self.id = ko.observable(data.id);
        self.code = ko.observable(data.code);
        self.locale = ko.observable(data.locale);
        self.text = ko.observable(data.text);
        self.translation = ko.observable(data.translation);
        //self.deleteUrl = ko.observable("${request.contextPath}/json/deleteLocalization?id=" + data.id);
        //self.resolvedText = ko.observablae(data.resolvedText);
        //self.lastUpdated = ko.observable(data.lastUpdated);
        //self.version = ko.observable(data.version);
    };
    </g:if>


    $(document).ready(function() {

        //Feedback({
        //    h2cPath: "${createLinkTo(dir:'js/html2canvas/', file:'html2canvas.js')}",
        //    url: '${createLink(controller: 'errors', action: 'sendFeedback')}',
        //    label: "Send feedback",
        //    header: "Send us your feedback!",
        //    messageSuccess: "Your issue has been submitted.  Thank you!",
        //    messageError: "Uh oh... something went wrong. Please try again."
        //});

        // Instantiate megamenu
        $(".megamenu").megamenu({'show_method':'simple', 'hide_method': 'simple'});
        $(".chzn-select").chosen();
        $(".chzn-select-deselect").chosen({allow_single_deselect:true});

        //$(".chzn-select").live('load',function(){
        //    $(this).chosen();
        //});
        //$(".chzn-select-deselect").live('load',function(){
        //    $(this).chosen({allow_single_deselect:true});
        //});

        <g:if test="${session.useDebugLocale}">
        // Initialize the localization dialog
        $("#localization-dialog").dialog({ autoOpen: false, modal: true, width: '600px' });


        // Instantiate a new localization object to be used
        var data = { id:"", code: "", text: "", translation: "" };
        var viewModel = new cimbidia.localization.Localization(data);
        ko.applyBindings(viewModel);

        // Delete localization event handler
        $("#delete-localization-btn").click(function() {
            event.preventDefault();
            console.log("delete localization");
            console.log($(this));
            console.log($(event));
            if (viewModel.id() == undefined) {
                alert("This translation is not currently saved to the database so it cannot be deleted.");
            }
            else {
                $.ajax({
                    url: "${request.contextPath}/json/deleteLocalization",
                    type: "get",
                    contentType: 'text/json',
                    dataType: "json",
                    data: {id: viewModel.id() },
                    success: function(data) {
                        alert("You have successfully deleted this localization.");
                        location.reload();
                    },
                    error: function(data) {
                        alert("An error occurred while deleting this translation.");
                    }
                });
            }

        });

        // Close dialog event handler
        $("#close-localization-dialog-btn").click(function() {
            event.preventDefault();
            $("#localization-dialog").dialog("close");
        });

        // Help event handler
        $("#help-localization-btn").click(function() {
            event.preventDefault();
            $.ajax({
                url: "${request.contextPath}/json/getTranslation",
                type: "get",
                contentType: 'text/json',
                dataType: "json",
                data: {text: viewModel.text, src: "en", dest: "fr"},
                success: function(data) {
                    //alert("success: " + data);
                    console.log(data);
                    viewModel.translation = data;
                    //ko.applyBindings(viewModel);
                },
                error: function(data) {
                    //console.log(data);
                    //alert("error");
                    viewModel.translation = "Error. Try again.";
                    //ko.applyBindings(viewModel);
                }
            });
        });

        // Save event handler
        $("#save-localization-btn").click(function() {
            event.preventDefault();
            var jsonData = ko.toJSON(viewModel);
            console.log("save localization");
            console.log(jsonData);

            $.ajax({
                url: "${request.contextPath}/json/saveLocalization",
                type: "post",
                contentType: 'text/json',
                dataType: "json",
                data: jsonData,
                success: function(data) {
                    //alert("success");
                    $("#localization-dialog").dialog("close");
                    location.reload();
                },
                error: function(data) {
                    //alert("fail");
                    $("#localization-dialog").dialog("close");
                    location.reload();
                }
            });
        });

        // Open dialog event handler
        $(".open-localization-dialog").click(function() {
            var id = $(this).attr("data-id");
            var code = $(this).attr("data-code");
            var resolvedMessage = $(this).attr("data-resolved-message");
            console.log("Get localization");
            console.log(id);
            console.log(code);
            var url = "${request.contextPath}/json/getLocalization";
            $.getJSON( url, { id: id, code: code, resolvedMessage: resolvedMessage },
                    function (data, status, jqxhr) {
                        console.log("getJSON response: ");
                        console.log(data);
                        viewModel.id(data.id);
                        viewModel.code(data.code);
                        viewModel.text(data.text);
                        viewModel.locale(data.locale);
                        viewModel.translation(data.translation);
                    }
            );

            $("#localization-dialog").dialog('open');
            event.preventDefault();
        });
        </g:if>

        $(".warehouse-switch").click(function() {
            //$("#warehouse-menu").toggle();
            $("#warehouseMenu").dialog({
                autoOpen: true,
                modal: true,
                width: 800,
                height: 500
            });
        });


        function showActions() {
            //$(this).children(".actions").show();
        }

        function hideActions() {
            $(this).children(".actions").hide();
        }

        // This is used to remove the action menu when the 
        $(".action-menu").hoverIntent({
            sensitivity: 1, // number = sensitivity threshold (must be 1 or higher)
            interval: 5,   // number = milliseconds for onMouseOver polling interval
            over: showActions,     // function = onMouseOver callback (required)
            timeout: 100,   // number = milliseconds delay before onMouseOut
            out: hideActions       // function = onMouseOut callback (required)
        });

        // Create an action button that toggles the action menu on click
        //button({ text: false, icons: {primary:'ui-icon-gear',secondary:'ui-icon-triangle-1-s'} }).

        $(".action-btn").on('click', function(event) {
            //show the menu directly over the placeholder
            var actions = $(this).parent().children(".actions");

            // Need to toggle before setting the position
            actions.toggle();

            // Set the position for the actions menu
            actions.position({
                my: "left top",
                at: "left bottom",
                of: $(this).closest(".action-btn"),
                //offset: "0 0"
                collision: "flip"
            });

            // To prevent the action button from POST'ing to the server
            event.preventDefault();
        });

        $(".action-menu-item").click(function(event) {
            var actions = $(this).parent().children(".actions");

            // Need to toggle before setting the position
            actions.toggle();
        });

        $(".action-hover-btn").click(function(event) {
            //show the menu directly over the placeholder
            var actions = $(this).parent().children(".actions");

            // Need to toggle before setting the position
            actions.toggle();

            // Set the position for the actions menu
            actions.position({
                my: "right top",
                at: "right bottom",
                of: $(this).closest(".action-hover-btn"),
                //offset: "0 0"
                collision: "flip"
            });

            // To prevent the action button from POST'ing to the server
            event.preventDefault();
        });

    });
</script>
<script type="text/javascript">
    var monthNames = [];
    var monthNamesShort = [];
    <g:each in="${1..12}" var="monthNum">
    monthNames[${monthNum-1}] = '<warehouse:message code="month.${monthNum}.label"/>';
    monthNamesShort[${monthNum-1}] = '<warehouse:message code="month.short.${monthNum}.label"/>';
    </g:each>
</script>
<r:layoutResources/>

</body>
<script>
require(['converse'], function (converse) {
    converse.initialize({
        auto_list_rooms: true,
        auto_subscribe: true,
        bosh_service_url: 'http://localhost:8080', // Please use this connection manager only for testing purposes
        hide_muc_server: false,
        i18n: locales.en, // Refer to ./locale/locales.js to see which locales are supported
        prebind: false,
        show_controlbox_by_default: true,
        xhr_user_search: true
    });
});
</script>
</html>
