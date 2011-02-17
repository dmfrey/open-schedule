<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<c:set var="returnArticle" value="venues" />

<spring:url value="/events/${ eventId }?form" var="back_url" />
<article>

	<aside class="updateFormLinks">
		<a href="${ back_url }" data-article="${ returnArticle }">Back</a>
	</aside>
	
	<form:form commandName="venue" method="put">
		<form:hidden path="id" />
		<form:hidden path="version" />
		<fieldset>
			<legend>Update Venue</legend>
			<div class="venueAddress">
				<ul>
					<li>
						<label for="venueName">Name:</label>
						<spring:bind path="name">
							<input id="venueName" type="text" name="${ status.expression }" value="${ status.value }" size="20" maxlength="255" placeholder="Name" />
							<span class="errors">
								<c:forEach items="${ status.errorMessages }" var="message">
									${ message }<br />
								</c:forEach>
							</span>
						</spring:bind>
					</li>
					<li>
						<label for="venueAddressOne">Address One:</label>
						<spring:bind path="addressOne">
							<input id="venueAddressOne" type="text" name="${ status.expression }" value="${ status.value }" size="20" maxlength="255" placeholder="Address Line 1" />
							<span class="errors">
								<c:forEach items="${ status.errorMessages }" var="message">
									${ message }<br />
								</c:forEach>
							</span>
						</spring:bind>
					</li>
					<li>
						<label for="venueAddressTwo">Address Two:</label>
						<spring:bind path="addressTwo">
							<input id="venueAddressTwo" type="text" name="${ status.expression }" value="${ status.value }" size="20" maxlength="255" placeholder="Address Line 2" />
							<span class="errors">
								<c:forEach items="${ status.errorMessages }" var="message">
									${ message }<br />
								</c:forEach>
							</span>
						</spring:bind>
					</li>
					<li>
						<label for="venueCity">City</label>
						<spring:bind path="city">
							<input id="venueCity" type="text" name="${ status.expression }" value="${ status.value }" size="20" maxlength="255" placeholder="City" />
							<span class="errors">
								<c:forEach items="${ status.errorMessages }" var="message">
									${ message }<br />
								</c:forEach>
							</span>
						</spring:bind>
					</li>
					<li>
						<label for="venueState">State</label>
						<spring:bind path="state">
							<input id="venueState" type="text" name="${ status.expression }" value="${ status.value }" size="2" maxlength="2" placeholder="State" />
							<span class="errors">
								<c:forEach items="${ status.errorMessages }" var="message">
									${ message }<br />
								</c:forEach>
							</span>
						</spring:bind>
					</li>
					<li>
						<label for="venueZip">Zip Code:</label>
						<spring:bind path="zip">
							<input id="venueZip" type="text" name="${ status.expression }" value="${ status.value }" size="10" maxlength="10" placeholder="Zip Code" />
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
			</div>
			<div class="venueInformation">
				<ul>
					<li>
						<label for="venueEmail">Email:</label>
						<spring:bind path="email">
							<input id="venueEmail" type="email" name="${ status.expression }" value="${ status.value }" size="20" maxlength="255" placeholder="Email Address" />
							<span class="errors">
								<c:forEach items="${ status.errorMessages }" var="message">
									${ message }<br />
								</c:forEach>
							</span>
						</spring:bind>
					</li>
					<li>
						<label for="venuePhone">Phone:</label>
						<spring:bind path="phone">
							<input id="venuePhone" type="text" name="${ status.expression }" value="${ status.value }" size="20" maxlength="255" placeholder="Phone Number" />
							<span class="errors">
								<c:forEach items="${ status.errorMessages }" var="message">
									${ message }<br />
								</c:forEach>
							</span>
						</spring:bind>
					</li>
					<li>
						<label for="venueWebSite">Web Site:</label>
						<spring:bind path="webSite">
							<input id="venueWebSite" type="url" name="${ status.expression }" value="${ status.value }" size="20" maxlength="255" placeholder="Web Site" />
							<span class="errors">
								<c:forEach items="${ status.errorMessages }" var="message">
									${ message }<br />
								</c:forEach>
							</span>
						</spring:bind>
					</li>
				</ul>
			</div>
			<div class="venueRooms">
				<ul>
					<li>Rooms</li>
					<c:forEach items="${ venue.rooms }" var="room" varStatus="loop">
						<li>
							<spring:bind path="rooms[${ loop.index }].name">
							${ room.name }
							<input type="hidden" name="${ status.expression }" value="${ status.value }" />
							</spring:bind>
							<spring:bind path="rooms[${ loop.index }].id">
							<input type="hidden" name="${ status.expression }" value="${ status.value }" />
							</spring:bind>
							<spring:bind path="rooms[${ loop.index }].version">
							<input type="hidden" name="${ status.expression }" value="${ status.value }" />
							</spring:bind>
						</li>
					</c:forEach>
				</ul>
			</div>
		</fieldset>
	</form:form>

	<aside class="updateFormLinks">
		<a href="${ back_url }" data-article="${ returnArticle }">Back</a>
	</aside>
	
</article>
