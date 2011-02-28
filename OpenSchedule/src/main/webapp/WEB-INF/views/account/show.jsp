<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<header>
	<h3>Your Account</h3>
</header>

<article>
	
	<p>		
		<ul>
			<li>
				<label for="username">Username:</label>
				${ userAccount.username }
			</li>
			<li>
				<label for="name">Name:</label>
				${ userAccount.name }
			</li>
			<li>
				<label for="email">Email:</label>
				${ userAccount.email }
			</li>
		</ul>
	</p>
	
</article>
