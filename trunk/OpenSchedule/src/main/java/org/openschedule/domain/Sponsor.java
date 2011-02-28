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
@RooEntity( table = "sponsor" )
@RooSerializable
@RooJson
public class Sponsor {
	
	@Column( name = "companyName", length = 255, nullable = false )
	@Size( min = 1, max = 255 )
	@NotNull
	private String companyName;
	
	@Column( name = "contactName", length = 255, nullable = false )
	@Size( min = 1, max = 255 )
	@NotNull
	private String contactName;
	
	@Column( name = "contactEmail", length = 255, nullable = true )
	@Size( max = 255 )
	private String contactEmail;
	
	@Column( name = "contactPhone", length = 255, nullable = true )
	@Size( max = 255 )
	private String contactPhone;
	
	@Column( name = "webSite", length = 255, nullable = true )
	@Size( max = 255 )
	private String webSite;

}
