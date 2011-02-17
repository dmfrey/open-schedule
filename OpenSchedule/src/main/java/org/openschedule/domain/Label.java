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
@RooEntity( table = "label" )
@RooSerializable
@RooJson
public class Label {

	@Column( name = "name", length = 10, nullable = false )
	@Length( min = 1, max = 10 )
	@NotNull
	private String name;

//	public String toJson() {
//		StringBuilder sb = new StringBuilder();
//		
//		sb.append( "{" );
//		sb.append( "\"id\":" ).append( getId() ).append( "," );
//		sb.append( "\"name\":\"" ).append( name ).append( "\"" );
//		sb.append( "}" );
//		
//		return sb.toString();
//	}
//	
//    public static String toJsonArray( Collection<Label> collection ) {
//		StringBuilder sb = new StringBuilder();
//
//		sb.append( "[" );
//		if( null != collection ) {
//			int i = 0;
//			for( Label label : collection ) {
//				sb.append( label.toJson() );
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
