package org.openschedule.domain;

import javax.persistence.Column;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.serializable.RooSerializable;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooEntity( table = "block_comment" )
@RooSerializable
@RooJson
public class BlockComment {

	@Column( name = "name", length = 255, nullable = true )
	@Size( min = 0, max = 255 )
	private String name;

	@Column( name = "email", length = 255, nullable = true )
	@Size( min = 0, max = 255 )
	private String email;

	@Column( name = "comment", length = 1024, nullable = false )
	@Size( min = 1, max = 1024 )
	@NotNull
	private String comment;

}
