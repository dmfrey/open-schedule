<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div>

	<spring:message var="title" code="error_resourcenotfound_title" />
	<h2>${ fn:escapeXml( title ) }</h2>
    
    <p>
      <spring:message code="error_resourcenotfound_problemdescription" />
    </p>

    <c:if test="${ not empty exception }">
    <p>
        <h4>
          <spring:message code="exception_details" />
        </h4>
        
        <div>
	        <spring:message var="message" code="exception_message" />
        	<c:out value="${ exception.localizedMessage }" />
        </div>
        
        <div>
	        <spring:message var="stacktrace" code="exception_stacktrace" />
        	<c:forEach items="${ exception.stackTrace }" var="trace">
            	<c:out value="${ trace }" />
            	<br />
          	</c:forEach>
        </div>
    </p>
    </c:if>
	
</div>