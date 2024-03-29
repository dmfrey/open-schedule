// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.openschedule.web;

import java.io.UnsupportedEncodingException;
import java.lang.Integer;
import java.lang.Long;
import java.lang.String;
import java.util.Collection;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.openschedule.domain.UserAccount;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect UserController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String UserController.create(@Valid UserAccount userAccount, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("userAccount", userAccount);
            return "useraccounts/create";
        }
        uiModel.asMap().clear();
        userAccount.persist();
        return "redirect:/useraccounts/" + encodeUrlPathSegment(userAccount.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String UserController.createForm(Model uiModel) {
        uiModel.addAttribute("userAccount", new UserAccount());
        return "useraccounts/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String UserController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("useraccount", UserAccount.findUserAccount(id));
        uiModel.addAttribute("itemId", id);
        return "useraccounts/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String UserController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("useraccounts", UserAccount.findUserAccountEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) UserAccount.countUserAccounts() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("useraccounts", UserAccount.findAllUserAccounts());
        }
        return "useraccounts/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String UserController.update(@Valid UserAccount userAccount, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("userAccount", userAccount);
            return "useraccounts/update";
        }
        uiModel.asMap().clear();
        userAccount.merge();
        return "redirect:/useraccounts/" + encodeUrlPathSegment(userAccount.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String UserController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("userAccount", UserAccount.findUserAccount(id));
        return "useraccounts/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String UserController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        UserAccount.findUserAccount(id).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/useraccounts";
    }
    
    @RequestMapping(params = { "find=ByEmailEquals", "form" }, method = RequestMethod.GET)
    public String UserController.findUserAccountsByEmailEqualsForm(Model uiModel) {
        return "useraccounts/findUserAccountsByEmailEquals";
    }
    
    @RequestMapping(params = "find=ByEmailEquals", method = RequestMethod.GET)
    public String UserController.findUserAccountsByEmailEquals(@RequestParam("email") String email, Model uiModel) {
        uiModel.addAttribute("useraccounts", UserAccount.findUserAccountsByEmailEquals(email).getResultList());
        return "useraccounts/list";
    }
    
    @RequestMapping(params = { "find=ByUsernameEquals", "form" }, method = RequestMethod.GET)
    public String UserController.findUserAccountsByUsernameEqualsForm(Model uiModel) {
        return "useraccounts/findUserAccountsByUsernameEquals";
    }
    
    @RequestMapping(params = "find=ByUsernameEquals", method = RequestMethod.GET)
    public String UserController.findUserAccountsByUsernameEquals(@RequestParam("username") String username, Model uiModel) {
        uiModel.addAttribute("useraccounts", UserAccount.findUserAccountsByUsernameEquals(username).getResultList());
        return "useraccounts/list";
    }
    
    @ModelAttribute("useraccounts")
    public Collection<UserAccount> UserController.populateUserAccounts() {
        return UserAccount.findAllUserAccounts();
    }
    
    String UserController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        }
        catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
