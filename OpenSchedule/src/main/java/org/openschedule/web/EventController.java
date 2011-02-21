package org.openschedule.web;

import java.io.UnsupportedEncodingException;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.openschedule.domain.Block;
import org.openschedule.domain.Day;
import org.openschedule.domain.Event;
import org.openschedule.domain.Label;
import org.openschedule.domain.Room;
import org.openschedule.domain.Schedule;
import org.openschedule.domain.Session;
import org.openschedule.domain.Speaker;
import org.openschedule.domain.Sponsor;
import org.openschedule.domain.Track;
import org.openschedule.domain.Venue;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;
 
@RooWebScaffold(path = "events", formBackingObject = Event.class)
@RequestMapping( "/events" )
@Controller
@Secured( { "ROLE_USER", "ROLE_ADMIN" } )
public class EventController {
	
	private static final Logger log = Logger.getLogger( EventController.class );
	
    @RequestMapping( value = "/list/user", method = RequestMethod.GET )
    public String listEventsForUser( @RequestParam( value = "page", required = false ) Integer page, @RequestParam( value = "size", required = false ) Integer size, Model model ) {
    	log.info( "listEventsForUser : enter" );
    	
    	Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	if( principal instanceof UserDetails ) {
        	log.debug( "listEventsForUser : user found in security context" );

    		UserDetails user = (UserDetails) principal;
    		
    		if( page != null || size != null ) {
            	int sizeNo = size == null ? 10 : size.intValue();
            	model.addAttribute( "events", Event.findEventEntriesByUsername( user.getUsername(), ( page == null ? 0 : ( page.intValue() - 1 ) * sizeNo ), sizeNo ) );
            	float nrOfPages = (float) Event.countEvents() / sizeNo;
            	model.addAttribute( "maxPages", (int) ( ( nrOfPages > (int) nrOfPages || nrOfPages == 0.0 ) ? nrOfPages + 1 : nrOfPages ) );
        	} else {
            	model.addAttribute( "events", Event.findEventsByUsername( user.getUsername() ).getResultList() );
        	}
    	
    	}
    	
        model.addAttribute( "page", ( page == null ) ? "1" : page.toString() );
        model.addAttribute( "size", ( size == null ) ? "10" : size.toString() );
    	
    	log.info( "listEventsForUser : exit" );
        return "events/list";
    }

    @RequestMapping( method = RequestMethod.POST )
    public String create( @Valid Event event, BindingResult result, Model model, HttpServletRequest request ) {
    	log.info( "create : enter" );

    	if( result.hasErrors() ) {
            model.addAttribute( "event", event );

            log.info( "create : exit, errors exist" );
            return "events/create";
        }
        
    	event.setPublishDate( new Date() );
    	
    	log.debug( "create : creating days for event" );
        Calendar date = new GregorianCalendar();
        date.setTime( event.getStartDate() );
        for( int i = 0; i < event.getNumberOfDays(); i++ ) {
            if( log.isDebugEnabled() ) {
            	log.debug( "create : i=" + i + ", date=" + date.toString() );
            }
        	Day day = new Day( date.getTime() );
        	event.getDays().add( day );
        	
        	if( i == event.getNumberOfDays() - 1 ) {
        		event.setEndDate( date.getTime() );
        	}

        	date.add( Calendar.DATE, 1 );
        }
        
        event.persist();
        
    	log.info( "create : exit" );
        return "redirect:/events/" + encodeUrlPathSegment(event.getId().toString(), request);
    }

    @RequestMapping( value = "/{id}", params = "form", method = RequestMethod.GET )
    public String updateForm( @PathVariable( "id" ) Long id, Model model ) {
        log.info( "updateForm : enter" );

        Event event = Event.findEvent( id );
        model.addAttribute( "event", event );
        model.addAttribute( "track", new Track() );
        model.addAttribute( "venue", new Venue() );
        model.addAttribute( "room", new Room() );
        model.addAttribute( "sponsor", new Sponsor() );
        model.addAttribute( "schedule", new Schedule() );
        model.addAttribute( "label", new Label() );
        model.addAttribute( "session", new Session() );
        model.addAttribute( "speaker", new Speaker() );
        
        log.info( "updateForm : exit" );
        return "events/update";
    }

    @RequestMapping( method = RequestMethod.PUT )
    public String update( @Valid Event event, BindingResult result, Model model, HttpServletRequest request ) {
    	log.info( "update : enter" );

    	if( result.hasErrors() ) {
            model.addAttribute( "event", event );

            model.addAttribute( "track", new Track() );
            model.addAttribute( "venue", new Venue() );
            model.addAttribute( "room", new Room() );
            model.addAttribute( "sponsor", new Sponsor() );
            model.addAttribute( "schedule", new Schedule() );
            model.addAttribute( "label", new Label() );
            model.addAttribute( "session", new Session() );
            model.addAttribute( "speaker", new Speaker() );

            model.addAttribute( "containsErrors", true );

            log.info( "update : exit, errors exist" );
            return "events/update";
        }
        
    	log.debug( "update : merging event" );
        event.merge();
        
    	log.info( "update : exit" );
        return "redirect:/events/" + encodeUrlPathSegment( event.getId().toString(), request ) + "?form=true";
    }

    @RequestMapping( value = "/{id}/sponsors", params = { "form" }, method = RequestMethod.GET )
    public String createSponsorForm( @PathVariable( "id" ) Long id, Model model ) {
    	log.info( "createSponsorForm : enter" );
    	
    	Event event = Event.findEvent( id );
        model.addAttribute( "event", event );
        model.addAttribute( "sponsor", new Sponsor() );

    	log.info( "createSponsorForm : exit" );
    	return "events/createSponsor";
    }
    
    @RequestMapping( value = "/{id}/sponsors", method = RequestMethod.POST )
    public String createSponsor( @PathVariable( "id" ) Long id, @Valid Sponsor sponsor, BindingResult result, Model model, HttpServletRequest request ) {
        log.info( "createSponsor : enter" );

    	Event event = Event.findEvent( id );
    	
    	if( result.hasErrors() ) {
            model.addAttribute( "event", event );
            model.addAttribute( "sponsor", sponsor );
            
            log.info( "createSponsor : exit, errors exist" );
            return "events/createSponsor";
        }

    	sponsor.setWebSite( cleanWebSite( sponsor.getWebSite() ) );

    	log.debug( "createSponsor : adding sponsor to event" );
    	event.getSponsors().add( sponsor );
    	
    	log.debug( "createSponsor : merging event" );
        event.merge();

        log.info( "createSponsor : exit" );
        return "redirect:/events/" + encodeUrlPathSegment( event.getId().toString(), request ) + "?form";
    }

    @RequestMapping( value = "/{eventId}/sponsors/{sponsorId}", params = "form", method = RequestMethod.GET )
    public String updateSponsorForm( @PathVariable( "eventId" ) Long eventId, @PathVariable( "sponsorId" ) Long sponsorId, Model model ) {
    	log.info( "updateSponsorForm : enter" );
    	
    	model.addAttribute( "eventId", eventId );
    	
    	Sponsor sponsor = Sponsor.findSponsor( sponsorId );
    	model.addAttribute( "sponsor", sponsor );
    	
    	log.info( "updateSponsorForm : exit" );
    	return "events/updateSponsor";
    }
    
    @RequestMapping( value = "/{eventId}/sponsors/{sponsorId}", method = RequestMethod.PUT )
    @Transactional
    public String updateSponsor( @PathVariable( "eventId" ) Long eventId, @PathVariable( "sponsorId" ) Long sponsorId, @Valid Sponsor sponsor, BindingResult result, Model model, HttpServletRequest request ) {
        log.info( "updateSponsor : enter" );

        if( result.hasErrors() ) {
            model.addAttribute( "sponsor", sponsor );
            model.addAttribute( "eventId", eventId );
            
            log.info( "updateSponsor : exit, errors exist" );
            return "events/updateSponsor";
        }

    	sponsor.setWebSite( cleanWebSite( sponsor.getWebSite() ) );

    	log.debug( "updateSponsor : merging sponsor" );
    	sponsor.merge();
    	
        log.info( "updateSponsor : exit" );
        return "redirect:/events/" + encodeUrlPathSegment( eventId.toString(), request ) + "?form";
    }
    
    @RequestMapping( value = "/{id}/venues", params = { "form" }, method = RequestMethod.GET )
    public String createVenueForm( @PathVariable( "id" ) Long id, Model model ) {
    	log.info( "createVenueForm : enter" );
    	
    	Event event = Event.findEvent( id );
        model.addAttribute( "event", event );
        model.addAttribute( "venue", new Venue() );

    	log.info( "createVenueForm : exit" );
    	return "events/createVenue";
    }

    @RequestMapping( value = "/{id}/venues", method = RequestMethod.POST )
    public String createVenue( @PathVariable( "id" ) Long id, @Valid Venue venue, BindingResult result, Model model, HttpServletRequest request ) {
        log.info( "createVenue : enter" );

    	Event event = Event.findEvent( id );
    	
    	if( result.hasErrors() ) {
            model.addAttribute( "event", event );
            model.addAttribute( "venue", venue );

            log.info( "createVenue : exit, errors exist" );
            return "events/createVenue";
        }
        
    	venue.setWebSite( cleanWebSite( venue.getWebSite() ) );
    	
    	log.debug( "createVenue : adding venue to event" );
    	event.getVenues().add( venue );
    	
    	log.debug( "createVenue : merging event" );
        event.merge();

        log.info( "createVenue : exit" );
        return "redirect:/events/" + encodeUrlPathSegment( event.getId().toString(), request ) + "?form";
    }
    
    @RequestMapping( value = "/{eventId}/venues/{venueId}", params = "form", method = RequestMethod.GET )
    public String updateVenueForm( @PathVariable( "eventId" ) Long eventId, @PathVariable( "venueId" ) Long venueId, Model model ) {
    	log.info( "updateVenueForm : enter" );
    	
    	model.addAttribute( "eventId", eventId );
    	
    	Venue venue = Venue.findVenue( venueId );
    	model.addAttribute( "venue", venue );
    	
    	log.info( "updateVenueForm : exit" );
    	return "events/updateVenue";
    }
    
    @RequestMapping( value = "/{eventId}/venues/{venueId}", method = RequestMethod.PUT )
    @Transactional
    public String updateVenue( @PathVariable( "eventId" ) Long eventId, @PathVariable( "venueId" ) Long venueId, @Valid Venue venue, BindingResult result, Model model, HttpServletRequest request ) {
        log.info( "updateVenue : enter" );

        if( result.hasErrors() ) {
            model.addAttribute( "venue", venue );
            model.addAttribute( "eventId", eventId );
            
            log.info( "updateVenue : exit, errors exist" );
            return "events/updateVenue";
        }

    	venue.setWebSite( cleanWebSite( venue.getWebSite() ) );

    	log.debug( "updateVenue : merging venue" );
    	venue.merge();
    	
        log.info( "updateVenue : exit" );
        return "redirect:/events/" + encodeUrlPathSegment( eventId.toString(), request ) + "?form";
    }

    @RequestMapping( value = "/{id}/venues/{venueId}/rooms", params = { "form" }, method = RequestMethod.GET )
    public String createVenueRoomForm( @PathVariable( "id" ) Long id, @PathVariable( "venueId" ) Long venueId, Model model ) {
    	log.info( "createVenueRoomForm : enter" );
    	
        model.addAttribute( "event", Event.findEvent( id ) );
        model.addAttribute( "venue", Venue.findVenue( venueId ) );
        model.addAttribute( "room", new Room() );

    	log.info( "createVenueRoomForm : exit" );
    	return "events/createVenueRoom";
    }

    @RequestMapping( value = "/{eventId}/venues/{venueId}/rooms", method = RequestMethod.POST )
    public String createVenueRoom( @PathVariable( "eventId" ) Long eventId, @PathVariable( "venueId" ) Long venueId, @Valid Room room, BindingResult result, Model model, HttpServletRequest request ) {
        log.info( "createVenueRoom : enter" );

    	Event event = Event.findEvent( eventId );
    	
    	if( result.hasErrors() ) {
            model.addAttribute( "event", event );
            model.addAttribute( "room", room );

            log.info( "createVenueRoom : exit, errors exist" );
            return "events/createVenueRoom";
        }
        
    	Venue venue = Venue.findVenue( venueId );
    	
    	log.debug( "createVenueRoom : adding room to venue" );
    	venue.getRooms().add( room );
    	
    	log.debug( "createVenueRoom : merging venue" );
        venue.merge();

        log.info( "createVenueRoom : exit" );
        return "redirect:/events/" + encodeUrlPathSegment( event.getId().toString(), request ) + "?form";
    }

    @RequestMapping( value = "/{eventId}/venues/{venueId}/rooms/{roomId}", params = "form", method = RequestMethod.GET )
    public String updateVenueRoomForm( @PathVariable( "eventId" ) Long eventId, @PathVariable( "venueId" ) Long venueId, @PathVariable( "roomId" ) Long roomId, Model model ) {
    	log.info( "updateVenueRoomForm : enter" );
    	
    	model.addAttribute( "eventId", eventId );
    	
    	Venue venue = Venue.findVenue( venueId );
    	model.addAttribute( "venue", venue );
    	
    	Room room = Room.findRoom( roomId );
    	model.addAttribute( "room", room );
    	
    	log.info( "updateVenueRoomForm : exit" );
    	return "events/updateVenueRoom";
    }
    
    @RequestMapping( value = "/{eventId}/venues/{venueId}/rooms/{roomId}", method = RequestMethod.PUT )
    @Transactional
    public String updateVenueRoom( @PathVariable( "eventId" ) Long eventId, @PathVariable( "venueId" ) Long venueId, @PathVariable( "roomId" ) Long roomId, @Valid Room room, BindingResult result, Model model, HttpServletRequest request ) {
        log.info( "updateVenueRoom : enter" );

        if( result.hasErrors() ) {
            model.addAttribute( "room", room );
            model.addAttribute( "eventId", eventId );
            
            log.info( "updateVenueRoom : exit, errors exist" );
            return "events/updateVenueRoom";
        }

    	log.debug( "updateVenueRoom : merging room" );
    	room.merge();
    	
        log.info( "updateVenueRoom : exit" );
        return "redirect:/events/" + encodeUrlPathSegment( eventId.toString(), request ) + "?form";
    }

    @RequestMapping( value = "/{id}/tracks", params = { "form" }, method = RequestMethod.GET )
    public String createTrackForm( @PathVariable( "id" ) Long id, Model model ) {
    	log.info( "createTrackForm : enter" );
    	
        model.addAttribute( "event", Event.findEvent( id ) );
        model.addAttribute( "track", new Track() );

    	log.info( "createTrackForm : exit" );
    	return "events/createTrack";
    }

    @RequestMapping( value = "/{id}/tracks", method = RequestMethod.POST )
    public String createTrack( @PathVariable( "id" ) Long id, @Valid Track track, BindingResult result, Model model, HttpServletRequest request ) {
        log.info( "createTrack : enter" );

    	Event event = Event.findEvent( id );
    	
    	if( result.hasErrors() ) {
            model.addAttribute( "event", event );
            model.addAttribute( "track", track );

            log.info( "createTrack : exit, errors exist" );
            return "events/createTrack";
        }
        
    	log.debug( "createTrack : adding track to event" );
    	event.getTracks().add( track );
    	
    	log.debug( "createTrack : merging event" );
        event.merge();

        log.info( "createTrack : exit" );
        return "redirect:/events/" + encodeUrlPathSegment( event.getId().toString(), request ) + "?form";
    }

    @RequestMapping( value = "/{eventId}/tracks/{trackId}", params = "form", method = RequestMethod.GET )
    public String updateTrackForm( @PathVariable( "eventId" ) Long eventId, @PathVariable( "trackId" ) Long trackId, Model model ) {
    	log.info( "updateTrackForm : enter" );
    	
    	model.addAttribute( "eventId", eventId );
    	
    	Event event = Event.findEvent( eventId );
    	model.addAttribute( "event", event );
    	
    	Track track = Track.findTrack( trackId );
    	model.addAttribute( "track", track );
    	
    	log.info( "updateTrackForm : exit" );
    	return "events/updateTrack";
    }
    
    @RequestMapping( value = "/{eventId}/tracks/{trackId}", method = RequestMethod.PUT )
    @Transactional
    public String updateTrack( @PathVariable( "eventId" ) Long eventId, @PathVariable( "trackId" ) Long trackId, @Valid Track track, BindingResult result, Model model, HttpServletRequest request ) {
        log.info( "updateTrack : enter" );

        if( result.hasErrors() ) {
            model.addAttribute( "track", track );
            model.addAttribute( "eventId", eventId );
            
            log.info( "updateTrack : exit, errors exist" );
            return "events/updateTrack";
        }

    	log.debug( "updateTrack : merging track" );
    	track.merge();
    	
        log.info( "updateTrack : exit" );
        return "redirect:/events/" + encodeUrlPathSegment( eventId.toString(), request ) + "?form";
    }

    @RequestMapping( value = "/{id}/days", method = RequestMethod.GET )
    public String createDay( @PathVariable( "id" ) Long id, HttpServletRequest request ) {
    	log.info( "createDay : enter" );
    	
    	Event event = Event.findEvent( id );
    	
    	log.debug( "create : adding day to event" );
    	Day lastDay = event.getDays().get( event.getDays().size() - 1 );

        Calendar date = new GregorianCalendar();
        date.setTime( lastDay.getDate() );
    	date.add( Calendar.DATE, 1 );
    	event.setEndDate( date.getTime() );
        
        Day day = new Day( date.getTime() );
    	event.getDays().add( day );
    	event.setNumberOfDays( event.getNumberOfDays() + 1 );
    	
        log.debug( "createDay : merging event" );
    	event.merge();
    	
    	log.info( "createDay : exit" );
        return "redirect:/events/" + encodeUrlPathSegment( event.getId().toString(), request ) + "?form";
    }
    
    @RequestMapping( value = "/{eventId}/days/{dayId}", method = RequestMethod.DELETE )
    public String removeDay( @PathVariable( "eventId" ) Long eventId, @PathVariable( "dayId" ) Long dayId, HttpServletRequest request ) {
    	log.info( "removeDay : enter" );

    	log.debug( "removeDay : removing day" );
    	Day day = Day.findDay( dayId );
    	day.remove();

    	log.debug( "removeDay : updating event" );
    	Event event = Event.findEvent( eventId );
    	event.setNumberOfDays( event.getNumberOfDays() - 1 );
    	
    	Day lastDay = event.getDays().get( event.getDays().size() - 1 );
    	event.setEndDate( lastDay.getDate() );
    	event.merge();
    	
    	log.info( "removeDay : exit" );
        return "redirect:/events/" + encodeUrlPathSegment( event.getId().toString(), request ) + "?form";
    }
    
    @RequestMapping( value = "/{eventId}/days/{dayId}/schedules", method = RequestMethod.POST )
    public String createDaySchedule( @PathVariable( "eventId" ) Long eventId, @PathVariable( "dayId" ) Long dayId, @Valid Schedule schedule, BindingResult result, Model model, HttpServletRequest request ) {
        log.info( "createDaySchedule : enter" );

        Event event = Event.findEvent( eventId );
        
    	if( result.hasErrors() ) {
            model.addAttribute( "event", event );
            model.addAttribute( "schedule", schedule );

            model.addAttribute( "venue", new Venue() );
            model.addAttribute( "room", new Room() );
            model.addAttribute( "sponsor", new Sponsor() );
            model.addAttribute( "track", new Track() );
            model.addAttribute( "label", new Label() );
            model.addAttribute( "session", new Session() );
            model.addAttribute( "speaker", new Speaker() );

            model.addAttribute( "containsErrors", true );

            log.info( "createDaySchedule : exit, errors exist" );
            return "events/update";
        }

    	for( int i = 0; i < schedule.getBlocksPerSchedule(); i++ ) {
    		schedule.getBlocks().add( new Block() );
    	}
    	
    	log.debug( "createDaySchedule : adding schedule to day" );
    	Day day = Day.findDay( dayId );
    	day.getSchedules().add( schedule );
    	
    	log.debug( "createDaySchedule : merging day" );
        day.merge();

        log.info( "createDaySchedule : exit" );
        return "redirect:/events/" + encodeUrlPathSegment( event.getId().toString(), request ) + "?form";
    }
    
    @RequestMapping( value = "/{eventId}/days/{dayId}/schedules/{scheduleId}", method = RequestMethod.DELETE )
    public String removeDaySchedule( @PathVariable( "eventId" ) Long eventId, @PathVariable( "dayId" ) Long dayId, @PathVariable( "scheduleId" ) Long scheduleId, Model model, HttpServletRequest request ) {
        log.info( "removeDaySchedule : enter" );

        log.debug( "removeDaySchedule : removing schedule" );
        Schedule schedule = Schedule.findSchedule( scheduleId );
        schedule.remove();
        
        log.info( "removeDaySchedule : exit" );
        return "redirect:/events/" + encodeUrlPathSegment( eventId.toString(), request ) + "?form";
    }
    
    @RequestMapping( value = "/{eventId}/days/{dayId}/schedules/{scheduleId}", method = RequestMethod.GET )
    public String createDayScheduleBlock( @PathVariable( "eventId" ) Long eventId, @PathVariable( "dayId" ) Long dayId, @PathVariable( "scheduleId" ) Long scheduleId, HttpServletRequest request ) {
        log.info( "createDayScheduleBlock : enter" );

        Event event = Event.findEvent( eventId );

        Schedule schedule = Schedule.findSchedule( scheduleId );
   		schedule.getBlocks().add( new Block() );

    	log.info( "createDayScheduleBlock : merging schedule" );
    	schedule.merge();
    	
        log.info( "createDayScheduleBlock : exit" );
        return "redirect:/events/" + encodeUrlPathSegment( event.getId().toString(), request ) + "?form";
    }
    
    @RequestMapping( value = "/{eventId}/days/{dayId}/schedules/{scheduleId}/blocks/{blockId}", params = "label", method = RequestMethod.POST )
    @ResponseBody
    public String updateDayScheduleBlockLabel( @PathVariable( "eventId" ) Long eventId, @PathVariable( "dayId" ) Long dayId, @PathVariable( "scheduleId" ) Long scheduleId, @PathVariable( "blockId" ) Long blockId, @RequestParam( "labelId" ) Long labelId, HttpServletRequest request ) {
        log.info( "updateDayScheduleBlockLabel : enter" );

        Label label = Label.findLabel( labelId );
        
        Block block = Block.findBlock( blockId );
   		block.setLabel( label );
        block.merge();

        log.info( "updateDayScheduleBlockLabel : exit" );
        return "success";
    }

    @RequestMapping( value = "/{eventId}/days/{dayId}/schedules/{scheduleId}/blocks/{blockId}", params = "duration", method = RequestMethod.POST )
    @ResponseBody
    public String updateDayScheduleBlockDuration( @PathVariable( "eventId" ) Long eventId, @PathVariable( "dayId" ) Long dayId, @PathVariable( "scheduleId" ) Long scheduleId, @PathVariable( "blockId" ) Long blockId, @RequestParam( "duration" ) Integer duration, HttpServletRequest request ) {
        log.info( "updateDayScheduleBlockDuration : enter" );

        Block block = Block.findBlock( blockId );
   		block.setDuration( duration );
        block.merge();

        log.info( "updateDayScheduleBlockDuration : exit" );
        return "success";
    }

    @RequestMapping( value = "/{eventId}/days/{dayId}/schedules/{scheduleId}/blocks/{blockId}", params = "session", method = RequestMethod.POST )
    @ResponseBody
    public String updateDayScheduleBlockSession( @PathVariable( "eventId" ) Long eventId, @PathVariable( "dayId" ) Long dayId, @PathVariable( "scheduleId" ) Long scheduleId, @PathVariable( "blockId" ) Long blockId, @RequestParam( "sessionId" ) Long sessionId, HttpServletRequest request ) {
        log.info( "updateDayScheduleBlockSession : enter" );

        Session session = Session.findSession( sessionId );
        
        Block block = Block.findBlock( blockId );
   		block.setSession( session );
        block.merge();

        log.info( "updateDayScheduleBlockSession : exit" );
        return "success";
    }

    @RequestMapping( value = "/{eventId}/days/{dayId}/schedules/{scheduleId}/blocks/{blockId}", method = RequestMethod.DELETE )
    public String removeDayScheduleBlock( @PathVariable( "eventId" ) Long eventId, @PathVariable( "dayId" ) Long dayId, @PathVariable( "scheduleId" ) Long scheduleId, @PathVariable( "blockId" ) Long blockId, HttpServletRequest request ) {
        log.info( "removeDayScheduleBlock : enter" );

        Block block = Block.findBlock( blockId );
   		block.remove();

        log.info( "removeDayScheduleBlock : exit" );
        return "redirect:/events/" + encodeUrlPathSegment( eventId.toString(), request ) + "?form";
    }

    @RequestMapping( value = "/{id}/labels", params = { "form" }, method = RequestMethod.GET )
    public String createLabelForm( @PathVariable( "id" ) Long id, Model model ) {
    	log.info( "createLabelForm : enter" );
    	
        model.addAttribute( "event", Event.findEvent( id ) );
        model.addAttribute( "label", new Label() );

    	log.info( "createLabelForm : exit" );
    	return "events/createLabel";
    }

    @RequestMapping( value = "/{id}/labels", method = RequestMethod.POST )
    public String createLabel( @PathVariable( "id" ) Long id, @Valid Label label, BindingResult result, Model model, HttpServletRequest request ) {
        log.info( "createLabel : enter" );

    	Event event = Event.findEvent( id );
    	
    	if( result.hasErrors() ) {
            model.addAttribute( "event", event );
            model.addAttribute( "label", label );

            log.info( "createLabel : exit, errors exist" );
            return "events/createLabel";
        }
        
    	log.debug( "createLabel : adding label to event" );
    	event.getLabels().add( label );
    	
    	log.debug( "createLabel : merging event" );
        event.merge();

        log.info( "createLabel : exit" );
        return "redirect:/events/" + encodeUrlPathSegment( event.getId().toString(), request ) + "?form";
    }

    @RequestMapping( value = "/{eventId}/labels/{labelId}", params = "form", method = RequestMethod.GET )
    public String updateLabelForm( @PathVariable( "eventId" ) Long eventId, @PathVariable( "labelId" ) Long labelId, Model model ) {
    	log.info( "updateLabelForm : enter" );
    	
    	model.addAttribute( "eventId", eventId );
    	
    	Label label = Label.findLabel( labelId );
    	model.addAttribute( "label", label );
    	
    	log.info( "updateLabelForm : exit" );
    	return "events/updateLabel";
    }
    
    @RequestMapping( value = "/{eventId}/labels/{labelId}", method = RequestMethod.PUT )
    @Transactional
    public String updateLabel( @PathVariable( "eventId" ) Long eventId, @PathVariable( "labelId" ) Long labelId, @Valid Label label, BindingResult result, Model model, HttpServletRequest request ) {
        log.info( "updateLabel : enter" );

        if( result.hasErrors() ) {
            model.addAttribute( "label", label );
            model.addAttribute( "eventId", eventId );
            
            log.info( "updateLabel : exit, errors exist" );
            return "events/updateLabel";
        }

    	log.debug( "updateLabel : merging label" );
    	label.merge();
    	
        log.info( "updateLabel : exit" );
        return "redirect:/events/" + encodeUrlPathSegment( eventId.toString(), request ) + "?form";
    }

    @RequestMapping( value = "{eventId}/days/{dayId}", params = { "labelId", "blockIndex" }, method = RequestMethod.POST, headers = "Accept=application/json" )
    @ResponseBody
    public String addLabelToBlock( @PathVariable( "eventId" ) Long eventId, @PathVariable( "dayId" ) Long dayId, @RequestParam( "labelId" ) Long labelId, @RequestParam( "blockIndex" ) Integer blockIndex ) {
        log.info( "addLabelToBlock : enter" );
    	
        Day day = Day.findDay( dayId );
		Label label = Label.findLabel( labelId );
        
        for( Schedule schedule : day.getSchedules() ) {
   			log.info( "addLabelToBlock : schedule iteration" );

   			Block block = schedule.getBlocks().get( blockIndex );
   			block.setLabel( label );
   			block.setDate( day.getDate() );
   			
   			block.merge();
   			
   			log.info( "addLabelToBlock : block=" + block.toString() );
        }
    
        log.info( "addLabelToBlock : exit" );
    	return "success";
    }
    
    @RequestMapping( value = "{eventId}/days/{dayId}/blocks/{blockId}", params = { "sessionId", "labelId" }, method = RequestMethod.POST, headers = "Accept=application/json" )
    @ResponseBody
    public String addSessionToBlock( @PathVariable( "eventId" ) Long eventId, @PathVariable( "dayId" ) Long dayId, @PathVariable( "blockId" ) Long blockId, @RequestParam( "sessionId" ) Long sessionId, @RequestParam( "labelId" ) Long labelId ) {
        log.info( "addSessionToBlock : enter" );
    	
        Block block = Block.findBlock( blockId );

        Day day = Day.findDay( dayId );
    	block.setDate( day.getDate() );
        
        Session session = Session.findSession( sessionId );
        if( log.isInfoEnabled() ) {
        	log.info( "addSessionToBlock : session=" + session.toString() );
        }
        block.setSession( session );

        if( labelId.longValue() != 0 ) { 
        	Label label = Label.findLabel( labelId );
        	if( log.isInfoEnabled() ) {
        		log.info( "addSessionToBlock : label=" + label.toString() );
        	}
        	block.setLabel( label );
        } else {
        	block.setLabel( null );
        }
        
        block.merge();
        
        log.info( "addSessionToBlock : exit" );
    	return "success";
    }

    @RequestMapping( value = "/{id}/sessions", params = { "form" }, method = RequestMethod.GET )
    public String createSessionForm( @PathVariable( "id" ) Long id, Model model ) {
    	log.info( "createSessionForm : enter" );
    	
        model.addAttribute( "event", Event.findEvent( id ) );
        model.addAttribute( "session", new Session() );

    	log.info( "createSessionForm : exit" );
    	return "events/createSession";
    }

    @RequestMapping( value = "/{eventId}/sessions", method = RequestMethod.POST )
    public String createSession( @PathVariable( "eventId" ) Long eventId, @Valid Session session, BindingResult result, Model model, HttpServletRequest request ) {
        log.info( "createSession : enter" );

        Event event = Event.findEvent( eventId );
        
    	if( result.hasErrors() ) {
            model.addAttribute( "event", event );
            model.addAttribute( "session", session );

            log.info( "createSession : exit, errors exist" );
            return "events/createSession";
        }

    	log.debug( "createSession : add session to event" );
    	event.getSessions().add( session );
    	
    	log.debug( "createSession : merging event" );
    	event.merge();

    	log.info( "createSession : enter" );
        return "redirect:/events/" + encodeUrlPathSegment( event.getId().toString(), request ) + "?form";
    }
    
    @RequestMapping( value = "/{eventId}/sessions/{sessionId}", params = "form", method = RequestMethod.GET )
    public String updateSessionForm( @PathVariable( "eventId" ) Long eventId, @PathVariable( "sessionId" ) Long sessionId, Model model ) {
    	log.info( "updateSessionForm : enter" );
    	
    	model.addAttribute( "eventId", eventId );
    	
    	Event event = Event.findEvent( eventId );
    	model.addAttribute( "event", event );
    	
    	Session session = Session.findSession( sessionId );
    	model.addAttribute( "session", session );
    	
    	log.info( "updateSessionForm : exit" );
    	return "events/updateSession";
    }
    
    @RequestMapping( value = "/{eventId}/sessions/{sessionId}", method = RequestMethod.PUT )
    @Transactional
    public String updateSession( @PathVariable( "eventId" ) Long eventId, @PathVariable( "sessionId" ) Long sessionId, @Valid Session session, BindingResult result, Model model, HttpServletRequest request ) {
        log.info( "updateSession : enter" );

        if( result.hasErrors() ) {
            model.addAttribute( "session", session );
            model.addAttribute( "eventId", eventId );
            
            log.info( "updateSession : exit, errors exist" );
            return "events/updateSession";
        }

    	log.debug( "updateSession : merging session" );
    	session.merge();
    	
        log.info( "updateSession : exit" );
        return "redirect:/events/" + encodeUrlPathSegment( eventId.toString(), request ) + "?form";
    }

    @RequestMapping( value = "/{id}/speakers", params = { "form" }, method = RequestMethod.GET )
    public String createSpeakerForm( @PathVariable( "id" ) Long id, Model model ) {
    	log.info( "createSpeakerForm : enter" );
    	
        model.addAttribute( "event", Event.findEvent( id ) );
        model.addAttribute( "speaker", new Speaker() );

    	log.info( "createSpeakerForm : exit" );
    	return "events/createSpeaker";
    }

    @RequestMapping( value = "/{eventId}/speakers", method = RequestMethod.POST )
    public String createSpeaker( @PathVariable( "eventId" ) Long eventId, @Valid Speaker speaker, BindingResult result, Model model, HttpServletRequest request ) {
        log.info( "createSpeaker : enter" );

        Event event = Event.findEvent( eventId );
        
    	if( result.hasErrors() ) {
            model.addAttribute( "event", event );
            model.addAttribute( "speaker", speaker );

            log.info( "createSpeaker : exit, errors exist" );
            return "events/createSpeaker";
        }
    	
    	log.debug( "createSpeaker : add speaker to event" );
    	event.getSpeakers().add( speaker );

    	log.debug( "createSpeaker : merging event" );
    	event.merge();
    	
    	log.info( "createSpeaker : enter" );
        return "redirect:/events/" + encodeUrlPathSegment( event.getId().toString(), request ) + "?form";
    }

    @RequestMapping( value = "/{eventId}/speakers/{speakerId}", params = "form", method = RequestMethod.GET )
    public String updateSpeakerForm( @PathVariable( "eventId" ) Long eventId, @PathVariable( "speakerId" ) Long speakerId, Model model ) {
    	log.info( "updateSpeakerForm : enter" );
    	
    	model.addAttribute( "eventId", eventId );
    	
    	Speaker speaker = Speaker.findSpeaker( speakerId );
    	model.addAttribute( "speaker", speaker );
    	
    	log.info( "updateSpeakerForm : exit" );
    	return "events/updateSpeaker";
    }
    
    @RequestMapping( value = "/{eventId}/speakers/{speakerId}", method = RequestMethod.PUT )
    @Transactional
    public String updateSpeaker( @PathVariable( "eventId" ) Long eventId, @PathVariable( "speakerId" ) Long speakerId, @Valid Speaker speaker, BindingResult result, Model model, HttpServletRequest request ) {
        log.info( "updateSpeaker : enter" );

        if( result.hasErrors() ) {
            model.addAttribute( "speaker", speaker );
            model.addAttribute( "eventId", eventId );
            
            log.info( "updateSpeaker : exit, errors exist" );
            return "events/updateSpeaker";
        }

        speaker.setWebSite( cleanWebSite( speaker.getWebSite() ) );

    	log.debug( "updateSpeaker : merging speaker" );
    	speaker.merge();
    	
        log.info( "updateSpeaker : exit" );
        return "redirect:/events/" + encodeUrlPathSegment( eventId.toString(), request ) + "?form";
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

    private String cleanWebSite( String webSite ) {
    	if( null != webSite && !"".equals( webSite ) ) {
    		if( webSite.toLowerCase().indexOf( "http://" ) == -1 ) {
    			webSite = "http://" + webSite;
    		}
    	}

    	return webSite;
    }
    
}
