<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<article>

	<spring:url value="/view/${ event.shortName }" var="view_url" />
	<a href="${ view_url }">View Event</a>&nbsp;
	<a id="eventJson" href="#" data-id="${ event.id }">Test Event JSON</a>
	<a id="publishedEventsJson" href="#">Test Published Events JSON</a>
	<a id="eventCommentsJson" href="#" data-shortName="${ event.shortName }">Test Event Comments JSON</a>

	<fieldset>
		<legend>Event Details</legend>
		<ul>
			<li>
				<fmt:formatDate value="${ event.startDate }" type="date" pattern="yyyy-MM-dd" var="startDate" />
				Start Date: ${ startDate } (${ event.numberOfDays } days)
			</li>
			<li>
				<fmt:formatDate value="${ event.endDate }" type="date" pattern="yyyy-MM-dd" var="endDate" />
				End Date: ${ endDate }
			</li>
			<li>
				<label for="eventName">Name:</label>
				${ event.name }
			</li>
			<li>
				<label for="eventShortName">Short Name:</label>
				${ event.shortName }
			</li>
			<li>
				<label for="eventPublishDate">Publish Date:</label>
				<fmt:formatDate value="${ event.publishDate }" type="date" pattern="yyyy-MM-dd" var="publishDate" />
				${ publishDate }
			</li>
		</ul>
	</fieldset>

</article>

<article id="sponsors" class="details">
	<h3>Sponsors <a href="#" class="toggle">(expand)</a></h3>
	<div class="articleDetails">
		<ul>
			<c:forEach items="${ event.sponsors }" var="sponsor" varStatus="loop">
			<li>
				<a href="#" class="expand">+</a>
				${ sponsor.companyName }<br />
				${ sponsor.contactName }<br />

				<div>
					<c:if test="${ ! empty sponsor.contactEmail }">
					<a href="mailto:${ sponsor.contactEmail }">Email</a><br />
					</c:if>

					<c:if test="${ ! empty sponsor.webSite }">
					<a href="${ sponsor.webSite }" class="webSitePopupLink">Web Site</a><br />
					</c:if>
					
					<spring:url value="/events/${ event.id }/sponsors/${ sponsor.id }?form" var="edit_sponsor_url" />
					<a href="${ edit_sponsor_url }">Edit</a>
				</div>
			</li>
			</c:forEach>
		</ul>
	
		<spring:url value="/events/${ event.id }/sponsors?form=true" var="create_sponsor_url" />
		<a id="newSponsorFormLink" href="${ create_sponsor_url }" data-form="newSponsorForm">+ Add New Sponsor</a>
	</div>
</article>

<article id="venues" class="details">
	<h3>Venues <a href="#" class="toggle">(expand)</a></h3>
	<div class="articleDetails">
		<table width="100%">
		<tr>
			<th width="60%" colspan="2">Venue</th>
			<th width="40%">Rooms</th>
		</tr>
		<c:forEach items="${ event.venues }" var="venue" varStatus="loop">
		<tr>
			<td width="30%">
				<ul>
					<li>${ venue.name }</li>
					<li>${ venue.addressOne }</li>
					<c:if test="${ ! empty venue.addressTwo }">
					<li>${ venue.addressOne }</li>
					</c:if>
					<li>${ venue.city }, ${ venue.state } ${ venue.zip }</li>
					<li>
						<spring:url value="/events/${ event.id }/venues/${ venue.id }?form" var="edit_venue_url" />
						<a href="${ edit_venue_url }">Edit</a>
					</li>
				</ul>
			</td>
			<td width="30%">
				<ul>
					<li>
						Email:<br />
						<c:if test="${ ! empty venue.email }">
							<a href="mailto:${ venue.email }">${ venue.email }</a>
						</c:if>
					</li>
					<li>
						Phone:<br />
						${ venue.phone }
					</li>
					<li>
						Website:<br /> 
						<c:if test="${ ! empty venue.webSite }">
							<a href="${ venue.webSite }" class="webSitePopupLink">${ venue.webSite }</a>
						</c:if>
					</li>
				</ul>
			</td>
			<td>
				<ul>
				<c:forEach items="${ venue.rooms }" var="room">
					<li>
						<spring:url value="/events/${ event.id }/venues/${ venue.id }/rooms/${ room.id }?form" var="edit_sponsor_url" />
						${ room.name }&nbsp;&nbsp;<a href="${ edit_sponsor_url }">Edit</a>
					</li>
				</c:forEach>
				</ul>
				<br />
				<spring:url value="/events/${ event.id }/venues/${ venue.id }/rooms?form=true" var="create_venue_room_url" />
				<a id="newRoomFormLink" href="${ create_venue_room_url }" data-form="newRoomForm">+ Add New Room</a>
			</td>
		</tr>
		</c:forEach>
		<tr>
			<td>
				<spring:url value="/events/${ event.id }/venues?form=true" var="create_venue_url" />
				<a id="newVenueFormLink" href="${ create_venue_url }" data-form="newVenueForm">+ Add New Venue</a>
			</td>
		</tr>
		</table>
	</div>
</article>
		
<article id="tracks" class="details">
	<h3>Tracks <a href="#" class="toggle">(expand)</a></h3>
	<div class="articleDetails">
		<table width="100%">
		<tr>
			<th width="30%">Track</th>
			<th width="30%">Room</th>
			<th width="30%">Sponsor</th>
			<th width="10%"></th>
		</tr>
		<c:forEach items="${ event.tracks }" var="track" varStatus="loop">
		<tr>
			<td>${ track.name }</td>
			<td>${ track.room.name }</td>
			<td>${ track.sponsor.companyName } (${ track.sponsor.contactName })</td>
			<td>
				<spring:url value="/events/${ event.id }/tracks/${ track.id }?form" var="edit_track_url" />
				<a href="${ edit_track_url }">Edit</a>
			</td>
		</tr>
		</c:forEach>
		</table>
	
		<spring:url value="/events/${ event.id }/tracks?form" var="create_track_url" />
		<a id="newTrackFormLink" href="${ create_track_url }" data-form="newTrackForm">+ Add New Track</a>
	</div>
</article>
	
<article id="labels" class="details">
	<h3>Timeslot Labels <a href="#" class="toggle">(expand)</a></h3>
	<div class="articleDetails">
		<ul>
		<c:forEach items="${ event.labels }" var="label" varStatus="loop">
		<li>
			<spring:url value="/events/${ event.id }/labels/${ label.id }?form" var="edit_label_url" />
			${ label.name }<br />
			<a href="${ edit_label_url }">Edit</a>
		</li>
		</c:forEach>
		</ul>
		
		<spring:url value="/events/${ event.id }/labels?form" var="create_label_url" />
		<a id="newLabelFormLink" href="${ create_label_url }" data-form="newLabelForm">+ Add New Label</a>
	</div>
</article>

<article id="speakers" class="details">
	<h3>Speakers <a href="#" class="toggle">(expand)</a></h3>
	<div class="articleDetails">
		<ul>
		<c:forEach items="${ event.speakers }" var="speaker" varStatus="loop">
		<li>
			<a href="#" class="expand">+</a>
			${ speaker.name }<br />

			<div>
				<c:if test="${ ! empty speaker.phone }">
				${ speaker.phone }<br />
				</c:if>

				<c:if test="${ ! empty speaker.email }">
				<a href="mailto:${ speaker.email }">Email</a><br />
				</c:if>

				<c:if test="${ ! empty speaker.webSite }">
				<a href="${ speaker.webSite }" class="webSitePopupLink">Web Site</a><br />
				</c:if>

				<spring:url value="/events/${ event.id }/speakers/${ speaker.id }?form" var="edit_speaker_url" />
				<a href="${ edit_speaker_url }">Edit</a>
			</div>
		</li>
		</c:forEach>
		</ul>
	
		<spring:url value="/events/${ event.id }/speakers?form" var="create_speaker_url" />
		<a id="newSpeakerFormLink" href="${ create_speaker_url }" data-form="newSpeakerForm">+ Add New Speaker</a>
	</div>
</article>

<article id="sessions" class="details">
	<h3>Sessions <a href="#" class="toggle">(expand)</a></h3>
	<div class="articleDetails">
		<ul>
		<c:forEach items="${ event.sessions }" var="session" varStatus="loop">
		<li>
			<a href="#" class="expand">+</a>
			${ session.name }<br />

			<div>
				<c:if test="${ ! empty session.speakers }">
				<c:forEach items="${ session.speakers }" var="speaker">
				${ speaker.name }<br />
				</c:forEach>
				</c:if>

				<spring:url value="/events/${ event.id }/sessions/${ session.id }?form" var="edit_session_url" />
				<a href="${ edit_session_url }">Edit</a>
			</div>
		</li>
		</c:forEach>
		</ul>
	
		<spring:url value="/events/${ event.id }/sessions?form" var="create_session_url" />
		<a id="newSessionFormLink" href="${ create_session_url }" data-form="newSessionForm">+ Add New Session</a>
	</div>
</article>

<div id="schedule">
<h3>Schedule</h3>

<div class="addDay">
	<spring:url value="/events/${ event.id }/days" var="create_day_url" />
	<a href="${ create_day_url }">+ Add Day</a>
</div>

<div id="tabs">
		
	<ul class="tab-bar">
		<c:forEach items="${ event.days }" var="day" varStatus="loop">
		<li>
			<fmt:formatDate value="${ day.date }" type="date" pattern="yyyy-MM-dd" var="dateStr" />
			<a href="#tab-${ day.id }">${ dateStr }</a>
		</li>
		</c:forEach>
	</ul>

	<c:forEach items="${ event.days }" var="day" varStatus="loop">
		<fmt:formatDate value="${ day.date }" type="date" pattern="yyyy-MM-dd" var="dateStr" />
		<article id="tab-${ day.id }" class="scheduleTab">
			<c:if test="${ loop.index > 0 }">
				<span class="removeDay">
					<spring:url value="/events/${ event.id }/days/${ day.id }" var="remove_url" />
					<form action="${ remove_url }" method="post">
						<input type="hidden" name="_method" value="DELETE" />
						<label for="removeDay_${ day.id }">Remove Day</label>
						<input id="removeDay_${ day.id }" type="submit" value="X" />
					</form>
				</span>
			</c:if>
			<div style="padding-bottom: 5px;">
				<c:if test="${ ! empty event.tracks and ! empty event.labels }">
				<a id="newScheduleFormLink_${ day.id }" href="#" class="popupLink" data-form="newScheduleForm${ day.id }">+ Add Schedule</a>
				<div id="newScheduleForm${ day.id }" class="popupForm">
					<div class="popupFormClose">
						<a id="newScheduleFormCloseLink_${ day.id }" href="#" data-form="newScheduleForm${ day.id }">X Close</a>
					</div>

					<spring:url value="/events/${ event.id }/days/${ day.id }/schedules?form" var="create_schedule_url" />
					<form:form id="newScheduleForm${ day.id }" commandName="schedule" action="${ create_schedule_url }" method="post">
						<spring:bind path="day">
							<input type="hidden" name="day" value="${ day.id }" />
						</spring:bind>
						<fieldset>
							<legend>Create Schedule for ${ dateStr }</legend>
							<ul>
								<li>
									<label for="scheduleBlocksPerSchedule">Number of Timeslots:</label>
									<spring:bind path="blocksPerSchedule">
										<c:set var="numberOfBlocks" value="${ fn:length( event.labels ) }" />
										<input id="scheduleBlocksPerSchedule" type="number" name="blocksPerSchedule" value="${ numberOfBlocks }" min="1" max="${ numberOfBlocks }" required="true" />
									</spring:bind>
								</li>
								<li>
									<form:select id="scheduleTrack" path="track">
										<form:options items="${ event.tracks }" itemValue="id" itemLabel="name" />
									</form:select>
									<form:errors path="track" class="errors" />
								</li>
								<li>
									<input type="submit" value="Create" />
								</li>
							</ul>
						</fieldset>
					</form:form>
				</div>
				</c:if>
			</div>

			<div class="scheduleList">
				<c:forEach items="${ day.schedules }" var="schedule" varStatus="loop">
				
					<div class="trackView">
						<span class="removeTrack">
							<spring:url value="/events/${ event.id }/days/${ day.id }/schedules/${ schedule.id }" var="remove_url" />
							<form action="${ remove_url }" method="post">
								<input type="hidden" name="_method" value="DELETE" />
								<input type="submit" value="X" />
							</form>
						</span>
						<h4>${ schedule.track.name }</h4>
						<c:forEach items="${ schedule.blocks }" var="block" varStatus="blockLoop">
							<ul class="blockView">
								<li>
									<select class="labelSelect" data-eventId="${ event.id }" data-dayId="${ day.id }" data-scheduleId="${ schedule.id }" data-blockId="${ block.id }">
										<option value="0"></option>
										<c:forEach items="${ event.labels }" var="label">
											<option value="${ label.id }" <c:if test="${ block.label.id == label.id }">selected="selected"</c:if>>${ label.name }</option>
										</c:forEach>
									</select>
								</li>
								<li>
									<label for="labelDuration${ block.id }">Dur:</label>
									<input id="labelDuration_block${ block.id }" class="durationSelect" type="number" name="duration" value="${ block.duration }" min="1" max="360" required="true" data-eventId="${ event.id }" data-dayId="${ day.id }" data-scheduleId="${ schedule.id }" data-blockId="${ block.id }" />
								</li>
								<li>
									<select class="sessionSelect" data-eventId="${ event.id }" data-dayId="${ day.id }" data-scheduleId="${ schedule.id }" data-blockId="${ block.id }">
										<option value="0"></option>
										<c:forEach items="${ event.sessions }" var="sess">
											<option value="${ sess.id }" <c:if test="${ block.session.id == sess.id }">selected="selected"</c:if>>${ sess.name }</option>
										</c:forEach>
									</select>
								</li>
								<li>
									<span class="removeBlock">
										<spring:url value="/events/${ event.id }/days/${ day.id }/schedules/${ schedule.id }/blocks/${ block.id }" var="remove_url" />
										<form action="${ remove_url }" method="post">
											<input type="hidden" name="_method" value="DELETE" />
											<input type="submit" value="X" />
										</form>
									</span>
								</li>
							</ul>
						</c:forEach>
		
						<spring:url value="/events/${ event.id }/days/${ day.id }/schedules/${ schedule.id }" var="create_session_url" />
						<a href="${ create_session_url }">+ Add Session</a>
					</div>
					
				</c:forEach>
			</div>
			
		</article>
	</c:forEach>
</div>
</div>

<!-- pre>
  <c:forEach var="name"
             items="${pageContext.request.attributeNames}">
    Name:  ${name}
    Value: ${requestScope[name]}<br>
  </c:forEach>
</pre -->

<script type="text/javascript">
	console.debug( "show article : enter" );
	
	var article = retrieveFromSession( "schedule_update_article" );
	console.debug( "show article : article=" + article );
	
	if( null != article ) {
		console.debug( "show article : article found, unhiding" );

		$( "#" + article ).children( ".articleDetails" ).toggle();

		if( $( "#" + article ).children( ".articleDetails" ).is( ':visible' ) ) {
			$( "#" + article + " h3" ).children( '.toggle' ).html( '(hide)' );
		} else {
			$( "#" + article + " h3" ).children( '.toggle' ).html( '(expand)' );
		}
		
		removeFromSession( "schedule_update_article" );
		
		<c:if test="${! empty requestScope['containsErrors']}">
			var form = retrieveFromSession( "schedule_update_form" );
			console.debug( "show article : form=" + form );
		
			$( "#" + form ).show();
		</c:if>
	}

	console.debug( "show article : exit" );
</script>