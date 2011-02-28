package org.openschedule.domain;

//import java.text.SimpleDateFormat;
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

import flexjson.JSONSerializer;
import flexjson.transformer.DateTransformer;

@RooJavaBean
@RooToString
@RooEntity( table = "day" )
@RooSerializable
@RooJson
public class Day {

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
        return new JSONSerializer()
        			.exclude( "*.class" )
        			.transform(
        				new DateTransformer( "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'" ), Date.class
        			).deepSerialize( this );
    }
    
    public static String toJsonArray( Collection<Day> collection ) {
        return new JSONSerializer()
        			.exclude( "*.class" )
        			.transform(
        				new DateTransformer( "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'" ), Date.class
        			).deepSerialize( collection );
    }

}
