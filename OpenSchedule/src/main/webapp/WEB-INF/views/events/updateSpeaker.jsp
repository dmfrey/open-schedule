<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<c:set var="returnArticle" value="speakers" />

<spring:url value="/events/${ eventId }?form" var="back_url" />
<article>

	<aside class="updateFormLinks">
		<a href="${ back_url }" data-article="${ returnArticle }">Back</a>
	</aside>
	
	<form:form commandName="speaker" method="put">
		<form:hidden path="id" />
		<form:hidden path="version" />
		<fieldset>
			<legend>Update Speaker</legend>
			<ul>
				<li>
					<label for="speakerName">Name:</label>
					<spring:bind path="name">
						<input id="speakerName" type="text" name="${ status.expression }" value="${ status.value }" size="20" maxlength="255" placeholder="Name" />
						<span class="errors">
							<c:forEach items="${ status.errorMessages }" var="message">
								${ message }<br />
							</c:forEach>
						</span>
					</spring:bind>
				</li>
				<li>
					<label for="speakerEmail">Email:</label>
					<spring:bind path="email">
						<input id="speakerEmail" type="email" name="${ status.expression }" value="${ status.value }" size="20" maxlength="255" placeholder="Email Address" />
						<span class="errors">
							<c:forEach items="${ status.errorMessages }" var="message">
								${ message }<br />
							</c:forEach>
						</span>
					</spring:bind>
				</li>
				<li>
					<label for="speakerPhone">Phone:</label>
					<spring:bind path="phone">
						<input id="speakerPhone" type="text" name="${ status.expression }" value="${ status.value }" size="20" maxlength="255" placeholder="Phone Number" />
						<span class="errors">
							<c:forEach items="${ status.errorMessages }" var="message">
								${ message }<br />
							</c:forEach>
						</span>
					</spring:bind>
				</li>
				<li>
					<label for="speakerWebSite">Web Site:</label>
					<spring:bind path="webSite">
						<input id="speakerWebSite" type="url" name="${ status.expression }" value="${ status.value }" size="20" maxlength="255" placeholder="Web Site" />
						<span class="errors">
							<c:forEach items="${ status.errorMessages }" var="message">
								${ message }<br />
							</c:forEach>
						</span>
					</spring:bind>
				</li>
				<li>
					<label for="speakerBio">Bio:</label>
					<spring:bind path="bio">
						<textarea id="speakerBio" name="${ status.expression }" rows="6" cols="25" placeholder="Biography">${ status.value }</textarea>
						<span class="errors">
							<c:forEach items="${ status.errorMessages }" var="message">
								${ message }<br />
							</c:forEach>
						</span>
					</spring:bind>
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
