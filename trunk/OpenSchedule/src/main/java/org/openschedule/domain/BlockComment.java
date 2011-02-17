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
@RooEntity( table = "block_comment" )
@RooSerializable
@RooJson
public class BlockComment {

	@Column( name = "name", length = 255, nullable = true )
	@Length( min = 0, max = 255 )
	private String name;

	@Column( name = "email", length = 255, nullable = true )
	@Length( min = 0, max = 255 )
	private String email;

	@Column( name = "comment", length = 1024, nullable = false )
	@Length( min = 1, max = 1024 )
	@NotNull
	private String comment;

//	public String toJson() {
//		StringBuilder sb = new StringBuilder();
//		
//		sb.append( "{" );
//		sb.append( "\"id\":" ).append( getId() ).append( "," );
//		sb.append( "\"name\":\"" ).append( name ).append( "\"," );
//		sb.append( "\"email\":\"" ).append( email ).append( "\"," );
//		sb.append( "\"comment\":\"" ).append( comment ).append( "\"" );
//		sb.append( "}" );
//		
//		return sb.toString();
//	}
//	
//    public static String toJsonArray( Collection<BlockComment> collection ) {
//		StringBuilder sb = new StringBuilder();
//
//		sb.append( "[" );
//		if( null != collection ) {
//			int i = 0;
//			for( BlockComment sessionComment : collection ) {
//				sb.append( sessionComment.toJson() );
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
