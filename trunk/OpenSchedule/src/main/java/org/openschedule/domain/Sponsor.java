package org.openschedule.domain;

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
@RooEntity( table = "sponsor" )
@RooSerializable
@RooJson
public class Sponsor {
	
	@Column( name = "companyName", length = 255, nullable = false )
	@Length( min = 1, max = 255 )
	@NotNull
	private String companyName;
	
	@Column( name = "contactName", length = 255, nullable = false )
	@Length( min = 1, max = 255 )
	@NotNull
	private String contactName;
	
	@Column( name = "contactEmail", length = 255, nullable = true )
	@Length( max = 255 )
	private String contactEmail;
	
	@Column( name = "contactPhone", length = 255, nullable = true )
	@Length( max = 255 )
	private String contactPhone;
	
	@Column( name = "webSite", length = 255, nullable = true )
	@Length( max = 255 )
	private String webSite;

//	public String toJson() {
//		StringBuilder sb = new StringBuilder();
//		
//		sb.append( "{" );
//		sb.append( "\"id\":" ).append( getId() ).append( "," );
//		sb.append( "\"companyName\":\"" ).append( companyName.replaceAll( "'", "\'") ).append( "\"," );
//		sb.append( "\"contactName\":\"" ).append( contactName ).append( "\"," );
//		sb.append( "\"contactEmail\":\"" ).append( contactEmail ).append( "\"," );
//		sb.append( "\"contactPhone\":\"" ).append( contactPhone ).append( "\"," );
//		sb.append( "\"webSite\":\"" ).append( webSite ).append( "\"" );
//		sb.append( "}" );
//		
//		return sb.toString();
//	}
//	
//    public static String toJsonArray( Collection<Sponsor> collection ) {
//		StringBuilder sb = new StringBuilder();
//
//		sb.append( "[" );
//		if( null != collection ) {
//			int i = 0;
//			for( Sponsor sponsor : collection ) {
//				sb.append( sponsor.toJson() );
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
