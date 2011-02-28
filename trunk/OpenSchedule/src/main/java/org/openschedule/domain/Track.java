/**
 * 
 */
package org.openschedule.domain;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.serializable.RooSerializable;
import org.springframework.roo.addon.tostring.RooToString;

import flexjson.JSONSerializer;

/**
 * @author dmfrey
 *
 */
@RooJavaBean
@RooToString
@RooEntity( table = "track" )
@RooSerializable
@RooJson
public class Track {

	@Column( name = "name", length = 255, nullable = false )
	@Size( min = 1, max = 255 )
	@NotNull
	private String name;

	@ManyToOne( targetEntity = Room.class, fetch = FetchType.LAZY )
	private Room room;

	@ManyToOne( targetEntity = Sponsor.class, fetch = FetchType.LAZY )
	private Sponsor sponsor;

    public String toJson() {
        return new JSONSerializer().exclude( "*.class" ).deepSerialize( this );
    }
    
    public static String toJsonArray( Collection<Track> collection ) {
        return new JSONSerializer().exclude( "*.class" ).deepSerialize( collection );
    }

}
