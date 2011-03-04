<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<h1>Already Registered</h1>

<p>
	Your account is already registered.
</p>

<p>
	<spring:url var="login" value="/login" />
	Return to <a href="${ login }">Login.</a>
</p>