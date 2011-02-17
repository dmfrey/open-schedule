package org.openschedule.domain;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.serializable.RooSerializable;
import org.springframework.roo.addon.tostring.RooToString;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;

@RooJavaBean
@RooToString
@RooEntity(table = "block")
@RooSerializable
@RooJson
public class Block {

	private static final SimpleDateFormat sdf = new SimpleDateFormat( "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'" );

	@Column( name = "date", nullable = true )
	@Temporal( TemporalType.DATE )
	@DateTimeFormat( pattern = "yyyy-MM-dd" )
	private Date date;
	
	@Column( name = "duration", nullable = true )
	private Integer duration = new Integer( 60 );
	
	@ManyToOne( targetEntity = Label.class, fetch = FetchType.LAZY )
	private Label label;

	@ManyToOne( targetEntity = Session.class, fetch = FetchType.LAZY )
	private Session session;

	@OneToMany( targetEntity = BlockComment.class, cascade = CascadeType.ALL, fetch = FetchType.LAZY )
	@JoinColumn( name = "block_id" )
	private List<BlockComment> comments = new ArrayList<BlockComment>();

    public String toJson() {
        return new JSONSerializer().exclude( "*.class" ).deepSerialize( this );
    }
    
    public static String toJsonArray( Collection<Block> collection ) {
        return new JSONSerializer().exclude( "*.class" ).deepSerialize( collection );
    }

    //	public String toJson() {
//		StringBuilder sb = new StringBuilder();
//		
//		sb.append( "{" );
//		sb.append( "\"id\":" ).append( getId() ).append( "," );
//		sb.append( "\"date\":" ).append( getDate() == null ? null : ( "\"" + sdf.format( date ) + "\"" ) ).append( "," ); 
//		sb.append( "\"duration\":" ).append( duration ).append( "," );
//		sb.append( "\"label\":" ).append( getLabel() == null ? null : label.toJson() ).append( "," );
//		sb.append( "\"session\":" ).append( getSession() == null ? null : session.toJson() );
//		sb.append( "}" );
//		
//		return sb.toString();
//	}
//	
//    public static String toJsonArray( Collection<Block> collection ) {
//		StringBuilder sb = new StringBuilder();
//
//		sb.append( "[" );
//		if( null != collection ) {
//			int i = 0;
//			for( Block block : collection ) {
//				sb.append( block.toJson() );
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
