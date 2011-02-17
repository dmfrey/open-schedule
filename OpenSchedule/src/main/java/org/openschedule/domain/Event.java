package org.openschedule.domain;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.EntityManager;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.TypedQuery;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.serializable.RooSerializable;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooEntity( table="EVENT", finders = { "findEventsByUsername", "findEventsByShortName" } )
@RooSerializable
@RooJson
public class Event {

	private static final SimpleDateFormat sdf = new SimpleDateFormat( "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'" );
	
	@Column( name = "name", length = 255, nullable = false )
	@NotNull
	private String name;
	
	@Column( name = "short_name", length = 10, nullable = false, unique = true )
	@Pattern( regexp = "([A-Za-z0-9-_]+)" )
	@NotNull
	private String shortName;
	
	@Column( name = "publish_date", nullable = true )
	@Temporal( TemporalType.DATE )
	@DateTimeFormat( pattern = "yyyy-MM-dd" )
	private Date publishDate;
	
	@Column( name = "start_date", nullable = false )
	@Temporal( TemporalType.DATE )
	@DateTimeFormat( pattern = "yyyy-MM-dd" )
	@NotNull
	private Date startDate = new Date();
	
	@Column( name = "end_date", nullable = true )
	@Temporal( TemporalType.DATE )
	@DateTimeFormat( pattern = "yyyy-MM-dd" )
	private Date endDate;

	@Column( name = "days", nullable = false )
	@NotNull
	private Integer numberOfDays = new Integer( 1 );

	@Column( name = "username", length = 255, nullable = false )
	@NotNull
	private String username;

	@OneToMany( targetEntity = Track.class, cascade = CascadeType.ALL, fetch = FetchType.LAZY )
	@JoinColumn( name = "event_id" )
	private List<Track> tracks = new ArrayList<Track>();

	@OneToMany( targetEntity = Day.class, cascade = CascadeType.ALL, fetch = FetchType.LAZY )
	@JoinColumn( name = "event_id" )
	private List<Day> days = new ArrayList<Day>();

	@OneToMany( targetEntity = Venue.class, cascade = CascadeType.ALL, fetch = FetchType.LAZY )
	@JoinColumn( name = "event_id" )
	private List<Venue> venues = new ArrayList<Venue>();

	@OneToMany( targetEntity = Sponsor.class, cascade = CascadeType.ALL, fetch = FetchType.LAZY )
	@JoinColumn( name = "event_id" )
	private List<Sponsor> sponsors = new ArrayList<Sponsor>();

	@OneToMany( targetEntity = Label.class, cascade = CascadeType.ALL, fetch = FetchType.LAZY )
	@JoinColumn( name = "event_id" )
	private List<Label> labels = new ArrayList<Label>();

	@OneToMany( targetEntity = Session.class, cascade = CascadeType.ALL, fetch = FetchType.LAZY )
	@JoinColumn( name = "event_id" )
	private List<Session> sessions = new ArrayList<Session>();

	@OneToMany( targetEntity = Speaker.class, cascade = CascadeType.ALL, fetch = FetchType.LAZY )
	@JoinColumn( name = "event_id" )
	private List<Speaker> speakers = new ArrayList<Speaker>();

	@OneToMany( targetEntity = EventComment.class, cascade = CascadeType.ALL, fetch = FetchType.LAZY )
	@JoinColumn( name = "event_id" )
	private List<EventComment> comments = new ArrayList<EventComment>();

	public static long countEventsByUsername( String username ) {
    	if( null == username || username.length() == 0 ) {
    		throw new IllegalArgumentException( "username is required" );
    	}
    	
        return entityManager().createQuery( "select count(o) from Event o where o.username = ?1", Long.class ).setParameter( 1, username ).getSingleResult();
    }

    public static List<Event> findEventEntriesByUsername( String username, int firstResult, int maxResults ) {
        return entityManager().createQuery( "select o from Event o where o.username = ?1", Event.class ).setParameter( 1, username ).setFirstResult( firstResult ).setMaxResults( maxResults ).getResultList();
    }

    public String toJson() {
		StringBuilder sb = new StringBuilder();
		
		sb.append( "{" );
		sb.append( "\"id\":" ).append( getId() ).append( "," );
		sb.append( "\"name\":\"" ).append( name.replaceAll( "'", "\'") ).append( "\"," );
		sb.append( "\"shortName\":\"" ).append( shortName ).append( "\"," );
		if( null != publishDate ) {
			sb.append( "\"publishDate\":\"" ).append( sdf.format( publishDate ) ).append( "\"," );
		}
		sb.append( "\"startDate\":\"" ).append( null != getStartDate() ? sdf.format( startDate ) : null ).append( "\"," );
		sb.append( "\"endDate\":\"" ).append( null != getEndDate() ? sdf.format( endDate ) : null ).append( "\"," );
		sb.append( "\"numberOfDays\":\"" ).append( numberOfDays ).append( "\"," );
		sb.append( "\"days\":" ).append( Day.toJsonArray( days ) ).append( "," );
		sb.append( "\"venues\":" ).append( Venue.toJsonArray( venues ) );
		sb.append( "}" );
		
		return sb.toString();
	}
	
    public String toJsonSummary() {
		StringBuilder sb = new StringBuilder();
		
		sb.append( "{" );
		sb.append( "\"id\":" ).append( getId() ).append( "," );
		sb.append( "\"name\":\"" ).append( name.replaceAll( "'", "\'") ).append( "\"," );
		sb.append( "\"shortName\":\"" ).append( shortName ).append( "\"" );
		sb.append( "}" );
		
		return sb.toString();
	}

    public static String toJsonArray( Collection<Event> collection ) {
		StringBuilder sb = new StringBuilder();

		sb.append( "[" );
		if( null != collection ) {
			int i = 0;
			for( Event event : collection ) {
				sb.append( event.toJson() );

				if( i < ( collection.size() - 1 ) ) {
					sb.append( "," );
				}

				i++;
			}
		}
		sb.append( "]" );
		
		return sb.toString();
    }

    public static String toJsonSummaryArray( Collection<Event> collection ) {
		StringBuilder sb = new StringBuilder();

		sb.append( "[" );
		if( null != collection ) {
			int i = 0;
			for( Event event : collection ) {
				sb.append( event.toJsonSummary() );

				if( i < ( collection.size() - 1 ) ) {
					sb.append( "," );
				}

				i++;
			}
		}
		sb.append( "]" );
		
		return sb.toString();
    }

    public static TypedQuery<Event> findPublishedEventsByShortName( String shortName ) {
        if( shortName == null || shortName.length() == 0 ) throw new IllegalArgumentException( "The shortName argument is required" );
        
        Calendar today = new GregorianCalendar();
        
        EntityManager em = Event.entityManager();
        TypedQuery<Event> q = em.createQuery( "SELECT Event FROM Event AS event WHERE event.publishDate is not null and event.publishDate <= :today and event.shortName = :shortName", Event.class );
        q.setParameter( "today", today.getTime() );
        q.setParameter( "shortName", shortName );
        return q;
    }

    public static List<Event> findPublishedEvents() {
        Calendar today = new GregorianCalendar();
    	
        return entityManager().createQuery( "select o from Event o where o.publishDate is not null and o.publishDate <= ?1 and o.endDate >= ?2", Event.class ).setParameter( 1, today.getTime() ).setParameter( 2, today.getTime() ).getResultList();
    }

}
