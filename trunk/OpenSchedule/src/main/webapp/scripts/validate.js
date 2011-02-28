$( function() {
	
	$( '#eventName, #sponsorCompanyName, #sponsorContactName, #roomName, #venueName, #trackName, #speakerName, #sessionName' ).validate({
		valid: function( val ) {
			return eventName_validate( val ) == "";
		},
		errorMessage: function( val ) {
			return eventName_validate( val );
		},
		appendCompletionIcon: true
	});
	
	var eventName_validate = function( val ) {
		//console.debug( "eventName_validate : enter" );
		
		if( val == "" ) {
			//console.debug( "eventName_validate : exit, blank" );
			return " is required";
		} else if( val.length > 255 ) {
			//console.debug( "eventName_validate : exit, length" );
			return " can not be greater than 255 characters.";
		} else if( val.match(/^[A-Za-z0-9-\s\.,]*$/) ) {
			//console.debug( "eventName_validate : exit" );
			return "";
        }
		
		//console.debug( "eventName_validate : exit, not valid" );
		return " is not valid";
	};

	$( '#eventShortName' ).validate({
		valid: function( val ) {
			return eventShortName_validate( val ) == "";
		},
		errorMessage: function( val ) {
			return eventShortName_validate( val );
		},
		appendCompletionIcon: true
	});

	var eventShortName_validate = function( val ) {
		//console.debug( "eventShortName_validate : enter" );
		
		if( val == "" ) {
			//console.debug( "eventShortName_validate : blank" );
			return " is required";
		} else if( val.length > 10 ) {
			//console.debug( "eventShortName_validate : length" );
			return " can not be greater than 10 characters.";
		} else if( !val.match(/^[A-Za-z0-9-]+$/) ) {
			//console.debug( "eventShortName_validate : exit, format" );
			return " can only contain letters and numbers";
		} else if( val.match(/^[A-Za-z0-9-]+$/) ) {
			//console.debug( "eventShortName_validate : exit" );
			return "";
		}
		
		//console.debug( "eventShortName_validate : exit, not valid" );
		return " is not valid";
	};

	$( '#labelName' ).validate({
		valid: function( val ) {
			return labelName_validate( val ) == "";
		},
		errorMessage: function( val ) {
			return labelName_validate( val );
		},
		appendCompletionIcon: true
	});

	var labelName_validate = function( val ) {
		//console.debug( "labelName_validate : enter" );
		
		if( val == "" ) {
			//console.debug( "labelName_validate : blank" );
			return " is required";
		} else if( val.length > 10 ) {
			//console.debug( "labelName_validate : length" );
			return " can not be greater than 10 characters.";
		} else if( !val.match(/^([0-9]){2}:([0-9]){2}$/) ) {
			//console.debug( "labelName_validate : exit, format" );
			return " can only contain numbers and a colon";
		} else if( val.match(/^([0-9]){2}:([0-9]){2}$/) ) {
			//console.debug( "labelName_validate : exit" );
			return "";
		}
		
		//console.debug( "labelName_validate : exit, not valid" );
		return " is not valid";
	};

	$( '#eventStartDate' ).validate({
		valid: function( val ) {
			return eventStartDate_validate( val ) == "";
		},
		errorMessage: function( val ) {
			return eventStartDate_validate( val );
		},
		appendCompletionIcon: true
	});

	var eventStartDate_validate = function( val ) {
		//console.debug( "eventStartDate_validate : enter" );
		
		if( val == "" ) {
			//console.debug( "eventStartDate_validate : exit, blank" );
			return " is required";
		} else if( val.length > 10 ) {
			//console.debug( "eventStartDate_validate : exit, length" );
			return " can not be greater than 10 characters.";
		} else if( val.match(/^[0-9]{4}-[0-9]{2}-[0-9]{2}$/) ) {
			//console.debug( "eventStartDate_validate : exit" );
			return "";
        }
		
		//console.debug( "eventStartDate_validate : exit, not valid" );
		return " is not valid";
	};

	$( '#eventPublishDate' ).validate({
		valid: function( val ) {
			return eventPublishDate_validate( val ) == "";
		},
		errorMessage: function( val ) {
			return eventPublishDate_validate( val );
		},
		appendCompletionIcon: true
	});

	var eventPublishDate_validate = function( val ) {
		//console.debug( "eventPublishDate_validate : enter" );
		
		if( val == "" ) {
			//console.debug( "eventPublishDate_validate : exit" );
			return "";
		} else if( val.length > 10 ) {
			//console.debug( "eventPublishDate_validate : exit, length" );
			return " can not be greater than 10 characters.";
		} else if( val.match(/^[0-9]{4}-[0-9]{2}-[0-9]{2}$/) ) {
			//console.debug( "eventPublishDate_validate : exit" );
			return "";
        }
		
		//console.debug( "eventPublishDate_validate : exit, not valid" );
		return " is not valid";
	};

	$( '#eventNumberOfDays' ).validate({
		valid: function( val ) {
			return eventNumberOfDays_validate( val ) == "";
		},
		errorMessage: function( val ) {
			return eventNumberOfDays_validate( val );
		},
		appendCompletionIcon: true
	});

	var eventNumberOfDays_validate = function( val ) {
		//console.debug( "eventNumberOfDays_validate : enter" );
		
		if( val == "" ) {
			//console.debug( "eventNumberOfDays_validate : exit, blank" );
			return " is required";
		} else if( val.match(/^[0-9]+$/) ) {
			//console.debug( "eventNumberOfDays_validate : exit" );
			return "";
        }
		
		//console.debug( "eventStartDate_validate : exit, not valid" );
		return " is not valid";
	};

    $( "#sponsorContactEmail, #venueEmail, #speakerEmail, .comment-dialog input[type=text][name=email]" ).validate({
        valid: function( val ) {
        	if( val == "" ) {
        		return true;
        	}
        	
        	return val.match( /^[A-Za-z0-9\+]+\@[A-Za-z0-9]+\.[A-Za-z0-9]+$/ );
        },
        errorMessage: function( val ){
            return " must be a valid email address";
        },
        appendCompletionIcon: true
    });

    $( "#sponsorContactPhone, #venuePhone, #speakerPhone" ).validate({
        valid: function( val ) {
        	if( val == "" ) {
        		return true;
        	}
        	
        	return val.match( /^(?:(?:\+?1\s*(?:[.-]\s*)?)?(?:\(\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9])\s*\)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\s*(?:[.-]\s*)?)?([2-9]1[02-9]|[2-9][02-9]1|[2-9][02-9]{2})\s*(?:[.-]\s*)?([0-9]{4})(?:\s*(?:#|x\.?|ext\.?|extension)\s*(\d+))?$/ );
        },
        errorMessage: function( val ){
            return " must be a valid phone number";
        },
        appendCompletionIcon: true
    });
    
    $( "#sponsorWebSite, #venueWebSite, #speakerWebSite" ).validate({
        valid: function( val ) {
        	if( val == "" ) {
        		return true;
        	}
        	
        	return val.match( /^((http|https)\:\/\/[a-zA-Z0-9_\-]+(?:\.[a-zA-Z0-9_\-]+)*\.[a-zA-Z]{2,4}(?:\/[a-zA-Z0-9_]+)*(?:\/[a-zA-Z0-9_]+\.[a-zA-Z]{2,4}(?:\?[a-zA-Z0-9_]+\=[a-zA-Z0-9_]+)?)?(?:\&[a-zA-Z0-9_]+\=[a-zA-Z0-9_]+)*)$/ );
        },
        errorMessage: function( val ){
            return " must be a valid web site";
        },
        appendCompletionIcon: true
    });

	$( '#venueAddressOne, #venueAddressTwo, #venueCity' ).validate({
		valid: function( val ) {
			if( val == "" ) {
				return true;
			}
			
			return venueAddress_validate( val ) == "";
		},
		errorMessage: function( val ) {
			return venueAddress_validate( val );
		},
		appendCompletionIcon: true
	});

	var venueAddress_validate = function( val ) {
		//console.debug( "venueAddress_validate : enter" );
		
		//console.debug( val );
		if( val == "" ) {
			//console.debug( "venueAddress_validate : exit" );
			return "";
		} else if( val.length > 255 ) {
			//console.debug( "venueAddress_validate : exit, length" );
			return " can not be greater than 255 characters.";
		} else if( val.match(/^[A-Za-z0-9-\s\.]*$/) ) {
			//console.debug( "venueAddress_validate : exit" );
			return "";
        }
		
		//console.debug( "venueAddress_validate : exit, not valid" );
		return " is not valid";
	};

    $( "#venueState" ).validate({
        valid: function( val ) {
        	if( val == "" ) {
        		return true;
        	}
        	
        	return val.match( /^(A[LKSZRAEP]|C[AOT]|D[EC]|F[LM]|G[ANU]|HI|I[ADLN]|K[SY]|LA|M[ADEHINOPST]|N[CDEHJMVY]|O[HKR]|P[ARW]|RI|S[CD]|T[NX]|UT|V[AIT]|W[AIVY])$/ );
        },
        errorMessage: function( val ){
            return " must be a valid US State";
        },
        appendCompletionIcon: true
    });
    
    $( "#venueZip" ).validate({
        valid: function( val ) {
        	if( val == "" ) {
        		return true;
        	}
        	
        	return val.match( /^\d{5}(-\d{4})?$/ );
        },
        errorMessage: function( val ){
            return " must be a valid zip code";
        },
        appendCompletionIcon: true
    });
	
	$( '.comment-dialog input[type=text][name=name]' ).validate({
		valid: function( val ) {
        	if( val == "" ) {
        		return true;
        	}

			return commentName_validate( val ) == "";
		},
		errorMessage: function( val ) {
			return commentName_validate( val );
		},
		appendCompletionIcon: true
	});
	
	var commentName_validate = function( val ) {
		//console.debug( "commentName_validate : enter" );
		
		if( val == "" ) {
			//console.debug( "commentName_validate : exit, blank" );
			return "";
		} else if( val.length > 255 ) {
			//console.debug( "commentName_validate : exit, length" );
			return " can not be greater than 255 characters.";
		} else if( val.match(/^[A-Za-z0-9-\s\.,]*$/) ) {
			//console.debug( "commentName_validate : exit" );
			return "";
        }
		
		//console.debug( "commentName_validate : exit, not valid" );
		return " is not valid";
	};

	$( '.comment-dialog textarea[name=comment]' ).validate({
		valid: function( val ) {
			return commentComment_validate( val ) == "";
		},
		errorMessage: function( val ) {
			return commentName_validate( val );
		},
		appendCompletionIcon: true
	});
	
	var commentComment_validate = function( val ) {
		//console.debug( "commentComment_validate : enter" );
		
		if( val == "" ) {
			//console.debug( "commentComment_validate : exit, blank" );
			return " is required.";
		} else if( val.length > 255 ) {
			//console.debug( "commentComment_validate : exit, length" );
			return " can not be greater than 255 characters.";
		} else if( val.match(/^[A-Za-z0-9-\s\.,]*$/) ) {
			//console.debug( "commentComment_validate : exit" );
			return "";
        }
		
		//console.debug( "commentComment_validate : exit, not valid" );
		return " is not valid";
	};

});