<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<spring:escapeBody />

<c:if test="${ empty event }">
<div class="view viewEmpty">
	The Event was not found!
</div>
</c:if>

<c:if test="${ ! empty event }">
<div class="view viewInfo">
	<header>
		<h1>Event Information</h1>
	</header>
	
	<aside>
		<p>
			<spring:url value="/public/${ event.shortName }/comments" var="event_comments_url" />
			(Comment: ${fn:length( event.comments )} <a href="${ event_comments_url }">view</a>)
		</p>
		<p>
			<spring:url value="/public/${ event.shortName }/notifications" var="notifications_url" />
			(Notification: ${fn:length( notifications )} <a href="${ notifications_url }">view</a>)
		</p>
	</aside>

	<article>
		<ul>
			<li><span>Name:</span> ${ event.name }</li>
			<li><span>Short Name:</span> ${ event.shortName }</li>
			<li>
				<fmt:formatDate value="${ event.startDate }" type="date" pattern="yyyy-MM-dd" var="startDate" />
				<span>Start Date:</span> ${ startDate } (${ event.numberOfDays } days)
			</li>
		</ul>
	</article>
	
	<article>
		<ul>
			<li>
				<spring:url value="/public/${ event.shortName }/speakers" var="speakers_link" />
				<a href="${ speakers_link }">Speakers</a>
			</li>
			<li>
				<spring:url value="/public/${ event.shortName }/sessions" var="sessions_link" />
				<a href="${ sessions_link }">Sessions</a>
			</li>
		</ul>
	</article>
</div>

<div class="view viewAgenda">
	<header>
		<h1>Agenda</h1>
	</header>
	
	<c:forEach items="${ event.days }" var="day" varStatus="loop">
	<article>
		<header>
			<h2>
				<fmt:formatDate value="${ day.date }" type="date" pattern="yyyy-MM-dd" var="dateStr" />
				${ dateStr }
			</h2>
		</header>
		
		<c:forEach items="${ day.schedules }" var="schedule">
		<div>

			<header>
				<h3>Schedule for ${ schedule.track.name }</h3>
				<span class="sponsor">Sponsored by: ${ schedule.track.sponsor.companyName }</span>
				<span class="room">(Room ${ schedule.track.room.name })</span>
			</header>
			
			<table>
		    <tr>
		    	<th>Session&nbsp;Name</th>
		    	<th>8</th><th></th>
		    	<th>9</th><th></th>
		    	<th>10</th><th></th>
		    	<th>11</th><th></th>
		    	<th>12</th><th></th>
		    	<th>1</th><th></th>
		    	<th>2</th><th></th>
		    	<th>3</th><th></th>
		    	<th>4</th><th></th>
		    	<th>5</th><th></th>
		    	<th>6</th><th></th>
		    	<th>7</th><th></th>
		    	<th>8</th><th></th>
	        </tr>

			<c:set var="spanColumn" value="0" />
			<c:set var="showSpan" value="false" />
			<c:forEach items="${ schedule.blocks }" var="block">
				<c:set var="spanColumn" value="${ block.duration / 30 }" />
				<c:set var="showSpan" value="false" />
				
				<c:set var="title" value="${ block.session.name }<br /><br />${ block.session.description }<br /><br />Speakers:<br />" />
				<c:forEach items="${ block.session.speakers }" var="speaker">
					<c:set var="title" value="${ title } ${ speaker.name }<br />" />
				</c:forEach>
				
				<spring:url value="/public/${ event.shortName }/sessions/${ block.session.id }" var="session_url" />
		    <tr>
				<td title="${ title }">
					<spring:url value="/public/${ event.shortName }/days/${ day.id }/schedules/${ schedule.id }/blocks/${ block.id }/comments" var="block_comments_url" />
					<a href="${ session_url }">
						${ block.session.name }<br />
					</a>
					(Comment: ${fn:length( block.comments )} <a href="${ block_comments_url }">view</a>)
				</td>
				<td <c:if test="${ ( showSpan && spanColumn > 0 ) || block.label.name == '08:00' }"> <c:set var="showSpan" value="true" /> <c:set var="spanColumn" value="${ spanColumn - 1 }" /> class="session" title="${ title }" </c:if> ><!-- 08:00 --></td>
		    	<td <c:if test="${ ( showSpan && spanColumn > 0 ) || block.label.name == '08:30' }"> <c:set var="showSpan" value="true" /> <c:set var="spanColumn" value="${ spanColumn - 1 }" /> class="session" title="${ title }" </c:if> ><!-- 08:30 --></td>
				<td <c:if test="${ ( showSpan && spanColumn > 0 ) || block.label.name == '09:00' }"> <c:set var="showSpan" value="true" /> <c:set var="spanColumn" value="${ spanColumn - 1 }" /> class="session" title="${ title }" </c:if> ><!-- 09:00 --></td>
		    	<td <c:if test="${ ( showSpan && spanColumn > 0 ) || block.label.name == '09:30' }"> <c:set var="showSpan" value="true" /> <c:set var="spanColumn" value="${ spanColumn - 1 }" /> class="session" title="${ title }" </c:if> ><!-- 09:30 --></td>
				<td <c:if test="${ ( showSpan && spanColumn > 0 ) || block.label.name == '10:00' }"> <c:set var="showSpan" value="true" /> <c:set var="spanColumn" value="${ spanColumn - 1 }" /> class="session" title="${ title }" </c:if> ><!-- 10:00 --></td>
		    	<td <c:if test="${ ( showSpan && spanColumn > 0 ) || block.label.name == '10:30' }"> <c:set var="showSpan" value="true" /> <c:set var="spanColumn" value="${ spanColumn - 1 }" /> class="session" title="${ title }" </c:if> ><!-- 10:30 --></td>
				<td <c:if test="${ ( showSpan && spanColumn > 0 ) || block.label.name == '11:00' }"> <c:set var="showSpan" value="true" /> <c:set var="spanColumn" value="${ spanColumn - 1 }" /> class="session" title="${ title }" </c:if> ><!-- 11:00 --></td>
		    	<td <c:if test="${ ( showSpan && spanColumn > 0 ) || block.label.name == '11:30' }"> <c:set var="showSpan" value="true" /> <c:set var="spanColumn" value="${ spanColumn - 1 }" /> class="session" title="${ title }" </c:if> ><!-- 11:30 --></td>
				<td <c:if test="${ ( showSpan && spanColumn > 0 ) || block.label.name == '12:00' }"> <c:set var="showSpan" value="true" /> <c:set var="spanColumn" value="${ spanColumn - 1 }" /> class="session" title="${ title }" </c:if> ><!-- 12:00 --></td>
		    	<td <c:if test="${ ( showSpan && spanColumn > 0 ) || block.label.name == '12:30' }"> <c:set var="showSpan" value="true" /> <c:set var="spanColumn" value="${ spanColumn - 1 }" /> class="session" title="${ title }" </c:if> ><!-- 12:30 --></td>
				<td <c:if test="${ ( showSpan && spanColumn > 0 ) || block.label.name == '13:00' }"> <c:set var="showSpan" value="true" /> <c:set var="spanColumn" value="${ spanColumn - 1 }" /> class="session" title="${ title }" </c:if> ><!-- 13:00 --></td>
		    	<td <c:if test="${ ( showSpan && spanColumn > 0 ) || block.label.name == '13:30' }"> <c:set var="showSpan" value="true" /> <c:set var="spanColumn" value="${ spanColumn - 1 }" /> class="session" title="${ title }" </c:if> ><!-- 13:30 --></td>
				<td <c:if test="${ ( showSpan && spanColumn > 0 ) || block.label.name == '14:00' }"> <c:set var="showSpan" value="true" /> <c:set var="spanColumn" value="${ spanColumn - 1 }" /> class="session" title="${ title }" </c:if> ><!-- 14:00 --></td>
		    	<td <c:if test="${ ( showSpan && spanColumn > 0 ) || block.label.name == '14:30' }"> <c:set var="showSpan" value="true" /> <c:set var="spanColumn" value="${ spanColumn - 1 }" /> class="session" title="${ title }" </c:if> ><!-- 14:30 --></td>
				<td <c:if test="${ ( showSpan && spanColumn > 0 ) || block.label.name == '15:00' }"> <c:set var="showSpan" value="true" /> <c:set var="spanColumn" value="${ spanColumn - 1 }" /> class="session" title="${ title }" </c:if> ><!-- 15:00 --></td>
		    	<td <c:if test="${ ( showSpan && spanColumn > 0 ) || block.label.name == '15:30' }"> <c:set var="showSpan" value="true" /> <c:set var="spanColumn" value="${ spanColumn - 1 }" /> class="session" title="${ title }" </c:if> ><!-- 15:30 --></td>
				<td <c:if test="${ ( showSpan && spanColumn > 0 ) || block.label.name == '16:00' }"> <c:set var="showSpan" value="true" /> <c:set var="spanColumn" value="${ spanColumn - 1 }" /> class="session" title="${ title }" </c:if> ><!-- 16:00 --></td>
		    	<td <c:if test="${ ( showSpan && spanColumn > 0 ) || block.label.name == '16:30' }"> <c:set var="showSpan" value="true" /> <c:set var="spanColumn" value="${ spanColumn - 1 }" /> class="session" title="${ title }" </c:if> ><!-- 16:30 --></td>
				<td <c:if test="${ ( showSpan && spanColumn > 0 ) || block.label.name == '17:00' }"> <c:set var="showSpan" value="true" /> <c:set var="spanColumn" value="${ spanColumn - 1 }" /> class="session" title="${ title }" </c:if> ><!-- 17:00 --></td>
		    	<td <c:if test="${ ( showSpan && spanColumn > 0 ) || block.label.name == '17:30' }"> <c:set var="showSpan" value="true" /> <c:set var="spanColumn" value="${ spanColumn - 1 }" /> class="session" title="${ title }" </c:if> ><!-- 17:30 --></td>
				<td <c:if test="${ ( showSpan && spanColumn > 0 ) || block.label.name == '18:00' }"> <c:set var="showSpan" value="true" /> <c:set var="spanColumn" value="${ spanColumn - 1 }" /> class="session" title="${ title }" </c:if> ><!-- 18:00 --></td>
		    	<td <c:if test="${ ( showSpan && spanColumn > 0 ) || block.label.name == '18:30' }"> <c:set var="showSpan" value="true" /> <c:set var="spanColumn" value="${ spanColumn - 1 }" /> class="session" title="${ title }" </c:if> ><!-- 18:30 --></td>
				<td <c:if test="${ ( showSpan && spanColumn > 0 ) || block.label.name == '19:00' }"> <c:set var="showSpan" value="true" /> <c:set var="spanColumn" value="${ spanColumn - 1 }" /> class="session" title="${ title }" </c:if> ><!-- 18:00 --></td>
		    	<td <c:if test="${ ( showSpan && spanColumn > 0 ) || block.label.name == '19:30' }"> <c:set var="showSpan" value="true" /> <c:set var="spanColumn" value="${ spanColumn - 1 }" /> class="session" title="${ title }" </c:if> ><!-- 18:30 --></td>
				<td <c:if test="${ ( showSpan && spanColumn > 0 ) || block.label.name == '20:00' }"> <c:set var="showSpan" value="true" /> <c:set var="spanColumn" value="${ spanColumn - 1 }" /> class="session" title="${ title }" </c:if> ><!-- 18:00 --></td>
		    	<td <c:if test="${ ( showSpan && spanColumn > 0 ) || block.label.name == '20:30' }"> <c:set var="showSpan" value="true" /> <c:set var="spanColumn" value="${ spanColumn - 1 }" /> class="session" title="${ title }" </c:if> ><!-- 18:30 --></td>
		    </tr>
			</c:forEach>
			</table>
		</div>
		</c:forEach>

	</article>
	</c:forEach>
</div>

<div class="view viewVenue">
	<header>
		<h1>Venue</h1>
	</header>
	
	<c:forEach items="${ event.venues }" var="venue">
	<article>
		<header>
			<h2>Hotel</h2>
		</header>

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

		<aside>
			<header>
				<h3>Contact</h3>
			</header>

			<ul>
				<c:if test="${ ! empty venue.phone }">
				<li>${ venue.phone }</li>
				</c:if>
				<c:if test="${ ! empty venue.email }">
				<li><a href="mailto:${ venue.email }">Email</a></li>
				</c:if>
				<c:if test="${ ! empty venue.webSite }">
				<li><a href="${ venue.webSite }" class="webSitePopup">Web Site</a></li>
				</c:if>
			</ul>
		</aside>
	</article>		
	<article class="viewVenueRooms">
		<header>
			<h2>Conference Rooms</h2>
		</header>
		
		<ul>
			<c:forEach items="${ venue.rooms }" var="room">
				<li>${ room.name }</li>
			</c:forEach>
		</ul>
	</article>
	</c:forEach>
</div>

</c:if>