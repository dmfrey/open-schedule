/**
 *  This file is part of OpenSchedule
 * 
 *  OpenSchedule is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  OpenSchedule is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with OpenSchedule.  If not, see <http://www.gnu.org/licenses/>.
 *   
 * @author Daniel Frey <dmfrey at gmail dot com>
 * 
 * This software can be found at <http://code.google.com/p/open-schedule/>
 *
 */
package org.openschedule.web;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.openschedule.domain.Authority;
import org.openschedule.domain.UserAccount;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author dmfrey
 *
 */
@RequestMapping( value = "/register" )
@Controller
public class RegisterController {

	private static final Logger log = Logger.getLogger( RegisterController.class );
	
    @Autowired
	private PasswordEncoder passwordEncoder;
	
    @RequestMapping( method = RequestMethod.GET )
	public String registerForm( Model model ) {
		log.info( "registerForm : enter" );
		
		model.addAttribute( "userAccount", new UserAccount() );
		
		log.info( "registerForm : exit" );
		return "register/form";
	}
	
	@RequestMapping( method = RequestMethod.PUT )
	public String register( @Valid UserAccount userAccount, BindingResult result, Model model, HttpServletRequest request ) {
		log.info( "register : enter" );

		log.info( "register : result=" + result );
		if( result.hasErrors() ) {
			model.addAttribute( "userAccount", userAccount );
			
			log.info( "register : exit, form has errors" );
			return "register/form";
		} else {
			userAccount.setPassword( passwordEncoder.encodePassword( userAccount.getPassword(), null ) );
			
			userAccount.persist();
			
			Authority authority = new Authority();
			authority.setUsername( userAccount.getUsername() );
			authority.setAuthority( "ROLE_USER" );
			authority.persist();

			log.info( "register : exit" );
			return "register/complete";
		}
	}
	
	@RequestMapping( value="/openid", method = RequestMethod.GET )
	public String registerWithOpenId( HttpServletRequest request ) {
		log.info( "registerWithOpenId : enter" );

		String username = (String) request.getSession().getAttribute( "USER_OPENID_USERNAME" );
		if( log.isInfoEnabled() ) {
			log.info( "registerWithOpenId : username=" + username );
		}
		
		String name = (String) request.getSession().getAttribute( "USER_OPENID_NAME" );
		if( log.isInfoEnabled() ) {
			log.info( "registerWithOpenId : name=" + name );
		}

		String email = (String) request.getSession().getAttribute( "USER_OPENID_EMAIL" );
		if( log.isInfoEnabled() ) {
			log.info( "registerWithOpenId : email=" + email );
		}

		if( username != null ) {
			UserAccount userAccount = new UserAccount();
			userAccount.setUsername( username );
			userAccount.setPassword( "unused" );
			userAccount.setName( name );
			userAccount.setEmail( email );
			
			userAccount.persist();

			Authority authority = new Authority();
			authority.setUsername( userAccount.getUsername() );
			authority.setAuthority( "ROLE_USER" );
			authority.persist();
			
			log.info( "registerWithOpenId : exit, send to login" );
			return "register/complete";
		} else {
			log.info( "registerWithOpenId : exit,send to register" );
			return "redirect:/register";
		}
	}

}
