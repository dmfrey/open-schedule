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
@RooEntity( table = "day" )
@RooSerializable
@RooJson
public class Day {

	private static final SimpleDateFormat sdf = new SimpleDateFormat( "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'" );
	
	@Column( name = "event_date", nullable = true )
	@Temporal( TemporalType.DATE )
	@DateTimeFormat( pattern = "yyyy-MM-dd" )
	private Date date;

	@Column( name = "schedules", nullable = true )
	private Integer numberOfSchedules;
	
	@OneToMany( targetEntity = Schedule.class, cascade = CascadeType.ALL, fetch = FetchType.LAZY )
	@JoinColumn( name = "day_id" )
	private List<Schedule> schedules = new ArrayList<Schedule>();

	public Day() { }
	
	public Day( Date date ) {
		this.date = date;
	}
	
    public String toJson() {
        return new JSONSerializer().exclude( "*.class" ).deepSerialize( this );
    }
    
    public static String toJsonArray( Collection<Day> collection ) {
        return new JSONSerializer().exclude( "*.class" ).deepSerialize( collection );
    }

    //	public String toJson() {
//		StringBuilder sb = new StringBuilder();
//		
//		sb.append( "{" );
//		sb.append( "\"id\":" ).append( getId() ).append( "," );
//		sb.append( "\"date\":\"" ).append( null != getDate() ? sdf.format( date ) : null ).append( "\"," );
//		sb.append( "\"numberOfSchedules\":" ).append( numberOfSchedules ).append( "," );
//		sb.append( "\"schedules\":" ).append( Schedule.toJsonArray( schedules ) );
//		sb.append( "}" );
//		
//		return sb.toString();
//	}
//	
//    public static String toJsonArray( Collection<Day> collection ) {
//		StringBuilder sb = new StringBuilder();
//
//		sb.append( "[" );
//		if( null != collection ) {
//			int i = 0;
//			for( Day day : collection ) {
//				sb.append( day.toJson() );
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
