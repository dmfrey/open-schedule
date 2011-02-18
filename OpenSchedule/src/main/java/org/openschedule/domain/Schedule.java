package org.openschedule.domain;

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
import javax.validation.constraints.NotNull;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.serializable.RooSerializable;
import org.springframework.roo.addon.tostring.RooToString;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import flexjson.transformer.DateTransformer;

@RooJavaBean
@RooToString
@RooEntity( table = "schedule" )
@RooSerializable
@RooJson
public class Schedule {

	@Column( name = "blocks", nullable = false )
	@NotNull
	private Integer blocksPerSchedule;
	
	@ManyToOne( targetEntity = Track.class, fetch = FetchType.LAZY )
	private Track track;
	
	@ManyToOne( targetEntity = Day.class, fetch = FetchType.LAZY )
	private Day day;

	@OneToMany( targetEntity = Block.class, cascade = CascadeType.ALL, fetch = FetchType.LAZY )
	@JoinColumn( name = "schedule_id" )
	private List<Block> blocks = new ArrayList<Block>();

    public String toJson() {
        return new JSONSerializer()
			.exclude( "*.class" )
			.transform(
				new DateTransformer( "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'" ), Date.class
			).deepSerialize( this );
    }
    
    public static String toJsonArray( Collection<Schedule> collection ) {
        return new JSONSerializer()
			.exclude( "day", "*.class" )
			.transform(
				new DateTransformer( "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'" ), Date.class
			).deepSerialize( collection );
    }

    //	public String toJson() {
//		StringBuilder sb = new StringBuilder();
//		
//		sb.append( "{" );
//		sb.append( "\"id\":" ).append( getId() ).append( "," );
//		sb.append( "\"blocksPerSchedule\":" ).append( blocksPerSchedule ).append( "," );
//		sb.append( "\"track\":" ).append( getTrack() == null ? null : track.toJson() ).append( "," );
//		sb.append( "\"blocks\":" ).append( Block.toJsonArray( blocks ) );
//		sb.append( "}" );
//		
//		return sb.toString();
//	}
//	
//    public static String toJsonArray( Collection<Schedule> collection ) {
//		StringBuilder sb = new StringBuilder();
//
//		sb.append( "[" );
//		if( null != collection ) {
//			int i = 0;
//			for( Schedule schedule : collection ) {
//				sb.append( schedule.toJson() );
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
