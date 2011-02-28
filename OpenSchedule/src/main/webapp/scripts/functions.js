function storeInSession( key, value ) {
	//console.debug( "storeInSession : enter" );
	
	if( window.sessionStorage ) {
		sessionStorage.setItem( key, value );
	} else {
		createCookie( key, value, -1 );
	}

	//console.debug( "storeInSession : exit" );
}

function retrieveFromSession( key ) {
	//console.debug( "retrieveFromSession : enter" );
	
	var value = "";
	if( window.sessionStorage ) {
		value = sessionStorage.getItem( key );
	} else {
		value = readCookie( key );
	}

	//console.debug( "retrieveFromSession : exit" );
	return value;
}

function removeFromSession( key ) {
	//console.debug( "removeFromSession : enter" );
	
	if( window.sessionStorage ) {
		sessionStorage.removeItem( key );
	} else {
		createCookie( key, "", -1 );
	}

	//console.debug( "removeFromSession : exit" );
}

function createCookie( name, value, days ) {
	//console.debug( "createCookie : enter" );
	
	var expires = "; expires=Thu, 01-Jan-1970 00:00:01 GMT" ;

	if( days && days > 0 ) {
		var date = new Date();
		date.setTime( date.getTime() + ( days * 24 * 60 * 60 * 1000 ) );
		expires = "; expires=" + date.toGMTString();
	}
	
	document.cookie = name + "=" + value + expires + "; path=/";

	//console.debug( "createCookie : exit" );
}

function readCookie( name ) {
	//console.debug( "readCookie : enter" );

	var result = ""
	var nameEQ = name + "=" ;
	var ca = document.cookie.split( ';' );
	
	for( var i=0 ;i < ca.length; i++ ) {
		var c = ca[ i ];
		while( c.charAt( 0 ) == ' ' ) {
			c = c.substring( 1, c.length );
		}
	
		if( c.indexOf( nameEQ ) == 0 ) {
			result = c.substring( nameEQ.length, c.length );
		} else {
			result = "" ;
		}
	}
	
	//console.debug( "readCookie : exit" );
	return( result );
}
