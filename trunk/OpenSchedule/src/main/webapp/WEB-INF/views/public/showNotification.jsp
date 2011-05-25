<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<spring:url value="/public/${ event.shortName }/notifications" var="back_url" />
<article>

	<aside class="updateFormLinks">
		<a href="${ back_url }">Back</a>
	</aside>
	
		<fieldset>
			<legend>View Notification</legend>
			<ul>
				<li>
					<label for="title">Title:</label>
					${ notification.title }
				</li>
				<li>
					<label for="message">Message:</label>
					${ notification.message }
				</li>
			</ul>
		</fieldset>

	<aside class="updateFormLinks">
		<a href="${ back_url }" data-article="${ returnArticle }">Back</a>
	</aside>
	
</article>