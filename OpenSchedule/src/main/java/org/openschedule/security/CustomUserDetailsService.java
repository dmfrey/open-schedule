/**
 *  This file is part of OpenSchedule
 * 
 *  OpenSchedule is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  OpenSchedule is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with OpenSchedule.  If not, see <http://www.gnu.org/licenses/>.
 *   
 * @author Daniel Frey <dmfrey at gmail dot com>
 * 
 * This software can be found at <http://code.google.com/p/open-schedule/>
 *
 */
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
