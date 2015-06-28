
<%@ page import="ajaxapp.Student" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'student.label', default: 'Student')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<a href="#list-student" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div id="list-student" style="margin-left: 20%" class="content scaffold-list" role="main">
    <h1>AJAX PAGE</h1>
</br>
</br>
</br>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    This is a fixed content
</br>
</br>
</br>


    <div id="ajax">

    </div>
    <g:remoteLink class="link" action="java" update="ajax" before="animatediv()">Fetch Java</g:remoteLink>
    <g:remoteLink class="link" action="groovy"  update="ajax" before="animatediv()"> Load Groovy</g:remoteLink   >
</div>
<script>
    $(document).on("click",".link",function(){
        var href = $(this).attr( "href" );
        console.debug("state pushed....")
        // Push this URL "state" onto the history hash.
        window.location.hash = href
        console.debug(href)

        // Prevent the default click behavior.
        return false;
    });

    //    $(window).bind( 'hashchange', function(e) { window.location.reload()});

    $(window).bind( 'hashchange', function(e) {
        console.debug("hash change event called.....")
        var urlForAjaxCall = window.location.href;

        if(urlForAjaxCall.indexOf('#') != -1){
            var getSubString = urlForAjaxCall.substring(urlForAjaxCall.indexOf('#')+1, urlForAjaxCall.length)
            console.debug(getSubString)
            var stringArray = getSubString.split("/")
            var locationName = stringArray[3]
            console.debug(locationName);
            if(locationName == "java"){
                <g:remoteFunction  class="link" action="java" update="ajax" />
            }else if(locationName == "groovy"){
                <g:remoteFunction  class="link" action="groovy" update="ajax" />
            }
        }else{
            $('#ajax').html("");
        }
    });
        $(function(){

     // Since the event is only triggered when the hash changes, we need
     // to trigger the event now, to handle the hash the page may have
     // loaded with.

     $(window).trigger( "hashchange" );
     });
    function animatediv(){
        $("#ajax").hide();
        $("#ajax").fadeIn("slow");
    }
</script>
</body>
</html>
