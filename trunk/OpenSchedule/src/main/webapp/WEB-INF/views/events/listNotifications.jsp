<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<spring:url value="/events/${ event.id }?form" var="back_url" />

<spring:url value="/events/${ event.id }/notifications?form" var="create_url" />

<aside class="updateFormLinks">
	<p>
		<a href="${ back_url }">Back</a>
	</p>

	<p>
		<a href="${ create_url }"> + Create Notification</a>
	</p>
</aside>

<c:if test="${ empty event.notifications }">
<article>
	<p>You have no notifications to display.</p>
</article>
</c:if>

<c:if test="${ ! empty event.notifications }">
<article>
	<table>
		<tr>
			<th width="30%">Title</th>
			<th width="15%">Create Date</th>
			<th width="10%">Duration</th>
			<th width="15%">Active</th>
			<th width="10%"></th>
			<th width="10%"></th>
			<th width="10%"></th>
		</tr>
		<c:forEach items="${ event.notifications }" var="notification">
		<tr>
			<td>${ notification.title }</td>
			<td>
				<fmt:formatDate value="${ notification.created }" type="date" pattern="yyyy-MM-dd" />
			</td>
			<td>${ notification.duration }</td>
			<td>
				<c:choose>
					<c:when test="${ notification.active == true }">Yes</c:when>
					<c:otherwise>No</c:otherwise>
				</c:choose>
			</td>
			<td>
				<spring:url value="/events/${ event.id }/notifications/${ notification.id }" var="show_url" />
				<a href="${ show_url }">Show</a>
			</td>
			<td>
				<a href="${ show_url }?form">Edit</a>
			</td>
			<td>
				<form action="${ show_url }" method="POST">
					<input type="hidden" name="_method" value="DELETE" />
					<input type="submit" value="Delete" />
				</form>
			</td>
		</tr>
		</c:forEach>
	</table>
</article>
</c:if>

<aside class="updateFormLinks">
	<p>
		<a href="${ create_url }"> + Create Notification</a>
	</p>

	<p>
		<a href="${ back_url }">Back</a>
	</p>
</aside>
