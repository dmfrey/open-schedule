<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<c:set var="returnArticle" value="sessions" />

<spring:url value="/events/${ eventId }?form" var="back_url" />
<article>

	<aside class="updateFormLinks">
		<a href="${ back_url }" data-article="${ returnArticle }">Back</a>
	</aside>
	
	<form:form commandName="session" method="put">
		<form:hidden path="id" />
		<form:hidden path="version" />
		<fieldset>
			<legend>Update Session</legend>
			<ul>
				<li>
					<label for="sessionName">Name:</label>
					<spring:bind path="name">
						<input id="sessionName" type="text" name="${ status.expression }" value="${ status.value }" size="20" maxlength="255" placeholder="Name" />
						<span class="errors">
							<c:forEach items="${ status.errorMessages }" var="message">
								${ message }<br />
							</c:forEach>
						</span>
					</spring:bind>
				</li>
				<li>
					<label for="description">Description:</label>
					<spring:bind path="description">
						<textarea id="sessionDescription" name="${ status.expression }" rows="6" cols="25" required="true" placeholder="Description">${ status.value }</textarea>
						<label for="description" class="errors">
							<c:if test="${ status.error != 'false' }">
								<c:forEach items="${ status.errorMessages }" var="message">
									${ message }<br />
								</c:forEach>
							</c:if>
						</label>
					</spring:bind>
				</li>
				<li>
					<label for="speaker">Speaker:</label>
					<form:select path="speakers">
						<form:option value=""></form:option>
						<form:options items="${ event.speakers }" itemValue="id" itemLabel="name" />
					</form:select>
					<form:errors path="speakers" class="errors" />
				</li>
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