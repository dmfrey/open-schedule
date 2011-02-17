package org.openschedule.domain;

import javax.persistence.Column;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.NotNull;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.serializable.RooSerializable;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.security.core.GrantedAuthority;

@RooJavaBean
@RooToString
@RooEntity( table = "USER_AUTHORITY" )
@RooSerializable
@Table( 
	name = "USER_AUTHORITY",
	uniqueConstraints = {
		@UniqueConstraint( columnNames = { "username", "authority" } )
	}
)
public class Authority implements GrantedAuthority {

	@Column( name = "username", length = 255, nullable = false )
	@NotNull
	private String username;
	
	@Column( name = "authority", length = 255, nullable = false )
	@NotNull
	private String authority;
	
}
