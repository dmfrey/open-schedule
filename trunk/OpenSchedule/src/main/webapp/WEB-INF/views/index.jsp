<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<h3>
	<spring:message code="application_name" var="app_name" />
	<spring:message code="welcome_h3" arguments="${ app_name }" />
</h3>

<article>

	<header>
		<h5><spring:message code="about.header" arguments="${ app_name }" /></h5>
	</header>

	<p><spring:message code="about.p1" arguments="${ app_name }" /></p>
	
	<p>
		<spring:message code="about.p2" arguments="${ app_name }" />
		<ul>
			<li><spring:message code="about.p2.ul.li.1" /></li>
			<li><spring:message code="about.p2.ul.li.2" /></li>
			<li><spring:message code="about.p2.ul.li.3" /></li>
			<li><spring:message code="about.p2.ul.li.4" /></li>
			<li><spring:message code="about.p2.ul.li.5" /></li>
			<li><spring:message code="about.p2.ul.li.6" /></li>
			<li><spring:message code="about.p2.ul.li.7" /></li>
		</ul>
	</p>
</article>