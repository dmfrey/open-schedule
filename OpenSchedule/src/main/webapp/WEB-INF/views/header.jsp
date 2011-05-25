<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<header id="page_header">

	<h1>OpenSchedule</h1>

	<nav>
		<ul>
			<li>
				<spring:url value="/public" var="public_url" />
				<a href="${ public_url }">Published Events</a>
			</li>
			<li>
				<spring:url value="/events/list/user" var="events_url" />
				<a href="${ events_url }">My Events</a>
			</li>
			<security:authorize ifAnyGranted="ROLE_USER,ROLE_ADMIN">
			<li>
				<security:authentication var="userId" property="principal.id" /> 
				<spring:url value="/account/${ userId }?form" var="account_url" />
				<a href="${ account_url }">Account</a>
			</li>
			<li>
				<spring:url value="/resources/j_spring_security_logout" var="logout_url" />
				<a href="${ logout_url }">Logout</a>
			</li>
			</security:authorize>
		</ul>
	</nav>
	
	<security:authorize ifAnyGranted="ROLE_USER,ROLE_ADMIN">
	<div>
		Welcome <security:authentication property="principal.name" />
	</div>
	</security:authorize>
	
</header>