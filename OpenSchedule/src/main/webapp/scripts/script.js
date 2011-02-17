$( document ).ready( function() {
	console.debug( "initialize : enter" );
	
	console.debug( "initialize : OpenID" );
	initOpenID();
	
	console.debug( "initialize : TabContainer" );
	initTabContainer();
	
	$( '.viewAgenda article div tr td' ).tooltip( { showURL: false, positionLeft: true } );
	
	console.debug( "initialize : exit" );
});

$( function() {

	$( "#event-comment" ).button().click( function() { $( "#eventCommentDialog" ).dialog( "open" ); });

	$( ".comment-dialog" ).validate();
	
	$( '.comment-dialog' ).dialog({
		autoOpen: false,
		height: 290,
		width: 350,
		modal: true,
		buttons: {
			"Add Comment": function() {
				var form = $( this ).find( 'form' )
				
				form.submit();
			},
			Cancel: function() {
				$( this ).dialog( "close" );
			}
		}
	});
	
	$( 'section.viewAgenda article div tr td' ).click( function() {
		var dialog = $( this ).attr( 'data-commentDialog' );
		$( dialog ).dialog( "open" );
	});	
});

$( function() {
	$( '#labelName' ).timepicker({});
});

$( function() {
	$( 'input[type=date]' ).datepicker({
		minDate: -1,
		inline: true,
		dateFormat: "yy-mm-dd"
	});
});

$( function() {
	
	$( '.details h3' ).click( function() {
		$( this ).siblings( '.articleDetails' ).toggle();
		
		if( $( this ).siblings( '.articleDetails' ).is( ':visible' ) ) {
			$( this ).children( '.toggle' ).html( '(hide)' );
		} else {
			$( this ).children( '.toggle' ).html( '(expand)' );
		}
	});
	
	$( '.articleDetails > ul li > a.expand' ).click( function( e ) {
		e.preventDefault();
		
		$( this ).siblings( 'div' ).toggle();
		
		if( $( this ).siblings( 'div' ).is( ':visible' ) ) {
			$( this ).html( '-' );
		} else {
			$( this ).html( '+' );
		}
	});

});

$( function() {
	$( '.labelSelect' ).blur( function() {
		console.debug( ".labelSelect : enter" );
		
		var eventId = $( this ).attr( "data-eventId" );
		console.debug( "eventId=" + eventId );

		var dayId = $( this ).attr( "data-dayId" );
		console.debug( "dayId=" + dayId );

		var scheduleId = $( this ).attr( "data-scheduleId" );
		console.debug( "scheduleId=" + scheduleId );
		
		var blockId = $( this ).attr( "data-blockId" );
		console.debug( "blockId=" + blockId );
		
		var value = $( this ).val();
		console.debug( "value=" + value );
		
		$.post(
			'/schedule/events/' + eventId + '/days/' + dayId + '/schedules/' + scheduleId + '/blocks/' + blockId,
			{ 'label' : true, 'labelId': value },
			function( data ) {
				console.dir( data );
			},
			'json'
		);

		console.debug( ".labelSelect : exit" );
	});

	$( '.durationSelect' ).blur( function() {
		console.debug( ".durationSelect : enter" );

		var eventId = $( this ).attr( "data-eventId" );
		console.debug( "eventId=" + eventId );

		var dayId = $( this ).attr( "data-dayId" );
		console.debug( "dayId=" + dayId );

		var scheduleId = $( this ).attr( "data-scheduleId" );
		console.debug( "scheduleId=" + scheduleId );
		
		var blockId = $( this ).attr( "data-blockId" );
		console.debug( "blockId=" + blockId );
		
		var value = $( this ).val();
		console.debug( "value=" + value );
		
		$.post(
			'/schedule/events/' + eventId + '/days/' + dayId + '/schedules/' + scheduleId + '/blocks/' + blockId,
			{ 'duration': value },
			function( data ) {
				console.dir( data );
			},
			'json'
		);

		console.debug( ".durationSelect : exit" );
	});

	$( '.sessionSelect' ).blur( function() {
		console.debug( ".sessionSelect : enter" );

		var eventId = $( this ).attr( "data-eventId" );
		console.debug( "eventId=" + eventId );

		var dayId = $( this ).attr( "data-dayId" );
		console.debug( "dayId=" + dayId );

		var scheduleId = $( this ).attr( "data-scheduleId" );
		console.debug( "scheduleId=" + scheduleId );
		
		var blockId = $( this ).attr( "data-blockId" );
		console.debug( "blockId=" + blockId );
		
		var value = $( this ).val();
		console.debug( "value=" + value );
		
		$.post(
			'/schedule/events/' + eventId + '/days/' + dayId + '/schedules/' + scheduleId + '/blocks/' + blockId,
			{ 'session' : true, 'sessionId': value },
			function( data ) {
				console.dir( data );
			},
			'json'
		);

		console.debug( ".sessionSelect : exit" );
	});
});

$( function() {
	$( '#eventJson' ).click( function( e ) {
		
		var eventId = $( this ).attr( 'data-id' );
		console.debug( "eventId=" + eventId );
		
		$.get(
			'/schedule/events/' + eventId,
			function( data ) {
				console.debug( data );
			},
			'json'
		);
	});
});

$( function() {
	$( '#publishedEventsJson' ).click( function( e ) {
		
		$.get(
			'/schedule/view?published=true',
			function( data ) {
				console.debug( data );
			},
			'json'
		);
	});
});

$( function() {
	$( '#eventCommentsJson' ).click( function( e ) {
		
		var shortName = $( this ).attr( 'data-shortName' );
		
		$.get(
			'/schedule/public/' + shortName + '/comments',
			function( data ) {
				console.debug( data );
			},
			'json'
		);
	});
});

$( function() {
	$( '.webSitePopupLink' ).click( function( e ) {
		e.preventDefault();
		
		var href = $( this ).attr( 'href' );
		window.open( href );
		return false;
	});
});

$( function() {
	$( '.popupLink' ).click( function( e ) {
		console.debug( 'popupLink.click : enter' );
		
		e.preventDefault();
		
		$( this ).siblings( '.popupForm' ).toggle();
		
		console.debug( 'popupLink.click : exit' );
	});

	$( '.popupFormClose' ).children( 'a' ).click( function( e ) {
		console.debug( 'popupFormClose.click : enter' );

		e.preventDefault();
		
		var form = $( this ).attr( 'data-form' );
		$( "#" + form ).hide();
		
		console.debug( 'popupFormClose.click : exit' );
	});
	
	$( 'input[type=submit]' ).click( function() {
		console.debug( "input[type=submit] : enter" );
		
		var article = $( this ).attr( 'data-article' );
		console.debug( "article=" + article );
		if( null != article ) {
			console.debug( "input[type=submit] : storing article in session" );
			storeInSession( "schedule_update_article", article );
		}
		
		var form = $( this ).attr( 'data-form' );
		console.debug( "form=" + form );
		if( null != form ) {		
			console.debug( "input[type=submit] : storing form in session" );
			storeInSession( "schedule_update_form", form );
		}
		
		console.debug( "input[type=submit] : exit" );
	});

	$( '.updateFormLinks a' ).click( function() {
		console.debug( ".updateFormLinks a : enter" );
		
		var article = $( this ).attr( 'data-article' );
		console.debug( "article=" + article );
		if( null != article ) {
			console.debug( ".updateFormLinks a : storing article in session" );
			storeInSession( "schedule_update_article", article );
		}
		
		console.debug( ".updateFormLinks a : exit" );
	});

});

$( function() {
	if( !hasAutofocus() ){
		$( 'input[autofocus=true]' ).focus();
	}
});

function initOpenID() {
	console.debug( "initOpenId : enter" );
	
	openid.init( 'openid_identifier' );

	console.debug( "initOpenId : exit" );
}

function initTabContainer() {
	console.debug( "initTabContainer : enter" );

	$( '#tabs article' ).hide(); // Hide all divs
	$( '#tabs article:first' ).show(); // Show the first div
	$( '#tabs ul li:first' ).addClass( 'active' ); // Set the class of the first link to active
	$( '#tabs ul li a' ).click( function() { //When any link is clicked
		$( '#tabs ul li' ).removeClass( 'active' ); // Remove active class from all links
		$( this ).parent().addClass( 'active' ); //Set clicked link class to active
		var currentTab = $( this ).attr( 'href' ); // Set variable currentTab to value of href attribute of clicked link
		$( '#tabs article' ).hide(); // Hide all divs
		$( currentTab ).show(); // Show div with id equal to variable currentTab
		
		return false;
	});

	console.debug( "initTabContainer : exit" );
}

function hasAutofocus() {
	var element = document.createElement( 'input' );
	return 'autofocus' in element;
}

function hasPlaceholderSupport() {
	var i = document.createElement( 'input' );
	return 'placeholder' in i;
}
