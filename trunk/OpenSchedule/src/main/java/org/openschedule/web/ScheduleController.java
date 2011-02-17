package org.openschedule.web;

import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping( value = "/schedule" )
@Controller
public class ScheduleController {
	
	@RequestMapping( value = "/view", method = RequestMethod.GET )
	public String view( Model model ) {
		return "schedule/view";
	}
	
	@Secured( "ROLE_USER" )
	@RequestMapping( value = "/list" )
	public String list( Model model ) {
		return "schedule/list";
	}
	
}
