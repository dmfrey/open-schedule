<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="view viewSessions">
	<header>
		<span>
			<spring:url value="/public/${ event.shortName }" var="public_url" />
			<a href="${ public_url }">Back</a>
		</span>
		
		<h1>Sessions for ${ event.name }</h1>
	</header>

	<table>
		<tr>
			<th>Name</th>
			<th>Speakers</th>
		</tr>
		<c:forEach items="${ event.sessions }" var="session">
		<tr>
			<td>${ session.name }</td>
			<td>
				<c:if test="${ ! empty session.speakers }">
					<c:forEach items="${ session.speakers }" var="speaker">
						${ speaker.name }<br />
					</c:forEach>
				</c:if>
			</td>
		</tr>
		<tr>
			<th>Description:</th>
			<td>${ session.description }</td>
		</tr>
		</c:forEach>
	</table>

</div>