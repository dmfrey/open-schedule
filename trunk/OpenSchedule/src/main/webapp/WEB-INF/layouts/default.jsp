<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html>
<html>

    <head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=8" />	
    
		<spring:url value="/resources/styles/blitzer/jquery-ui-1.8.6.custom.css" var="jqueryui_css_url" />
  		<link rel="stylesheet" type="text/css" media="screen" href="${ jqueryui_css_url }">
		<spring:url value="/resources/styles/jquery-ui-timepicker-addon.css" var="jqueryui_timepicker_css_url" />
  		<link rel="stylesheet" type="text/css" media="screen" href="${ jqueryui_timepicker_css_url }">
		<spring:url value="/resources/styles/jquery.tooltip.css" var="jqueryui_tooltip_css_url" />
  		<link rel="stylesheet" type="text/css" media="screen" href="${ jqueryui_tooltip_css_url }">

		<spring:url value="/resources/styles/validate.css" var="validate_css_url" />
  		<link rel="stylesheet" type="text/css" media="screen" href="${ validate_css_url }">

		<spring:url value="/resources/styles/openid.css" var="openid_css_url" />
  		<link rel="stylesheet" type="text/css" media="screen" href="${ openid_css_url }">

		<spring:url value="/resources/styles/reset.css" var="reset_css_url" />
  		<link rel="stylesheet" type="text/css" media="screen" href="${ reset_css_url }">
  		<spring:url value="/resources/styles/style.css" var="style_css_url" />
  		<link rel="stylesheet" type="text/css" media="screen" href="${ style_css_url }">
  		<spring:url value="/resources/styles/form.css" var="form_css_url" />
  		<link rel="stylesheet" type="text/css" media="screen" href="${ form_css_url }">
  		<spring:url value="/resources/styles/tabs.css" var="tabs_css_url" />
  		<link rel="stylesheet" type="text/css" media="screen" href="${ tabs_css_url }">

		<spring:url value="/resources/images/favicon.ico" var="favicon" />
		<link rel="SHORTCUT ICON" href="${favicon}" />
		
		<spring:message code="application_name" var="app_name"/>
		<title><spring:message code="welcome_h3" arguments="${ app_name }" /></title>

  		<!-- Get the user local from the page context (it was set by Spring MVC's locale resolver) -->
  		<c:set var="userLocale">
    		<c:out value="${ pageContext.response.locale }" default="en" />
  		</c:set>
  		
		<spring:url value="/resources/scripts/jquery-1.4.3.min.js" var="jquery_js_url" />
  		<script type="text/javascript" src="${ jquery_js_url }"></script>
		<spring:url value="/resources/scripts/jquery-ui-1.8.6.custom.min.js" var="jqueryui_js_url" />
  		<script type="text/javascript" src="${ jqueryui_js_url }"></script>
		<spring:url value="/resources/scripts/jquery-ui-timepicker-addon.js" var="jqueryui_timepicker_js_url" />
  		<script type="text/javascript" src="${ jqueryui_timepicker_js_url }"></script>
		<spring:url value="/resources/scripts/jquery.validate.min.js" var="jquery_validate_js_url" />
  		<script type="text/javascript" src="${ jquery_validate_js_url }"></script>
		<spring:url value="/resources/scripts/jquery.tooltip.min.js" var="jquery_tooltip_js_url" />
  		<script type="text/javascript" src="${ jquery_tooltip_js_url }"></script>
  		
		<spring:url value="/resources/scripts/functions.js" var="functions_js_url" />
  		<script type="text/javascript" src="${ functions_js_url }"></script>

		<spring:url value="/resources/scripts/script.js" var="script_js_url" />
  		<script type="text/javascript" src="${ script_js_url }"></script>

		<spring:url value="/resources/scripts/validate.js" var="validate_js_url" />
  		<script type="text/javascript" src="${ validate_js_url }"></script>

		<spring:url value="/resources/scripts/openid-jquery.js" var="openid_jquery_js_url" />
  		<script type="text/javascript" src="${ openid_jquery_js_url }"></script>

		<spring:url value="/resources/scripts/openid-jquery-en.js" var="openid_jquery_en_js_url" />
  		<script type="text/javascript" src="${ openid_jquery_en_js_url }"></script>

		<spring:url value="/resources/scripts/plugins.js" var="plugins_js_url" />
  		<script type="text/javascript" src="${ plugins_js_url }"></script>

		<!--[if lt IE 9]>
		<script type="text/javascript" >
			document.createElement( "nav" );
			document.createElement( "header" );
			document.createElement( "footer" );
			document.createElement( "section" );
			document.createElement( "aside" );
			document.createElement( "article" );
		</script>
		<![endif]-->

    </head>

	<body>
	
    	<tiles:insertAttribute name="header" ignore="true" />

	    <tiles:insertAttribute name="menu" ignore="true" />   

		<section id="content">
   			<tiles:insertAttribute name="body"/> 
		</section>
    	
    	<tiles:insertAttribute name="footer" ignore="true"/>

	</body>

</html>