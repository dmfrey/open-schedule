<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<spring:url value="/public/${ event.shortName }" var="back_url" />

<article>
	<aside class="updateFormLinks">
		<p>
			<a href="${ back_url }">Back</a>
		</p>
	</aside>
</article>

<c:if test="${ empty notifications }">
<article>
	<p>There are no notifications to display.</p>
</article>
</c:if>

<c:if test="${ ! empty notifications }">
<article>
	<table>
		<tr>
			<th width="30%">Title</th>
			<th width="50%">Message</th>
			<th width="10%"></th>
			<th width="10%"></th>
		</tr>
		<c:forEach items="${ notifications }" var="notification">
		<tr>
			<td>${ notification.title }</td>
			<td>${ notification.message }</td>
			<td></td>
			<td>
				<spring:url value="/public/${ event.shortName }/notifications/${ notification.id }" var="show_url" />
				<a href="${ show_url }">Show</a>
			</td>
		</tr>
		</c:forEach>
	</table>

</article>
</c:if>

<article>
	<aside class="updateFormLinks">
		<p>
			<a href="${ back_url }">Back</a>
		</p>
	</aside>
</article>
