<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class="create createComment">
	<header>
		<span>
			<spring:url value="/public/${ shortName }/comments" var="back_url" />
			<a href="${ back_url }">Back</a>
		</span>
		
		<h1> Create Comment for Event</h1>
	</header>

	<form:form commandName="eventComment">
		<fieldset>
			<legend>New Comment</legend>
			<ul>
				<li>
					<label for="name">Name: (optional)</label>
					<form:input path="name" />
				</li>
				<li>
					<label for="email">Email: (optional)</label>
					<form:input path="email" />
				</li>
				<li>
					<label for="comment">Comment:</label>
					<form:textarea path="comment" rows="5" cols="20" />
				</li>
				<li>
					<input type="submit" value="Create" />
				</li>
			</ul>
		</fieldset>
	</form:form>
	
</div>