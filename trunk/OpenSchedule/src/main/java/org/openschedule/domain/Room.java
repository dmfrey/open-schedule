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
@RooEntity( table = "room" )
@RooSerializable
@RooJson
public class Room {

	@Column( name = "name", length = 255, nullable = false )
	@Size( min = 1, max = 255 )
	@NotNull
	private String name;

}
