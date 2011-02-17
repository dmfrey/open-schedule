<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<c:if test="${ empty event }">
<article>
	There are no events to display.
</article>
</c:if>

<c:if test="${ ! empty event }">
<article>

	<fieldset>
	<legend>Event Information</legend>
	<ul>
		<li>${ event.name }</li>
		<li>Short Name: ${ event.shortName }</li>
		<li>
			<fmt:formatDate value="${ event.startDate }" type="date" pattern="yyyy-MM-dd" var="startDate" />
			Start Date: ${ startDate } (${ event.numberOfDays } days)
		</li>
	</ul>
	</fieldset>
	
</article>

<article>
	<h3>Venue</h3>
	
	<c:forEach items="${ event.venues }" var="venue">
	<div class="publicVenue">

		<fieldset>
		<legend>Hotel</legend>
		<ul>
			<li>${ venue.name }</li>
			
			<c:if test="${ ! empty venue.addressOne }">
			<li>${ venue.addressOne }</li>
			</c:if>

			<c:if test="${ ! empty venue.addressTwo }">
			<li>${ venue.addressTwo }</li>
			</c:if>
			
			<c:if test="${ ! empty venue.city || ! empty venue.state || ! empty venue.zip }">
			<li>
				<c:if test="${ ! empty venue.city }">${ venue.city }, </c:if>
				<c:if test="${ ! empty venue.state }">${ venue.state } </c:if>
				<c:if test="${ ! empty venue.zip }">${ venue.zip } </c:if>
			</li>
			</c:if>
			
		</ul>
		</fieldset>
		
		<fieldset>
		<legend>Contact</legend>
		<ul>
			<c:if test="${ ! empty venue.phone }">
			<li>${ venue.phone }</li>
			</c:if>
			<c:if test="${ ! empty venue.email }">
			<li><a href="mailto:${ venue.email }">${ venue.email }</a></li>
			</c:if>
			<c:if test="${ ! empty venue.webSite }">
			<li><a href="${ venue.webSite }" class="webSitePopup">${ venue.webSite }</a></li>
			</c:if>
		</ul>
		</fieldset>
		
		<fieldset>
		<legend>Conference Rooms</legend>
		<ul>
			<c:forEach items="${ venue.rooms }" var="room">
			<li>${ room.name }</li>
			</c:forEach>
		</ul>
		</fieldset>
	</div>
	</c:forEach>
	
</article>

<article class="publicTrack">
	<h3>Tracks</h3>

	<fieldset>
	<legend>Speaker Tracks</legend>
	<ul>
		<c:forEach items="${ event.tracks }" var="track">
		<li>
			<span>${ track.name }</span>
			<span>${ track.sponsor.companyName }</span>
			<span>${ track.room.name }</span>
		</li>
		</c:forEach>
	</ul>
	</fieldset>
</article>

	<h3>Schedule</h3>
	<c:forEach items="${ event.days }" var="day" varStatus="loop">
		<fmt:formatDate value="${ day.date }" type="date" pattern="yyyy-MM-dd" var="dateStr" />
		<article id="tab-${ day.id }" class="publicSchedule">

			<h3>Schedule for ${ dateStr }</h3>

			<c:set var="scheduleCount" value="${ fn:length( day.schedules ) }" />
			<table>
				<c:forEach items="${ day.schedules[0].blocks }" var="block" varStatus="loop">
				<c:if test="${ loop.index == 0 }">
				<tr>
					<td class="timeslot">Time</td>
					<c:forEach items="${ day.schedules }" var="schedule">
						<td>
							<span class="track">${ schedule.track.name }</span>
							<span class="sponsor">${ schedule.track.sponsor.companyName }</span>
						</td>
					</c:forEach>
				</tr>
				</c:if>
				<tr>
					<td class="timeslot">${ block.label.name }</td>
					<td>
						<span class="session">${ block.session.name }</span>
						<c:forEach items="${ block.session.speakers }" var="speaker">
							<span class="speaker">${ speaker.name }</span>
						</c:forEach>
					</td>
					<c:forEach items="${ day.schedules }" var="schedule" begin="1" varStatus="scheduleLoop">
						<td>
							<span class="session">${ schedule.blocks[loop.index].session.name }</span>
							<c:forEach items="${ schedule.blocks[loop.index].session.speakers }" var="speaker">
								<span class="speaker">${ speaker.name }</span>
							</c:forEach>
						</td>
					</c:forEach>
				</tr>
				</c:forEach>
			</table>
			
		</article>
	</c:forEach>

</c:if>