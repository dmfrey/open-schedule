package org.openschedule.domain;

import java.util.Collection;

import javax.persistence.Column;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;
import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.serializable.RooSerializable;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooEntity( table = "speaker" )
@RooSerializable
@RooJson
public class Speaker {

	@Column( name = "name", length = 255, nullable = false )
	@Length( min = 1, max = 255 )
	@NotNull
	private String name;

	@Column( name = "email", length = 255, nullable = true )
	@Length( max = 255 )
	private String email;

	@Column( name = "web_site", length = 255, nullable = true )
	@Length( max = 255 )
	private String webSite;

	@Column( name = "phone", length = 255, nullable = true )
	@Length( max = 255 )
	private String phone;

	@Column( name = "bio", length = 2048, nullable = true )
	@Length( max = 2048 )
	private String bio;

//	public String toJson() {
//		StringBuilder sb = new StringBuilder();
//		
//		sb.append( "{" );
//		sb.append( "\"id\":" ).append( getId() ).append( "," );
//		sb.append( "\"name\":\"" ).append( name ).append( "\"," );
//		sb.append( "\"email\":\"" ).append( email ).append( "\"," );
//		sb.append( "\"webSite\":\"" ).append( webSite ).append( "\"," );
//		sb.append( "\"phone\":\"" ).append( phone ).append( "\"," );
//		sb.append( "\"bio\":\"" ).append( bio.replaceAll( "'", "\'").replaceAll( "\r", " " ).replaceAll( "\n", " " ) ).append( "\"" );
//		sb.append( "}" );
//		
//		return sb.toString();
//	}
//	
//    public static String toJsonArray( Collection<Speaker> collection ) {
//		StringBuilder sb = new StringBuilder();
//
//		sb.append( "[" );
//		if( null != collection ) {
//			int i = 0;
//			for( Speaker speaker : collection ) {
//				sb.append( speaker.toJson() );
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
