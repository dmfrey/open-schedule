package org.openschedule.web;

import org.openschedule.domain.UserAccount;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;

@RooWebScaffold( path = "useraccounts", formBackingObject = UserAccount.class )
@RequestMapping( "/useraccounts" )
@Controller
@Secured( "ROLE_ADMIN" )
public class UserController {
}
