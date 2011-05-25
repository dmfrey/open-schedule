<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<spring:url value="/events?form" var="create_url" />
<article>
	<p>
		<a href="${ create_url }"> + Create Event</a>
	</p>
</article>

<c:if test="${ empty events }">
<article>
	<p>You have no events to display.</p>
</article>
</c:if>

<c:if test="${ ! empty events }">
<article>
	<table>
		<tr>
			<th width="30%">Name</th>
			<th width="15%">Start Date</th>
			<th width="10%">Days</th>
			<th width="15%">Publish Date</th>
			<th width="10%"></th>
			<th width="10%"></th>
			<th width="10%"></th>
		</tr>
		<c:forEach items="${ events }" var="event">
		<tr>
			<td>${ event.name }</td>
			<td>
				<fmt:formatDate value="${ event.startDate }" type="date" pattern="yyyy-MM-dd" />
			</td>
			<td>${ event.numberOfDays }</td>
			<td>
				<fmt:formatDate value="${ event.publishDate }" type="date" pattern="yyyy-MM-dd" />
			</td>
			<td>
				<spring:url value="/events/${ event.id }" var="event_url" />
				<a href="${ event_url }?page=${ page }&size=${ size }">Show</a>
			</td>
			<td>
				<a href="${ event_url }?form">Edit</a>
			</td>
			<td>
				<form action="${ event_url }" method="DELETE">
					<input type="hidden" name="page" value="${ page }" />
					<input type="hidden" name="size" value="${ size }" />
					<input type="submit" value="Delete" />
				</form>
			</td>
		</tr>
		</c:forEach>
		<tr>
			<td colspan="7">
    			<c:if test="${ empty page || page lt 1 }">
      				<c:set var="page" value="1" />
    			</c:if>

    			<c:if test="${ empty size || size lt 1 }">
      				<c:set var="size" value="10" />
    			</c:if>

    			<spring:message code="list_size" var="list_size" />
    			<c:out value="${ list_size } " />

    			<c:forEach var="i" begin="5" end="25" step="5">
      				<c:choose>
        				<c:when test="${ size == i }">
          					<c:out value="${ i }" />
        				</c:when>
        				<c:otherwise>
          					<spring:url value="" var="sizeUrl">
            					<spring:param name="page" value="1" />
            					<spring:param name="size" value="${ i }" />
          					</spring:url>
          					<a href="${ sizeUrl }">${ i }</a>
        				</c:otherwise>
      				</c:choose>
      				<c:out value=" " />
    			</c:forEach>
    			<c:out value="| " />

    			<c:if test="${ page ne 1 }">
      				<spring:url value="" var="first">
        				<spring:param name="page" value="1" />
        				<spring:param name="size" value="${ size }" />
      				</spring:url>
      				<spring:url value="/resources/images/resultset_first.png" var="first_image_url" />
      				<spring:message code="list_first" var="first_label" />
      				<a class="image" href="${ first }" title="${ first_label }">
        				<img alt="${ first_label }" src="${ first_image_url }" />
      				</a>
			    </c:if>
    			<c:if test="${ page gt 1 }">
      				<spring:url value="" var="previous">
        				<spring:param name="page" value="${ page - 1 }" />
        				<spring:param name="size" value="${ size }" />
      				</spring:url>
      				<spring:url value="/resources/images/resultset_previous.png" var="previous_image_url" />
      				<spring:message code="list_previous" var="previous_label" />
      				<a class="image" href="${ previous }" title="${ previous_label }">
        				<img alt="${ previous_label }" src="${ previous_image_url }" />
      				</a>
    			</c:if>
    			<c:out value=" " />
    			<spring:message code="list_page" arguments="${ page },${ maxPages }" argumentSeparator="," />
    			<c:out value=" " />
    			<c:if test="${ page lt maxPages }">
      				<spring:url value="" var="next">
        				<spring:param name="page" value="${ page + 1 }" />
        				<spring:param name="size" value="${ size }" />
      				</spring:url>
      				<spring:url value="/resources/images/resultset_next.png" var="next_image_url" />
      				<spring:message code="list_next" var="next_label" />
      				<a class="image" href="${ next }" title="${ next_label }">
        				<img alt="${ next_label }" src="${ next_image_url }" />
      				</a>
    			</c:if>
    			<c:if test="${ page ne maxPages }">
      				<spring:url value="" var="last">
        				<spring:param name="page" value="${ maxPages }" />
        				<spring:param name="size" value="${ size }" />
      				</spring:url>
      				<spring:url value="/resources/images/resultset_last.png" var="last_image_url" />
			        <spring:message code="list_last" var="last_label" />
      				<a class="image" href="${ last }" title="${ last_label }">
				        <img alt="${ last_label }" src="${ last_image_url }" />
      				</a>
			    </c:if>
			</td>
		</tr>
	</table>
</article>
</c:if>

<article>
	<p>
		<a href="${ create_url }"> + Create Event</a>
	</p>
</article>
