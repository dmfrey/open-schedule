/**
 * 
 */
package org.openschedule.web;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author dmfrey
 *
 */
@RequestMapping( value = "/index" )
@Controller
public class IndexController {

	private static final Logger log = Logger.getLogger( IndexController.class );
	
	@RequestMapping( method = RequestMethod.GET )
	public String get() {
		log.info( "get : enter" );
		
		log.info( "get : exit" );
		return "index";
	}

}
