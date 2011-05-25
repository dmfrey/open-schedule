<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<c:set var="returnArticle" value="venues" />

<spring:url value="/events/${ eventId }?form" var="back_url" />
<article>

	<aside class="updateFormLinks">
		<a href="${ back_url }" data-article="${ returnArticle }">Back</a>
	</aside>
	
	<form:form commandName="room" method="put">
		<form:hidden path="id" />
		<form:hidden path="version" />
		<fieldset>
			<legend>Update Room</legend>
			<ul>
				<li>
					<label for="roomName">Name:</label>
					<spring:bind path="name">
						<input id="roomName" type="text" name="${ status.expression }" value="${ status.value }" size="20" maxlength="255" placeholder="Name" />
						<span class="errors">
							<c:forEach items="${ status.errorMessages }" var="message">
								${ message }<br />
							</c:forEach>
						</span>
					</spring:bind>
				</li>
				<li>
					<input type="submit" value="Update" data-article="${ returnArticle }" />
				</li>
			</ul>
		</fieldset>
	</form:form>

	<aside class="updateFormLinks">
		<a href="${ back_url }" data-article="${ returnArticle }">Back</a>
	</aside>
	
</article>
