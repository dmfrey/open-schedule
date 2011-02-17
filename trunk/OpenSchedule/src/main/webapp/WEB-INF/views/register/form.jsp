<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<spring:message code="security_register_title" var="title" />
<h1>${ title }</h1>
<p class="error">
  	<spring:message code="security_login_message" />
</p>

<article>
	<spring:url var="login" value="/events/list/user" />
	Already have an account? Please <a href="${ login }">Login</a>.
</article>

<div id="tabs">

	<ul class="tab-bar">
		<li><a href="#tab-1">Register</a></li>
		<li>
			<spring:url var="openIdIcon" value="/resources/images.small/openid.ico.gif" />
			<a href="#tab-2">OpenID</a>
		</li>
	</ul>

	<article id="tab-1">
		<form:form id="registerForm" commandName="userAccount" method="PUT">
			<fieldset>
				<legend>Create an account</legend>
				<ul>
					<li>
						<label for="username">Username:</label>
						<spring:bind path="username">
						<input type="text" id="${ status.expression }" name="${ status.expression }" value="${ status.value }" autofocus="true" placeholder="Username" />
						<label for="username" class="errors">
							<c:if test="${ status.error != 'false' }">
							${ status.error }
							</c:if>
						</label>
						</spring:bind>
					</li>
					<li>
						<label for="password">Password:</label>
						<spring:bind path="password">
						<input type="password" id="${ status.expression }" name="${ status.expression }" value="${ status.value }" placeholder="Password" />
						<label for="password" class="errors">
							<c:if test="${ status.error != 'false' }">
							${ status.error }
							</c:if>
						</label>
						</spring:bind>
					</li>
					<li>
						<label for="name">Name:</label>
						<spring:bind path="name">
						<input type="text" id="${ status.expression }" name="${ status.expression }" value="${ status.value }" placeholder="Name" />
						<label for="name" class="errors">
							<c:if test="${ status.error != 'false' }">
							${ status.error }
							</c:if>
						</label>
						</spring:bind>
					</li>
					<li>
						<label for="email">Email:</label>
						<spring:bind path="email">
						<input type="email" id="${ status.expression }" name="${ status.expression }" value="${ status.value }" placeholder="user@email.com" />
						<label for="email" class="errors">
							<c:if test="${ status.error != 'false' }">
							${ status.error }
							</c:if>
						</label>
						</spring:bind>
					</li>
					<li>
	    	   			<spring:message code="button_submit" var="submit_label" />
    	   				<input id="proceed" type="submit" value="${ fn:escapeXml( submit_label ) }" />
					</li>
				</ul>
			</fieldset>
		</form:form>
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

<script type="text/javascript">
$( function() {
	
	if( !hasPlaceholderSupport() ) {
		$( "#registerForm" ).placeholder();
		//END placeholder_fallback
		
		$( 'input[autofocus=true]' ).focus();
	};

});
</script>