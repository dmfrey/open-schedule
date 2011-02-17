/**
 * 
 */
package org.openschedule.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.openid.OpenIDAttribute;
import org.springframework.security.openid.OpenIDAuthenticationStatus;
import org.springframework.security.openid.OpenIDAuthenticationToken;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;

/**
 * @author dmfrey
 *
 */
public class OpenIDAuthenticationFailureHandler extends SimpleUrlAuthenticationFailureHandler {

	private static final Logger log = Logger.getLogger( OpenIDAuthenticationFailureHandler.class );
	
	@Override
	public void onAuthenticationFailure( HttpServletRequest request, HttpServletResponse response, AuthenticationException exception ) throws IOException, ServletException {
		log.info( "onAuthenticationFailure : enter" );
		
		if( exception instanceof UsernameNotFoundException
		        && exception.getAuthentication() instanceof	OpenIDAuthenticationToken
		        && ( (OpenIDAuthenticationToken) exception.getAuthentication() ).getStatus().equals( OpenIDAuthenticationStatus.SUCCESS ) ) 
		{	      
		
			String username = null, firstName = null, lastName = null, email = null;

			if( log.isInfoEnabled() ) {
				log.info( "onAuthenticationFailure : exception instanceof UsernameNotFoundException" + ( exception instanceof UsernameNotFoundException ) );
				log.info( "onAuthenticationFailure : exception.getAuthentication() instanceof	OpenIDAuthenticationToken=" + ( exception.getAuthentication() instanceof OpenIDAuthenticationToken ) );
				log.info( "onAuthenticationFailure : status == OpenIDAuthenticationStatus.SUCCESS=" + ( (OpenIDAuthenticationToken) exception.getAuthentication() ).getStatus().equals( OpenIDAuthenticationStatus.SUCCESS ) );
							
				OpenIDAuthenticationToken openIdAuth = (OpenIDAuthenticationToken) exception.getAuthentication();
				for( OpenIDAttribute attr : openIdAuth.getAttributes() ) {
					log.info( "onAuthenticationFailure : Attribute=" + attr.getName() + ", Type=" + attr.getType() + ", Count=" + attr.getCount() );
					for( String value : attr.getValues() ) {
						log.info( "onAuthenticationFailure : Value=" + value );
						
						if( attr.getName().equalsIgnoreCase( "username" ) ) {
							username = value;
						}

						if( attr.getName().equalsIgnoreCase( "firstName" ) ) {
							firstName = value;
						}

						if( attr.getName().equalsIgnoreCase( "lastName" ) ) {
							lastName = value;
						}

						if( attr.getName().equalsIgnoreCase( "email" ) ) {
							email = value;
						}
					}
				}
			}
			
			DefaultRedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
			request.getSession( true ).setAttribute( "USER_OPENID_CREDENTIAL", exception.getAuthentication().getPrincipal() );
			
			if( null != username ) {
				request.getSession().setAttribute( "USER_OPENID_USERNAME", username );
			} else {
				request.getSession().setAttribute( "USER_OPENID_USERNAME", exception.getAuthentication().getPrincipal() );
			}

			if( null != firstName && null != lastName ) {
				request.getSession().setAttribute( "USER_OPENID_NAME", ( firstName + " " + lastName ) );
			} else {
				request.getSession().setAttribute( "USER_OPENID_NAME", "New User" );
			}
			
			if( null != email ) {
				request.getSession().setAttribute( "USER_OPENID_EMAIL", email );
			} else {
				request.getSession().setAttribute( "USER_OPENID_EMAIL", "none" );
			}

			// redirect to create account page
			log.info( "onAuthenticationFailure : exit, redirecting to /register" );
			redirectStrategy.sendRedirect( request, response, "/register/openid" );
	    } else {
			log.info( "onAuthenticationFailure : exit" );
	    	super.onAuthenticationFailure( request, response, exception );
	    }
	}

}
