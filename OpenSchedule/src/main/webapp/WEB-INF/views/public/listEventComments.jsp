<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="view viewComments">
	<header>
		<span>
			<spring:url value="/public/${ event.shortName }" var="public_url" />
			<a href="${ public_url }">Back</a>
		</span>
		
		<h1>Comments for ${ event.name }</h1>
	</header>

	<c:if test="${ canAddComments }">
	<span>
		<spring:url value="/public/${ event.shortName }/comments?form=true" var="create_event_comment_url" />
		<a href="${ create_event_comment_url }">Add Comment</a>
	</span>
	</c:if>
	
	<table>
		<tr>
			<th>Comment</th>
			<th>Name</th>
		</tr>
		<c:forEach items="${ event.comments }" var="comment">
		<tr>
			<td>${ comment.comment }</td>
			<td>${ comment.name }</td>
		</tr>
		</c:forEach>
	</table>
	
	<c:if test="${ canAddComments }">
	<span>
		<a href="${ create_event_comment_url }">Add Comment</a>
	</span>
	</c:if>
	
</div>