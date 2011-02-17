<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<article>
	<form:form id="createEventForm" commandName="event" method="POST">
		<security:authentication var="username" property="principal.username" /> 
		<spring:bind path="username">
			<input type="hidden" name="${ status.expression }" value="${ username }" />
		</spring:bind>
		<form:hidden path="endDate" />
		<fieldset>
			<legend>Create Event</legend>
			<ul>
				<li>
					<label for="eventName">Name</label>
					<spring:bind path="name">
						<input id="eventName" type="text" name="${ status.expression }" value="${ status.value }" autofocus="true" maxlength="255" required="true" placeholder="Event Name" />
						<span class="errors">
							<c:forEach items="${ status.errorMessages }" var="message">
								${ message }<br />
							</c:forEach>
						</span>
					</spring:bind>
				</li>
				<li>
					<label for="eventShortName">Short Name</label>
					<spring:bind path="shortName">
						<input id="eventShortName" type="text" name="${ status.expression }" value="${ status.value }" maxlength="10" required="true" placeholder="Short Name for Event" />
						<span class="errors">
							<c:forEach items="${ status.errorMessages }" var="message">
								${ message }<br />
							</c:forEach>
						</span>
					</spring:bind>
				</li>
				<li>
					<label for="eventStartDate">Start Date</label>
					<spring:bind path="startDate">
						<fmt:formatDate value="${ event.startDate }" type="date" pattern="yyyy-MM-dd" var="startDate" />
						<input id="eventStartDate" type="date" name="${ status.expression }" value="${ startDate }" required="true" />
						<span class="errors">
							<c:forEach items="${ status.errorMessages }" var="message">
								${ message }<br />
							</c:forEach>
						</span>
					</spring:bind>
				</li>
				<li>
					<label for="eventNumberOfDays">Number of Days</label>
					<spring:bind path="numberOfDays">
						<input id="eventNumberOfDays" type="number" name="${ status.expression }" value="${ status.value }" min="1" max="10" required="true" />
						<span class="errors">
							<c:forEach items="${ status.errorMessages }" var="message">
								${ message }<br />
							</c:forEach>
						</span>
					</spring:bind>
				</li>
				<li>
    	   			<spring:message code="button_submit" var="submit_label" />
   	   				<input id="proceed" type="submit" value="${ fn:escapeXml( submit_label ) }" />
				</li>
			</ul>
		</fieldset>
	</form:form>
</article>