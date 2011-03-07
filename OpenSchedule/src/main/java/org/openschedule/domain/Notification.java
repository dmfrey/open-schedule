package org.openschedule.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
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
	
}
