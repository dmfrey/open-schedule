<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<spring:url value="/events/${ event.id }/notifications" var="back_url" />
<article>

	<aside class="updateFormLinks">
		<a href="${ back_url }">Back</a>
	</aside>
	
		<fieldset>
			<legend>View Notification</legend>
			<ul>
				<li>
					<label for="statusTitle">Status Title:</label>
					${ notification.statusTitle }
				</li>
				<li>
					<label for="statusMessage">Status Message:</label>
					${ notification.statusMessage }
				</li>
				<li>
					<label for="title">Title:</label>
					${ notification.title }
				</li>
				<li>
					<label for="message">Message:</label>
					${ notification.message }
				</li>
				<li>
					<label for="duration">Duration</label>
					${ notification.duration }
				</li>
				<li>
					<label>Active:</label>
					<c:choose>
						<c:when test="${ notification.active == true }">Yes</c:when>
						<c:otherwise>No</c:otherwise>
					</c:choose>
				</li>
			</ul>
		</fieldset>

	<aside class="updateFormLinks">
		<a href="${ back_url }" data-article="${ returnArticle }">Back</a>
	</aside>
	
</article>