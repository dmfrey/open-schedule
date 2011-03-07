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
	
	<form:form commandName="notification" method="post">
		<form:hidden path="id" />
		<form:hidden path="version" />
		<fieldset>
			<legend>Create Notification</legend>
			<ul>
				<li>
					<label for="statusTitle">Status Title:</label>
					<spring:bind path="statusTitle">
						<input id="statusTitle" type="text" name="${ status.expression }" value="${ status.value }" size="20" maxlength="128" placeholder="Status Bar Title" />
						<span class="errors">
							<c:forEach items="${ status.errorMessages }" var="errorMessage">
								${ errorMessage }<br />
							</c:forEach>
						</span>
					</spring:bind>
				</li>
				<li>
					<label for="statusMessage">Status Message:</label>
					<spring:bind path="statusMessage">
						<input id="statusMessage" type="text" name="${ status.expression }" value="${ status.value }" size="20" maxlength="255" placeholder="Status Bar Message" />
						<span class="errors">
							<c:forEach items="${ status.errorMessages }" var="errorMessage">
								${ errorMessage }<br />
							</c:forEach>
						</span>
					</spring:bind>
				</li>
				<li>
					<label for="title">Title:</label>
					<spring:bind path="title">
						<input id="title" type="text" name="${ status.expression }" value="${ status.value }" size="20" maxlength="128" placeholder="Status Bar Title" />
						<span class="errors">
							<c:forEach items="${ status.errorMessages }" var="errorMessage">
								${ errorMessage }<br />
							</c:forEach>
						</span>
					</spring:bind>
				</li>
				<li>
					<label for="message">Message:</label>
					<spring:bind path="message">
						<input id="message" type="text" name="${ status.expression }" value="${ status.value }" size="20" maxlength="255" placeholder="Status Bar Message" />
						<span class="errors">
							<c:forEach items="${ status.errorMessages }" var="errorMessage">
								${ errorMessage }<br />
							</c:forEach>
						</span>
					</spring:bind>
				</li>
				<li>
					<label for="duration">Duration</label>
					<spring:bind path="duration">
						<input id="duration" type="number" name="${ status.expression }" value="${ status.value }" min="1" max="120" required="true" />
						<span class="errors">
							<c:forEach items="${ status.errorMessages }" var="errorMessage">
								${ errorMessage }<br />
							</c:forEach>
						</span>
					</spring:bind>
				</li>
				<li>
					<label>Active:</label>
					<ul>
						<li>
							<form:radiobutton path="active" value="true" label="Yes" />
						</li>
						<li>
							<form:radiobutton path="active" value="false" label="No" />
						</li>
					</ul>
				</li>
				<li>
					<input type="submit" value="Create" />
				</li>
			</ul>
		</fieldset>
	</form:form>

	<aside class="updateFormLinks">
		<a href="${ back_url }" data-article="${ returnArticle }">Back</a>
	</aside>
	
</article>