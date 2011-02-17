<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<c:set var="returnArticle" value="tracks" />

<spring:url value="/events/${ eventId }?form" var="back_url" />
<article>

	<aside class="updateFormLinks">
		<a href="${ back_url }" data-article="${ returnArticle }">Back</a>
	</aside>
	
	<form:form commandName="track" method="put">
		<form:hidden path="id" />
		<form:hidden path="version" />
		<fieldset>
			<legend>Update Track</legend>
			<table width="100%">
				<tr>
					<td width="33%">
						<label for="trackName">Name:</label>
						<spring:bind path="name">
							<input id="trackName" type="text" name="${ status.expression }" value="${ status.value }" size="20" maxlength="255" placeholder="Name" />
							<span class="errors">
								<c:forEach items="${ status.errorMessages }" var="message">
									${ message }<br />
								</c:forEach>
							</span>
						</spring:bind>
					</td>
					<td width="33%">
						<label for="room">Room:</label><br />
						<form:select path="room">
							<form:option value="" label="" />
							<c:forEach items="${ event.venues }" var="venue">
								<form:options items="${ venue.rooms }" itemValue="id" itemLabel="name" />
							</c:forEach>
						</form:select>
						<form:errors path="room" class="errors" />
					</td>
					<td width="33%">
						<label for="sponsor">Sponsor:</label><br />
						<form:select path="sponsor">
							<form:option value="" label="" />
							<form:options items="${ event.sponsors }" itemValue="id" itemLabel="companyName" />
						</form:select>
						<form:errors path="sponsor" class="errors" />
					</td>
				</tr>
			</table>
			<ul>
				<li>
					<input type="submit" value="Update" data-article="${ returnArticle }" />
				</li>
			</ul>
		</fieldset>
	</form:form>

	<aside class="updateFormLinks">
		<a href="${ back_url }" data-article="${ returnArticle }">Back</a>
	</aside>

</article>
