package org.openschedule.domain;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.serializable.RooSerializable;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

@RooJavaBean
@RooEntity( table = "USER_ACCOUNT" )
@RooSerializable
public class UserAccount implements UserDetails {

	@Column( name = "username", length = 255, nullable = false, unique = true )
	@NotNull
	@Size( min = 1, max = 255 )
	private String username;
	
	@Column( name = "password", length = 255, nullable = false )
	@NotNull
	@Size( min = 1, max = 255 )
	private String password;

	private boolean enabled = true;
	
	private boolean accountNonExpired = true;
	
	private boolean accountNonLocked = true;
	
	private boolean credentialsNonExpired = true;
	
	@Column( name = "name", length = 255, nullable = false )
	@NotNull
	@Size( min = 1, max = 255 )
	private String name;
	
	@Column( name = "email", length = 255, nullable = false, unique = true )
	@NotNull
	@Size( min = 1, max = 255 )
	private String email;

	@OneToMany( targetEntity = Authority.class, fetch = FetchType.EAGER, cascade = CascadeType.ALL )
	@JoinColumn( name = "username", referencedColumnName = "username" )
	private List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
	
	public static UserAccount findUserAccount( String username ) {
		if( username == null ) return null;
		return entityManager().createQuery( "select o from UserAccount o where username = ?1", UserAccount.class ).setParameter( 1, username ).getSingleResult();
	}

}
