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
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.serializable.RooSerializable;
import org.springframework.roo.addon.tostring.RooToString;

import flexjson.JSONSerializer;

@RooJavaBean
@RooToString
@RooEntity( table = "session" )
@RooSerializable
@RooJson
public class Session {

	@Column( name = "name", length = 255, nullable = false )
	@Size( min = 1, max = 255 )
	@NotNull
	private String name;

	@Column( name = "description", length = 2048, nullable = false )
	@Size( min = 1, max = 2048 )
	@NotNull
	private String description;

	@ManyToMany( targetEntity = Speaker.class, fetch = FetchType.LAZY )
	@JoinTable(
		name = "SESSION_SPEAKERS",
		joinColumns = {
			@JoinColumn( name = "session_id", referencedColumnName = "id" )
		},
		inverseJoinColumns = {
			@JoinColumn( name = "speaker_id", referencedColumnName = "id" )
		}
	)
	private List<Speaker> speakers = new ArrayList<Speaker>();

    public String toJson() {
        return new JSONSerializer().exclude( "*.class" ).deepSerialize( this );
    }
    
    public static String toJsonArray( Collection<Session> collection ) {
        return new JSONSerializer().exclude( "*.class" ).deepSerialize( collection );
    }

}
