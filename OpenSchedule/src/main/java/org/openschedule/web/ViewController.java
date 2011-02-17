/**
 * 
 */
package org.openschedule.web;

import java.util.List;

import org.apache.log4j.Logger;
import org.openschedule.domain.Event;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author dmfrey
 *
 */
@Controller
@RequestMapping( "/view" )
public class ViewController {

	private static final Logger log = Logger.getLogger( ViewController.class );


}
