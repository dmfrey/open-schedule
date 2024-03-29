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
package org.openschedule.domain;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.serializable.RooSerializable;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

@RooJavaBean
@RooEntity( table = "USER_ACCOUNT", finders = { "findUserAccountsByUsernameEquals", "findUserAccountsByEmailEquals" } )
@RooSerializable
@RooToString
@Table( 
	name = "USER_ACCOUNT",
	uniqueConstraints = {
		@UniqueConstraint( columnNames = { "username", "email" } )
	}
)
public class UserAccount implements UserDetails {

	@Column( name = "username", length = 255, nullable = false, unique = true )
	@NotNull
	@Size( min = 1, max = 255 )
	private String username;
	
	@Column( name = "password", length = 255, nullable = false )
	@NotNull
	@Size( min = 1, max = 255 )
	private String password;

	@Column( name = "enabled", nullable = false )
	private boolean enabled = true;
	
	@Column( name = "account_non_expired", nullable = false )
	private boolean accountNonExpired = true;
	
	@Column( name = "account_non_locked", nullable = false )
	private boolean accountNonLocked = true;
	
	@Column( name = "credentials_non_expired", nullable = false )
	private boolean credentialsNonExpired = true;
	
	@Column( name = "name", length = 255, nullable = false )
	@NotNull
	@Size( min = 1, max = 255 )
	private String name;
	
	@Column( name = "email", length = 255, nullable = false, unique = true )
	@NotNull
	@Size( min = 1, max = 255 )
	private String email;


	/* (non-Javadoc)
	 * @see org.springframework.security.core.userdetails.UserDetails#getAuthorities()
	 */
	@Override
	public Collection<GrantedAuthority> getAuthorities() {
		
		List<Authority> authorities = Authority.findAuthoritysByUsername( username ).getResultList();
		Collection<GrantedAuthority> grantedAuthorities = new ArrayList<GrantedAuthority>( authorities.size() );
		for( Authority authority : authorities ) {
			grantedAuthorities.add( authority );
		}
		return grantedAuthorities;
	}


	public static UserAccount findUserAccount( String username ) {
		if( username == null ) return null;
		return entityManager().createQuery( "select o from UserAccount o where username = ?1", UserAccount.class ).setParameter( 1, username ).getSingleResult();
	}

}
