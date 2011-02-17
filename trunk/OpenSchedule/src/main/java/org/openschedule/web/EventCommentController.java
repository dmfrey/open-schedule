package org.openschedule.web;

import org.openschedule.domain.EventComment;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "eventcomments", formBackingObject = EventComment.class)
@RequestMapping("/eventcomments")
@Controller
public class EventCommentController {
}
