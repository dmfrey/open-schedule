<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="view viewSpeakers">
	<header>
		<span>
			<spring:url value="/public/${ event.shortName }" var="public_url" />
			<a href="${ public_url }">Back</a>
		</span>
		
		<h1>Speakers for ${ event.name }</h1>
	</header>

	<table>
		<tr>
			<th>Name</th>
			<th>Email</th>
			<th>Web Site</th>
		</tr>
		<c:forEach items="${ event.speakers }" var="speaker">
		<tr>
			<td>${ speaker.name }</td>
			<td>
				<c:if test="${ ! empty speaker.email }">
				<a href="mailto:${ speaker.email }">Email</a>
				</c:if>
			</td>
			<td>
				<c:if test="${ ! empty speaker.webSite }">
				<a href="${ speaker.webSite }" class="webSitePopup">Web Site</a>
				</c:if>
			</td>
		</tr>
		<tr>
			<th>Bio:</th>
			<td colspan="2">${ speaker.bio }</td>
		</tr>
		</c:forEach>
	</table>

</div>