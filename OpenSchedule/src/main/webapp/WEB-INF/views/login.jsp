<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<spring:message code="security_login_title" var="title" />
<h1>${ title }</h1>

<c:if test="${ not empty param.login_error }">
    <article class="errors">
        <p>
          <spring:message code="security_login_unsuccessful" />
          ${ SPRING_SECURITY_LAST_EXCEPTION.message }
          .
        </p>
    </article>
</c:if>

<c:if test="${ empty param.login_error }">
    <article>
    	<p class="error">
        	<spring:message code="security_login_message" />
    	</p>
    </article>
</c:if>

<article>
	<spring:url var="register" value="/register" />
	Don't have an account? Please <a href="${ register }">Register</a>.
</article>

<div id="tabs">

	<ul class="tab-bar">
		<li><a href="#tab-1">Login</a></li>
		<li>
			<spring:url var="openIdIcon" value="/resources/images.small/openid.ico.gif" />
			<a href="#tab-2">OpenID</a>
		</li>
	</ul>

	<article id="tab-1">
		<spring:url value="/resources/j_spring_security_check" var="form_url" />
		<form name="loginForm" action="${ fn:escapeXml( form_url ) }" method="POST">
    		<fieldset>
    			<legend><spring:message code="security_login_title" /></legend>
		    	<ul>
    				<li>
		        		<label for="j_username">
        					<spring:message code="security_login_form_name" />
		        		</label>
        				<input id="j_username" type="text" name="j_username" autofocus="true" placeholder="Username" />
		    		</li>
					<li>
		        		<label for="j_password">
		        			<spring:message code="security_login_form_password" />
        				</label>
		        		<input id="j_password" type="password" name="j_password" placeholder="Password" />
					</li>
					<li>
	    			   	<spring:message code="button_submit" var="submit_label" />
    	   				<input id="proceed" type="submit" value="${ fn:escapeXml( submit_label ) }" />
					</li>
    			</ul>
    		</fieldset>
		</form>
	</article>

	<article id="tab-2">
		<form id="openid_form" action="j_spring_openid_security_check" method="get">
			<input type="hidden" name="action" value="verify" />

			<fieldset>
    			<legend>Sign-in or Create New Account</legend>
    		
    			<div id="openid_choice">
	    			<p>Please click your account provider:</p>
	    			<div id="openid_btns"></div>
				</div>
			
				<div id="openid_input_area">
					<input id="openid_identifier" name="openid_identifier" type="text" value="http://" />
					<input id="openid_submit" type="submit" value="Sign-In"/>
				</div>
				<noscript>
					<p>
						OpenID is service that allows you to log-on to many different websites using a single indentity.
						Find out <a href="http://openid.net/what/">more about OpenID</a> and <a href="http://openid.net/get/">how to get an OpenID enabled account</a>.
					</p>
				</noscript>
			</fieldset>
		</form>
	</article>
	
</div>
