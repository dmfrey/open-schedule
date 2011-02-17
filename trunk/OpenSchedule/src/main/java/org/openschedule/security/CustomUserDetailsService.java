package org.openschedule.security;

import org.apache.log4j.Logger;
import org.openschedule.domain.UserAccount;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

public class CustomUserDetailsService implements UserDetailsService {

	private static final Logger log = Logger.getLogger( CustomUserDetailsService.class );
	
	@Override
	public UserDetails loadUserByUsername( String username ) throws UsernameNotFoundException, DataAccessException {
		log.trace( "loadUserByUsername : enter" );
		
		if( log.isTraceEnabled() ) {
			log.trace( "loadUserByUsername : username=" + username );
		}

		UserAccount userAccount = null;
		try {
			userAccount = UserAccount.findUserAccount( username );
			//if( log.isTraceEnabled() ) {
			//	log.trace( "loadUserByUsername : userAccount=" + userAccount.toString() );
			//}
		} catch( EmptyResultDataAccessException e ) {
			log.warn( "loadUserByUsername : username not found" );
			throw new UsernameNotFoundException( username, e );
		}
		
		log.trace( "loadUserByUsername : exit" );
		return userAccount;
	}

}
