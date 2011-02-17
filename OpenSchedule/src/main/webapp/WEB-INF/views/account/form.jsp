<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<header>
	<h3>Your Account</h3>
</header>

<article>
	<form:form id="accountForm" commandName="userAccount" method="PUT">
		<spring:bind path="id">
			<input type="hidden" name="${ status.expression }" value="${ status.value }" />
		</spring:bind>
		<fieldset>
			<legend>Update your account</legend>
			<ul>
				<li>
					<label for="username">Username:</label>
					<spring:bind path="username">
					${ status.value }
					<input type="hidden" id="${ status.expression }" name="${ status.expression }" value="${ status.value }" />
					</spring:bind>
				</li>
				<li>
					<label for="password">Password:</label>
					<spring:bind path="password">
					<input type="password" id="${ status.expression }" name="${ status.expression }" value="${ status.value }" autofocus="true" placeholder="Password" />
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

<script type="text/javascript">
$( function() {
	
	if( !hasPlaceholderSupport() ) {
		$( "#accountForm" ).placeholder();
		//END placeholder_fallback
		
		$( 'input[autofocus=true]' ).focus();
	};

});
</script>