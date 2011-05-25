<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<c:set var="returnArticle" value="labels" />

<spring:url value="/events/${ event.id }?form" var="back_url" />
<article>

	<aside class="updateFormLinks">
		<a href="${ back_url }" data-article="${ returnArticle }">Back</a>
	</aside>
	
	<form:form commandName="label" method="post">
		<form:hidden path="id" />
		<form:hidden path="version" />
		<fieldset>
			<legend>Create Timeslot Label</legend>
			<ul>
				<li>
					<label for="labelName">Name:</label>
					<spring:bind path="name">
						<input id="labelName" type="text" name="${ status.expression }" value="${ status.value }" size="10" maxlength="10" placeholder="Name" />
						<span class="errors">
							<c:forEach items="${ status.errorMessages }" var="message">
								${ message }<br />
							</c:forEach>
						</span>
					</spring:bind>
				</li>
				<li>
					<input type="submit" value="Create" data-article="${ returnArticle }" />
				</li>
			</ul>
		</fieldset>
	</form:form>
	
	<aside class="updateFormLinks">
		<a href="${ back_url }" data-article="${ returnArticle }">Back</a>
	</aside>
	
</article>
