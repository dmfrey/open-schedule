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

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
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
@RooEntity( table = "venue" )
@RooSerializable
@RooJson
public class Venue {

	@Column( name = "name", length = 255, nullable = false )
	@Size( min = 1, max = 255 )
	@NotNull
	private String name;

	@Column( name = "address_1", length = 255, nullable = true )
	@Size( max = 255 )
	private String addressOne;

	@Column( name = "address_2", length = 255, nullable = true )
	@Size( max = 255 )
	private String addressTwo;

	@Column( name = "city", length = 255, nullable = true )
	@Size( max = 255 )
	private String city;

	@Column( name = "state", length = 2, nullable = true )
	@Size( max = 2 )
	private String state;

	@Column( name = "zip", length = 10, nullable = true )
	@Size( max = 10 )
	private String zip;

	@Column( name = "web_site", length = 255, nullable = true )
	@Size( max = 255 )
	private String webSite;

	@Column( name = "email", length = 255, nullable = true )
	@Size( max = 255 )
	private String email;

	@Column( name = "phone", length = 255, nullable = true )
	@Size( max = 255 )
	private String phone;

	@OneToMany( targetEntity = Room.class, cascade = CascadeType.ALL, fetch = FetchType.LAZY )
	@JoinColumn( name = "venue_id" )
	private List<Room> rooms = new ArrayList<Room>();

    public String toJson() {
        return new JSONSerializer().exclude( "*.class" ).deepSerialize( this );
    }
    
    public static String toJsonArray( Collection<Venue> collection ) {
        return new JSONSerializer().exclude( "*.class" ).deepSerialize(collection );
    }

    //	public String toJson() {
//		StringBuilder sb = new StringBuilder();
//		
//		sb.append( "{" );
//		sb.append( "\"id\":" ).append( getId() ).append( "," );
//		sb.append( "\"name\":\"" ).append( name.replaceAll( "'", "\'") ).append( "\"," );
//		sb.append( "\"addressOne\":\"" ).append( addressOne.replaceAll( "'", "\'") ).append( "\"," );
//		sb.append( "\"addressTwo\":\"" ).append( addressTwo.replaceAll( "'", "\'") ).append( "\"," );
//		sb.append( "\"city\":\"" ).append( city ).append( "\"," );
//		sb.append( "\"state\":\"" ).append( state ).append( "\"," );
//		sb.append( "\"zip\":\"" ).append( zip ).append( "\"," );
//		sb.append( "\"webSite\":\"" ).append( webSite ).append( "\"," );
//		sb.append( "\"email\":\"" ).append( email ).append( "\"," );
//		sb.append( "\"phone\":\"" ).append( phone ).append( "\"," );
//		sb.append( "\"rooms\":" ).append( Room.toJsonArray( rooms ) );
//		sb.append( "}" );
//		
//		return sb.toString();
//	}
//	
//    public static String toJsonArray( Collection<Venue> collection ) {
//		StringBuilder sb = new StringBuilder();
//
//		sb.append( "[" );
//		if( null != collection ) {
//			int i = 0;
//			for( Venue venue : collection ) {
//				sb.append( venue.toJson() );
//
//				if( i < ( collection.size() - 1 ) ) {
//					sb.append( "," );
//				}
//
//				i++;
//			}
//		}
//		sb.append( "]" );
//		
//		return sb.toString();
//    }

}
