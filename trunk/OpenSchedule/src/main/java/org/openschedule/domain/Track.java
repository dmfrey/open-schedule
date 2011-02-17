/**
 * 
 */
package org.openschedule.domain;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;
import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.serializable.RooSerializable;
import org.springframework.roo.addon.tostring.RooToString;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;

/**
 * @author dmfrey
 *
 */
@RooJavaBean
@RooToString
@RooEntity( table = "track" )
@RooSerializable
@RooJson
public class Track {

	@Column( name = "name", length = 255, nullable = false )
	@Length( min = 1, max = 255 )
	@NotNull
	private String name;

	@ManyToOne( targetEntity = Room.class, fetch = FetchType.LAZY )
	private Room room;

	@ManyToOne( targetEntity = Sponsor.class, fetch = FetchType.LAZY )
	private Sponsor sponsor;

    public String toJson() {
        return new JSONSerializer().exclude( "*.class" ).deepSerialize( this );
    }
    
    public static String toJsonArray( Collection<Track> collection ) {
        return new JSONSerializer().exclude( "*.class" ).deepSerialize( collection );
    }

    //	public String toJson() {
//		StringBuilder sb = new StringBuilder();
//		
//		sb.append( "{" );
//		sb.append( "\"id\":" ).append( getId() ).append( "," );
//		sb.append( "\"name\":\"" ).append( name.replaceAll( "'", "\'") ).append( "\"," );
//		sb.append( "\"room\":" ).append( getRoom() == null ? null : room.toJson() ).append( "," );
//		sb.append( "\"sponsor\":" ).append( getSponsor() == null ? null : sponsor.toJson() );
//		sb.append( "}" );
//		
//		return sb.toString();
//	}
//	
//    public static String toJsonArray( Collection<Track> collection ) {
//		StringBuilder sb = new StringBuilder();
//
//		sb.append( "[" );
//		if( null != collection ) {
//			int i = 0;
//			for( Track track : collection ) {
//				sb.append( track.toJson() );
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
