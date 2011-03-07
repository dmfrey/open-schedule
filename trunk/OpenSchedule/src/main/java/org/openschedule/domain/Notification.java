package org.openschedule.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.TypedQuery;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.serializable.RooSerializable;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooEntity( table = "notification" )
@RooSerializable
@RooJson
public class Notification {
	
	@Column( name = "status_title", length = 128, nullable = false )
	@NotNull
	private String statusTitle;
	
	@Column( name = "status_message", length = 255, nullable = false )
	@NotNull
	private String statusMessage;
	
	@Column( name = "title", length = 128, nullable = false )
	@NotNull
	private String title;
	
	@Column( name = "message", length = 255, nullable = false )
	@NotNull
	private String message;
	
	@Column( name = "create_date", nullable = false )
	@Temporal( TemporalType.DATE )
	@DateTimeFormat( pattern = "yyyy-MM-dd" )
	private Date created;
	
	@Column( name = "duration", nullable = false )
	@NotNull
	private Integer duration;
	
	@Column( name = "active", nullable = false )
	@NotNull
	private Boolean active;
	
	public Notification() {
		created = new Date();
		duration = 5;
		active = Boolean.TRUE;
	}
	
    public static Query findActiveNotifications( Long eventId ) {
        if( eventId == null ) throw new IllegalArgumentException( "The eventId argument is required" );
        
        EntityManager em = Event.entityManager();
        Query q = em.createNativeQuery( "SELECT n.* FROM notification n WHERE n.active is true and n.event_id = :eventId", Notification.class );
        q.setParameter( "eventId", eventId );
        return q;
    }

}
