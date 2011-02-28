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
