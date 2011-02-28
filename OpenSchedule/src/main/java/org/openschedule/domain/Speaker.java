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
@RooEntity( table = "speaker" )
@RooSerializable
@RooJson
public class Speaker {

	@Column( name = "name", length = 255, nullable = false )
	@Size( min = 1, max = 255 )
	@NotNull
	private String name;

	@Column( name = "email", length = 255, nullable = true )
	@Size( max = 255 )
	private String email;

	@Column( name = "web_site", length = 255, nullable = true )
	@Size( max = 255 )
	private String webSite;

	@Column( name = "phone", length = 255, nullable = true )
	@Size( max = 255 )
	private String phone;

	@Column( name = "bio", length = 2048, nullable = true )
	@Size( max = 2048 )
	private String bio;

}
