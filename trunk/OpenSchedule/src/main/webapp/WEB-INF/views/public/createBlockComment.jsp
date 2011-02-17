<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class="create createComment">
	<header>
		<span>
			<spring:url value="/public/${ shortName }/days/${ dayId }/schedules/${ scheduleId }/blocks/${ blockId }/comments" var="back_url" />
			<a href="${ back_url }">Back</a>
		</span>
		
		<h1> Create Comment for Session</h1>
	</header>

	<form:form commandName="blockComment">
		<fieldset>
			<legend>New Comment</legend>
			<ul>
				<li>
					<label for="name">Name: (optional)</label>
					<form:input path="name" />
				</li>
				<li>
					<label for="email">Email: (optional)</label>
					<form:input path="email" />
				</li>
				<li>
					<label for="comment">Comment:</label>
					<form:textarea path="comment" rows="5" cols="20" />
				</li>
				<li>
					<input type="submit" value="Create" />
				</li>
			</ul>
		</fieldset>
	</form:form>
	
</div>