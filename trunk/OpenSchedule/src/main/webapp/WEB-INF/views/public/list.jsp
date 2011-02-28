<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<c:if test="${ empty events }">
<article>
	There are no events to display.
</article>
</c:if>

<c:if test="${ ! empty events }">
<article class="published">
	
	<h1>Published Events</h1>

	<table>
		<tr>
			<th>Event Name</th>
			<th>Short Name</th>
			<th>Start Date</th>
			<th>End Date</th>
			<th>Days</th>
		</tr>
		<c:forEach items="${ events }" var="event" varStatus="loop">
		<tr>
			<td>${ event.name }</td>
			<td>
				<spring:url value="/public/${ event.shortName }" var="public_link" />
				<a href="${ public_link }">${ event.shortName }</a>
			</td>
			<td>
				<fmt:formatDate value="${ event.startDate }" type="date" pattern="yyyy-MM-dd" />
			</td>
			<td>
				<fmt:formatDate value="${ event.endDate }" type="date" pattern="yyyy-MM-dd" />
			</td>
			<td>${ event.numberOfDays }</td>
		</tr>
		</c:forEach>
	</table>

</article>
</c:if>

<footer>
	<spring:url value="/index" var="home_url" />
	<a href="${ home_url }">Return to OpenSchedule</a>
</footer>
