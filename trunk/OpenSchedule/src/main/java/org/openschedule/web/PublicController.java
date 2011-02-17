/**
 * 
 */
package org.openschedule.web;

import java.io.UnsupportedEncodingException;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.openschedule.domain.Block;
import org.openschedule.domain.BlockComment;
import org.openschedule.domain.Event;
import org.openschedule.domain.EventComment;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

/**
 * @author dmfrey
 *
 */
@Controller
@RequestMapping( "/public" )
public class PublicController {

	private static final Logger log = Logger.getLogger( PublicController.class );
	
    @RequestMapping( method = RequestMethod.GET )
	public String showPublishedEvents( Model model ) {
		log.info( "showPublishedEvents : enter" );

		List<Event> events = Event.findPublishedEvents();
		log.info( "showPublishedEvents : event count=" + events.size() );
		model.addAttribute( "events", events );
		
		log.info( "showPublishedEvents : exit" );
		return "public/published";
	}

	@RequestMapping( method = RequestMethod.GET, headers = "Accept=application/json" )
	@ResponseBody
	public String showPublishedEventsJson() {
		log.info( "showPublishedEventsJson : enter" );

		List<Event> events = Event.findPublishedEvents();
	  
		log.info( "showPublishedEventsJson : exit" );
		return Event.toJsonSummaryArray( events );
	}

	@RequestMapping( value = "/{shortName}", method = RequestMethod.GET )
	public String showEvent( @PathVariable( "shortName" ) String shortName, Model model ) {
		log.info( "showEvent : enter" );
		
		Event event = Event.findPublishedEventsByShortName( shortName ).getSingleResult();
		model.addAttribute( "event", event );
		
		log.info( "showEvent : exit" );
		return "public/show";
	}

	@RequestMapping( value = "/{shortName}", method = RequestMethod.GET, headers = "Accept=application/json" )
	@ResponseBody
	public String showEventJson( @PathVariable( "shortName" ) String shortName ) {
		log.info( "showEventJson : enter" );

		Event event = Event.findPublishedEventsByShortName( shortName ).getSingleResult();
		if( null != event ) {
			log.info( "showEventJson : exit" );

			return event.toJson();
		} else {
			log.info( "showEventJson : exit, empty" );

			return "{\"event\":\"null\"}";
		}
	}

	@RequestMapping( value = "/{shortName}/comments", method = RequestMethod.GET )
	public String listEventComments( @PathVariable( "shortName" ) String shortName, Model model ) {
		log.info( "listEventComments : enter" );
		
		if( log.isDebugEnabled() ) {
			log.debug( "listEventComments : shortName=" + shortName );
		}
		
		Event event = Event.findEventsByShortName( shortName ).getSingleResult();
		if( null != event ) {
			log.debug( "listEventComments : event found, adding comments to model" );
			model.addAttribute( "event", event );

			Calendar now = new GregorianCalendar();
			Calendar startDate = new GregorianCalendar();
			startDate.setTime( event.getStartDate() );
			model.addAttribute( "canAddComments", now.after( startDate ) );
		}
		
		log.info( "listEventComments : exit" );
		return "public/comments";
	}

    @RequestMapping( value = "/{shortName}/comments", method = RequestMethod.GET, headers = "Accept=application/json" )
    @ResponseBody
    public String listEventCommentsJson( @PathVariable( "shortName" ) String shortName ) {
    	log.info( "listEventCommentsJson : enter" );
    	
		if( log.isDebugEnabled() ) {
			log.debug( "listEventCommentsJson : shortName=" + shortName );
		}
		
    	Event event = Event.findEventsByShortName( shortName ).getSingleResult();
    	
    	log.info( "listEventCommentsJson : exit" );
        return EventComment.toJsonArray( event.getComments() );
    }

	@RequestMapping( value = "/{shortName}/comments", params = { "form" }, method = RequestMethod.GET )
	public String createEventCommentForm( @PathVariable( "shortName" ) String shortName, Model model ) {
		log.info( "createEventCommentForm : enter" );

		model.addAttribute( "eventComment", new EventComment() );
		
		model.addAttribute( "shortName", shortName );
		
		log.info( "createEventCommentForm : exit" );
		return "public/createEventComment";
	}

	@RequestMapping( value = "/{shortName}/comments", method = RequestMethod.POST )
	public String createEventComment( @PathVariable( "shortName" ) String shortName, @Valid EventComment comment, BindingResult result, Model model, HttpServletRequest request ) {
		log.info( "createEventComment : enter" );
		
    	if( result.hasErrors() ) {
            model.addAttribute( "comment", comment );

            log.info( "createEventComment : exit, errors exist" );
            return "public/createEventComment";
        }

		if( log.isDebugEnabled() ) {
			log.debug( "createEventComment : shortName=" + shortName );
		}
		
    	Event event = Event.findEventsByShortName( shortName ).getSingleResult();
    	event.getComments().add( comment );
    	event.merge();
    	
		log.info( "createEventComment : exit" );
        return "redirect:/public/" + encodeUrlPathSegment( shortName, request) + "/comments";
	}

    @RequestMapping( value = "/{shortName}/comments", method = RequestMethod.POST, headers = "Accept=application/json" )
    public ResponseEntity<String> createEventCommentFromJson( @PathVariable( "shortName" ) String shortName, @RequestBody String json ) {
		log.info( "createEventCommentFromJson : enter" );
		
		if( log.isDebugEnabled() ) {
			log.debug( "createEventCommentFromJson : shortName=" + shortName );
		}
		
    	Event event = Event.findEventsByShortName( shortName ).getSingleResult();
        event.getComments().add( EventComment.fromJsonToEventComment( json ) );
        event.merge();
        
        return new ResponseEntity<String>( HttpStatus.CREATED );
    }
    

	@RequestMapping( value = "/{shortName}/comments/{commentId}", method = RequestMethod.GET )
	public String updateEventCommentForm( @PathVariable( "shortName" ) String shortName, @PathVariable( "commentId" ) Long commentId, Model model ) {
		log.info( "updateEventCommentForm : enter" );

		EventComment eventComment = EventComment.findEventComment( commentId );
		model.addAttribute( "eventComment", eventComment );
		
		model.addAttribute( "shortName", shortName );
		
		log.info( "updateEventCommentForm : exit" );
		return "public/updateEventComment";
	}
	
    @RequestMapping( value = "/{shortName}/comments", method = RequestMethod.PUT )
    public String updateEventComment( @PathVariable( "shortName" ) String shortName, @Valid EventComment eventComment, BindingResult result, Model model, HttpServletRequest request ) {
    	log.info( "updateEventComment : enter" );

		if( result.hasErrors() ) {
            model.addAttribute( "eventComment", eventComment );

            log.info( "updateEventComment : exit, errors exist" );
            return "public/updateEventComment";
        }

    	eventComment.merge();

    	log.info( "updateEventComment : exit" );
        return "redirect:/public/" + encodeUrlPathSegment( shortName, request) + "/comments";
    }

    @RequestMapping( value = "/{shortName}/comments/{commentId}", method = RequestMethod.PUT, headers = "Accept=application/json" )
    public ResponseEntity<String> updateEventCommentFromJson( @PathVariable( "shortName" ) String shortName, @RequestBody String json ) {
    	log.info( "updateEventCommentFromJson : enter" );
        
		if( log.isDebugEnabled() ) {
			log.debug( "updateEventCommentFromJson : shortName=" + shortName );
		}
		
    	if( EventComment.fromJsonToEventComment( json ).merge() == null ) {
        	log.info( "updateEventCommentFromJson : exit, eventComment not found" );
        	
            return new ResponseEntity<String>( HttpStatus.NOT_FOUND );
        }
    	
    	log.info( "updateEventCommentFromJson : exit" );
        return new ResponseEntity<String>( HttpStatus.OK );
    }

    
    // Block Comments Section
    @RequestMapping( value = "/{shortName}/days/{dayId}/schedules/{scheduleId}/blocks/{blockId}/comments", method = RequestMethod.GET )
    public String listBlockComments( @PathVariable( "shortName" ) String shortName, @PathVariable( "dayId" ) Long dayId, @PathVariable( "scheduleId" ) Long scheduleId, @PathVariable( "blockId" ) Long blockId, Model model ) {
        log.info( "listBlockComments : enter" );

    	Block block = Block.findBlock( blockId );
        model.addAttribute( "block", block );

        if( null != block ) {
    		Calendar now = new GregorianCalendar();
    		Calendar startDate = new GregorianCalendar();
    		startDate.setTime( block.getDate() );
    		model.addAttribute( "canAddComments", now.after( startDate ) );
        } else {
        	model.addAttribute( "canAddComments", Boolean.FALSE );
        }
        
        model.addAttribute( "shortName", shortName );
        model.addAttribute( "dayId", dayId );
        model.addAttribute( "scheduleId", scheduleId );
        
        log.info( "listBlockComments : exit" );
        return "public/days/schedules/blocks/comments/list";
    }

    @RequestMapping( value = "/{shortName}/days/{dayId}/schedules/{scheduleId}/blocks/{blockId}/comments", headers = "Accept=application/json" )
    @ResponseBody
    public String listBlockCommentsJson( @PathVariable( "shortName" ) String shortName, @PathVariable( "dayId" ) Long dayId, @PathVariable( "scheduleId" ) Long scheduleId, @PathVariable( "blockId" ) Long blockId ) {
        log.info( "listBlockCommentsJson : enter" );

    	Block block = Block.findBlock( blockId );

        log.info( "listBlockCommentsJson : exit" );
    	return BlockComment.toJsonArray( block.getComments() );
    }

    @RequestMapping( value = "/{shortName}/days/{dayId}/schedules/{scheduleId}/blocks/{blockId}/comments", method = RequestMethod.POST )
    public String createBlockComment( @PathVariable( "shortName" ) String shortName, @PathVariable( "dayId" ) Long dayId, @PathVariable( "scheduleId" ) Long scheduleId, @PathVariable( "blockId" ) Long blockId, @Valid BlockComment blockComment, BindingResult result, Model model, HttpServletRequest request ) {
        log.info( "createBlockComment : enter" );

    	if( result.hasErrors() ) {
            model.addAttribute( "blockComment", blockComment );
            
            log.info( "createBlockComment : exit, errors exist" );
            return "public/days/schedules/blocks/comments/create";
        }
        
    	Block block = Block.findBlock( blockId );
    	block.getComments().add( blockComment );
    	block.persist();
        
        log.info( "createBlockComment : exit" );
    	return "redirect:/public/" + encodeUrlPathSegment( shortName, request ) + "/days/" + encodeUrlPathSegment( dayId.toString(), request ) + "/schedules/" + encodeUrlPathSegment( scheduleId.toString(), request ) + "/blocks/" + encodeUrlPathSegment( blockId.toString(), request ) + "/comments";
    }

    @RequestMapping( value = "/{shortName}/days/{dayId}/schedules/{scheduleId}/blocks/{blockId}/comments", method = RequestMethod.POST, headers = "Accept=application/json" )
    public ResponseEntity<String> createBlockCommentFromJson( @RequestBody String json, @PathVariable( "shortName" ) String shortName, @PathVariable( "dayId" ) Long dayId, @PathVariable( "scheduleId" ) Long scheduleId, @PathVariable( "blockId" ) Long blockId ) {
        log.info( "createBlockCommentFromJson : enter" );
                
    	Block block = Block.findBlock( blockId );
    	block.getComments().add( BlockComment.fromJsonToBlockComment( json ) );
    	block.persist();

        log.info( "createBlockCommentFromJson : exit" );
        return new ResponseEntity<String>( HttpStatus.CREATED );
    }

    @RequestMapping( value = "/{shortName}/days/{dayId}/schedules/{scheduleId}/blocks/{blockId}/comments", params = "form", method = RequestMethod.GET )
    public String createBlockCommentForm( @PathVariable( "shortName" ) String shortName, @PathVariable( "dayId" ) Long dayId, @PathVariable( "scheduleId" ) Long scheduleId, @PathVariable( "blockId" ) Long blockId, Model model ) {
        log.info( "createBlockCommentForm : enter" );

        model.addAttribute( "blockComment", new BlockComment() );
        
        model.addAttribute( "shortName", shortName );
        model.addAttribute( "dayId", dayId );
        model.addAttribute( "scheduleId", scheduleId );
        model.addAttribute( "blockId", blockId );
        
        log.info( "createBlockCommentForm : exit" );
        return "public/days/schedules/blocks/comments/create";
    }

    @RequestMapping( value = "/{shortName}/days/{dayId}/schedules/{scheduleId}/blocks/{blockId}/comments/{commentId}", method = RequestMethod.GET)
    public String showBlockComment( @PathVariable( "shortName" ) String shortName, @PathVariable( "dayId" ) Long dayId, @PathVariable( "scheduleId" ) Long scheduleId, @PathVariable( "blockId" ) Long blockId, @PathVariable( "commentId" ) Long commentId, Model model ) {
        log.info( "showBlockComment : enter" );

    	model.addAttribute( "blockcomment", BlockComment.findBlockComment( commentId ) );
        
        model.addAttribute( "shortName", shortName );
        model.addAttribute( "dayId", dayId );
        model.addAttribute( "blockId", blockId );
        model.addAttribute( "scheduleId", scheduleId );
    	model.addAttribute( "commentId", commentId );
        
        log.info( "showBlockComment : exit" );
        return "public/days/schedules/blocks/comments/show";
    }

    @RequestMapping( value = "/{shortName}/days/{dayId}/schedules/{scheduleId}/blocks/{blockId}/comments/{commentId}", method = RequestMethod.GET, headers = "Accept=application/json")
    @ResponseBody
    public Object showBlockCommentJson( @PathVariable( "shortName" ) String shortName, @PathVariable( "dayId" ) Long dayId, @PathVariable( "scheduleId" ) Long scheduleId, @PathVariable( "blockId" ) Long blockId, @PathVariable( "commentId" ) Long commentId ) {
        log.info( "showBlockCommentJson : enter" );

    	BlockComment blockcomment = BlockComment.findBlockComment( commentId );
        if( blockcomment == null ) {
            log.info( "showBlockCommentJson : exit, not found" );

            return new ResponseEntity<String>( HttpStatus.NOT_FOUND );
        }
        
        log.info( "showBlockCommentJson : exit" );
        return blockcomment.toJson();
    }

    @RequestMapping( value = "/{shortName}/days/{dayId}/schedules/{scheduleId}/blocks/{blockId}/comments", method = RequestMethod.PUT )
    public String updateBlockComment( @PathVariable( "shortName" ) String shortName, @PathVariable( "dayId" ) Long dayId, @PathVariable( "scheduleId" ) Long scheduleId, @PathVariable( "blockId" ) Long blockId, @Valid BlockComment blockComment, BindingResult result, Model model, HttpServletRequest request ) {
        log.info( "updateBlockComment : enter" );

    	if( result.hasErrors() ) {
            model.addAttribute( "blockComment", blockComment );
            
            log.info( "updateBlockComment : exit, errors exist" );
            return "public/days/schedules/blocks/comments/update";
        }
    	
        blockComment.merge();

        log.info( "updateBlockComment : exit" );
        return "redirect:/public/" + encodeUrlPathSegment( shortName, request ) + "/days/" + encodeUrlPathSegment( dayId.toString(), request ) + "/schedules/" + encodeUrlPathSegment( scheduleId.toString(), request ) + "/blocks/" + encodeUrlPathSegment( blockId.toString(), request ) + "/comments/" + encodeUrlPathSegment( blockComment.getId().toString(), request );
    }

    @RequestMapping( value = "/{shortName}/days/{dayId}/schedules/{scheduleId}/blocks/{blockId}/comments", method = RequestMethod.PUT, headers = "Accept=application/json" )
    public ResponseEntity<String> updateBlockCommentFromJson( @RequestBody String json, @PathVariable( "shortName" ) String shortName, @PathVariable( "dayId" ) Long dayId, @PathVariable( "scheduleId" ) Long scheduleId, @PathVariable( "blockId" ) Long blockId ) {
        log.info( "updateBlockCommentFromJson : enter" );

    	if( BlockComment.fromJsonToBlockComment( json ).merge() == null ) {
            log.info( "updateBlockCommentFromJson : exit, not found" );

            return new ResponseEntity<String>( HttpStatus.NOT_FOUND );
        }
        
        log.info( "updateBlockCommentFromJson : exit" );
        return new ResponseEntity<String>( HttpStatus.OK );
    }

    @RequestMapping( value = "/{shortName}/days/{dayId}/schedules/{scheduleId}/blocks/{blockId}/comments/{commentId}", params = "form", method = RequestMethod.GET )
    public String updateBlockCommentForm( @PathVariable( "shortName" ) String shortName, @PathVariable( "dayId" ) Long dayId, @PathVariable( "scheduleId" ) Long scheduleId, @PathVariable( "blockId" ) Long blockId, @PathVariable( "commentId" ) Long commentId, Model model ) {
        log.info( "updateBlockCommentForm : enter" );
        
    	model.addAttribute( "blockComment", BlockComment.findBlockComment( commentId ) );
        
        model.addAttribute( "shortName", shortName );
        model.addAttribute( "dayId", dayId );
        model.addAttribute( "blockId", blockId );
        model.addAttribute( "scheduleId", scheduleId );
    	model.addAttribute( "commentId", commentId );

        log.info( "updateBlockCommentForm : exit" );
    	return "public/days/schedules/blocks/comments/update";
    }

    private String encodeUrlPathSegment( String pathSegment, HttpServletRequest request ) {
        String enc = request.getCharacterEncoding();
        if( enc == null ) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        
        try {
            pathSegment = UriUtils.encodePathSegment( pathSegment, enc );
        } catch( UnsupportedEncodingException uee ) {}
        
        return pathSegment;
    }

}
