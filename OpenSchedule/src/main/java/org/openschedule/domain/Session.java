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

import org.hibernate.validator.constraints.Length;
import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.serializable.RooSerializable;
import org.springframework.roo.addon.tostring.RooToString;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;

@RooJavaBean
@RooToString
@RooEntity( table = "session" )
@RooSerializable
@RooJson
public class Session {

	@Column( name = "name", length = 255, nullable = false )
	@Length( min = 1, max = 255 )
	@NotNull
	private String name;

	@Column( name = "description", length = 2048, nullable = false )
	@Length( min = 1, max = 2048 )
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

    //	public String toJson() {
//		StringBuilder sb = new StringBuilder();
//		
//		sb.append( "{" );
//		sb.append( "\"id\":" ).append( getId() ).append( "," );
//		sb.append( "\"name\":\"" ).append( name ).append( "\"," );
//		sb.append( "\"description\":\"" ).append( description.replaceAll( "'", "\'").replaceAll( "\r", " " ).replaceAll( "\n", " " ) ).append( "\"," );
//		sb.append( "\"speakers\":" ).append( Speaker.toJsonArray( speakers ) );
//		sb.append( "}" );
//		
//		return sb.toString();
//	}
//	
//    public static String toJsonArray( Collection<Session> collection ) {
//		StringBuilder sb = new StringBuilder();
//
//		sb.append( "[" );
//		if( null != collection ) {
//			int i = 0;
//			for( Session session : collection ) {
//				sb.append( session.toJson() );
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
