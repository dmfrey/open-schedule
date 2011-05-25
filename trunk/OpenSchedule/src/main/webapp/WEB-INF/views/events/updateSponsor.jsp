<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<c:set var="returnArticle" value="sponsors" />

<spring:url value="/events/${ eventId }?form" var="back_url" />
<article>

	<aside class="updateFormLinks">
		<a href="${ back_url }" data-article="${ returnArticle }">Back</a>
	</aside>
	
	<form:form commandName="sponsor" method="put">
		<form:hidden path="id" />
		<form:hidden path="version" />
		<fieldset>
			<legend>Update Sponsor</legend>
			<ul>
				<li>
					<label for="sponsorCompanyName">Company Name:</label>
					<spring:bind path="companyName">
						<input id="sponsorCompanyName" type="text" name="${ status.expression }" value="${ status.value }" size="20" maxlength="255" placeholder="Company Name" />
						<span class="errors">
							<c:forEach items="${ status.errorMessages }" var="message">
								${ message }<br />
							</c:forEach>
						</span>
					</spring:bind>
				</li>
				<li>
					<label for="sponsorContactName">Contact Name:</label>
					<spring:bind path="contactName">
						<input id="sponsorContactName" type="text" name="${ status.expression }" value="${ status.value }" size="20" maxlength="255" placeholder="Contact Name" />
						<span class="errors">
							<c:forEach items="${ status.errorMessages }" var="message">
								${ message }<br />
							</c:forEach>
						</span>
					</spring:bind>
				</li>
				<li>
					<label for="sponsorContactEmail">Contact Email:</label>
					<spring:bind path="contactEmail">
						<input id="sponsorContactEmail" type="email" name="${ status.expression }" value="${ status.value }" size="20" maxlength="255" placeholder="Email" />
						<span class="errors">
							<c:forEach items="${ status.errorMessages }" var="message">
								${ message }<br />
							</c:forEach>
						</span>
					</spring:bind>
				</li>
				<li>
					<label for="sponsorContactPhone">Contact Phone:</label>
					<spring:bind path="contactPhone">
						<input id="sponsorContactPhone" type="text" name="${ status.expression }" value="${ status.value }" size="20" maxlength="255" placeholder="Phone" />
						<span class="errors">
							<c:forEach items="${ status.errorMessages }" var="message">
								${ message }<br />
							</c:forEach>
						</span>
					</spring:bind>
				</li>
				<li>
					<label for="sponsorWebSite">Web Site:</label>
					<spring:bind path="webSite">
						<input id="sponsorWebSite" type="url" name="${ status.expression }" value="${ status.value }" size="20" maxlength="255" placeholder="Web Site" />
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