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
@RooEntity(table = "block")
@RooSerializable
@RooJson
public class Block {

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
        return new JSONSerializer()
					.exclude( "*.class" )
					.transform(
						new DateTransformer( "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'" ), Date.class
					).deepSerialize( this );

    }
    
    public static String toJsonArray( Collection<Block> collection ) {
        return new JSONSerializer()
        			.exclude( "*.class" )
        			.transform(
        				new DateTransformer( "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'" ), Date.class
        			).deepSerialize( collection );
    }

}
