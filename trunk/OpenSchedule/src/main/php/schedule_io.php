<?php

// connect to schedule json endpoint

//$request = 'http://localhost:8080/schedule/view/TEST2';
$request = 'http://stream.tllts.org:8080/schedule/view/ILF2011';

$ci = curl_init( $request );
curl_setopt( $ci, CURLOPT_RETURNTRANSFER, TRUE );
curl_setopt( $ci, CURLOPT_HTTPHEADER, array( "Accept: application/json" ) ); 
$json = curl_exec( $ci );
//print $json;

// parameter 'true' is necessary for output as PHP array
$event = json_decode( $json );
//var_dump( $event );
?>
<!DOCTYPE html>
<html>
    <head>
        <title>Schedule</title>

	<style>

	    /* http://meyerweb.com/eric/tools/css/reset/ 
	       v2.0 | 20110126
	       License: none (public domain)
	    */

	    html, body, div, span, applet, object, iframe,
	    h1, h2, h3, h4, h5, h6, p, blockquote, pre,
	    a, abbr, acronym, address, big, cite, code,
	    del, dfn, em, img, ins, kbd, q, s, samp,
	    small, strike, strong, sub, sup, tt, var,
	    b, u, i, center,
	    dl, dt, dd, ol, ul, li,
	    fieldset, form, label, legend,
	    table, caption, tbody, tfoot, thead, tr, th, td,
	    article, aside, canvas, details, embed, 
	    figure, figcaption, footer, header, hgroup, 
	    menu, nav, output, ruby, section, summary,
	    time, mark, audio, video {
	    	margin: 0;
	    	padding: 0;
	    	border: 0;
	    	font-size: 100%;
	    	font: inherit;
	    	vertical-align: baseline;
	    }

	    /* HTML5 display-role reset for older browsers */
	    article, aside, details, figcaption, figure, 
	    footer, header, hgroup, menu, nav, section {
	    	display: block;
	    }

	    body {
	    	line-height: 1;
	    }

	    ol, ul {
	    	list-style: none;
	    }

	    blockquote, q {
	    	quotes: none;
	    }

	    blockquote:before, blockquote:after,
	    q:before, q:after {
	    	content: '';
	    	content: none;
	    }

	    table {
	    	border-collapse: collapse;
	    	border-spacing: 0;
	    }


	    /* Custom CSS */
	    body {
		font-family: verdana, arial, sans-serif;
	    }

	    h1 {
		margin-left: 10px;
		font-size: 18px;
	    }

	    h2 {
		margin-left: 20px;
		font-size: 14px;
		font-style: italic;
	    }

	    h3 {
		margin-left: 20px;
		font-size: 11px;
	    }

	    header {
		padding: 10px 0;
	    }

	    section > header {
		border-top: solid black 1px;
	    }

	    table {
		margin: 10px;
	    }

	    table tr:nth-child(odd) {
	 	background: gray;
	    }

	    table tr:nth-child(even) {
	 	background: white;
	    }

	    table tr:first-child {
	 	background: white;
		border-bottom: solid black 1px;
	    }

	    tr td, tr th {
		width: 150px;
		padding: 5px;
		margin: 0 2px;
		font-size: 11px;
	    }

	    tr td.session {
		background: blue;
	    }

	    tr td:nth-child(n+1), tr th:nth-child(n+1) {
		width: 10px;
	    }

	    tr td:nth-child(2n+2), tr th:nth-child(2n+2) {
		border-left: solid black 1px;
	    }

	</style>
    </head>

    <body>

	<? foreach( $event->{ 'days' } as $day ) { ?>
	<section>

	    <header>
		<h1><? echo date( 'l, F j\t\h Y', strtotime( substr( $day->{ 'date' }, 0, 10 ) ) ) ?></h1>
	    </header>

	    <? foreach( $day->{ 'schedules' } as $schedule ) { ?>
	    <article>

		<header>		        
		    <h2><? echo $schedule->{ 'track' }->{ 'name' } ?></h2>
		</header>

		<table>
		    <tr>
		    	<th></th>
		    	<th>7</th>
		    	<th></th>
		    	<th>8</th>
		    	<th></th>
		    	<th>9</th>
		    	<th></th>
		    	<th>10</th>
		    	<th></th>
		    	<th>11</th>
		    	<th></th>
		    	<th>12</th>
		    	<th></th>
		    	<th>1</th>
		    	<th></th>
		    	<th>2</th>
		    	<th></th>
		    	<th>3</th>
		    	<th></th>
		    	<th>4</th>
		    	<th></th>
		    	<th>5</th>
		    	<th></th>
		    	<th>6</th>
		    	<th></th>
	            </tr>

 		    <? 
			foreach( $schedule->{ 'blocks' } as $block ) { 
			    $span = $block->{ 'duration' } / 30;
			    $showSpan = false;
		    ?>
		    <tr>
			<td><? echo $block->{ 'session' }->{ 'name' } ?></td>
			<td <? if( $block->{ 'label' }->{ 'name' } == '07:00' ) { ?>class="session"<? $showSpan = true; $span--; } ?>><!-- 07:00 --></td>
		    	<td <? if( ( $showSpan && $span > 0 ) || $block->{ 'label' }->{ 'name' } == '07:30' ) { ?>class="session"<? $showSpan = true; $span--; } ?>><!-- 07:30 --></td>
			<td <? if( ( $showSpan && $span > 0 ) || $block->{ 'label' }->{ 'name' } == '08:00' ) { ?>class="session"<? $showSpan = true; $span--; } ?>><!-- 08:00 --></td>
		    	<td <? if( ( $showSpan && $span > 0 ) || $block->{ 'label' }->{ 'name' } == '08:30' ) { ?>class="session"<? $showSpan = true; $span--; } ?>><!-- 08:30 --></td>
			<td <? if( ( $showSpan && $span > 0 ) || $block->{ 'label' }->{ 'name' } == '09:00' ) { ?>class="session"<? $showSpan = true; $span--; } ?>><!-- 09:00 --></td>
		    	<td <? if( ( $showSpan && $span > 0 ) || $block->{ 'label' }->{ 'name' } == '09:30' ) { ?>class="session"<? $showSpan = true; $span--; } ?>><!-- 09:30 --></td>
			<td <? if( ( $showSpan && $span > 0 ) || $block->{ 'label' }->{ 'name' } == '10:00' ) { ?>class="session"<? $showSpan = true; $span--; } ?>><!-- 10:00 --></td>
		    	<td <? if( ( $showSpan && $span > 0 ) || $block->{ 'label' }->{ 'name' } == '10:30' ) { ?>class="session"<? $showSpan = true; $span--; } ?>><!-- 10:30 --></td>
			<td <? if( ( $showSpan && $span > 0 ) || $block->{ 'label' }->{ 'name' } == '11:00' ) { ?>class="session"<? $showSpan = true; $span--; } ?>><!-- 11:00 --></td>
		    	<td <? if( ( $showSpan && $span > 0 ) || $block->{ 'label' }->{ 'name' } == '11:30' ) { ?>class="session"<? $showSpan = true; $span--; } ?>><!-- 11:30 --></td>
			<td <? if( ( $showSpan && $span > 0 ) || $block->{ 'label' }->{ 'name' } == '12:00' ) { ?>class="session"<? $showSpan = true; $span--; } ?>><!-- 12:00 --></td>
		    	<td <? if( ( $showSpan && $span > 0 ) || $block->{ 'label' }->{ 'name' } == '12:30' ) { ?>class="session"<? $showSpan = true; $span--; } ?>><!-- 12:30 --></td>
			<td <? if( ( $showSpan && $span > 0 ) || $block->{ 'label' }->{ 'name' } == '13:00' ) { ?>class="session"<? $showSpan = true; $span--; } ?>><!-- 13:00 --></td>
		    	<td <? if( ( $showSpan && $span > 0 ) || $block->{ 'label' }->{ 'name' } == '13:30' ) { ?>class="session"<? $showSpan = true; $span--; } ?>><!-- 13:30 --></td>
			<td <? if( ( $showSpan && $span > 0 ) || $block->{ 'label' }->{ 'name' } == '14:00' ) { ?>class="session"<? $showSpan = true; $span--; } ?>><!-- 14:00 --></td>
		    	<td <? if( ( $showSpan && $span > 0 ) || $block->{ 'label' }->{ 'name' } == '14:30' ) { ?>class="session"<? $showSpan = true; $span--; } ?>><!-- 14:30 --></td>
			<td <? if( ( $showSpan && $span > 0 ) || $block->{ 'label' }->{ 'name' } == '15:00' ) { ?>class="session"<? $showSpan = true; $span--; } ?>><!-- 15:00 --></td>
		    	<td <? if( ( $showSpan && $span > 0 ) || $block->{ 'label' }->{ 'name' } == '15:30' ) { ?>class="session"<? $showSpan = true; $span--; } ?>><!-- 15:30 --></td>
			<td <? if( ( $showSpan && $span > 0 ) || $block->{ 'label' }->{ 'name' } == '16:00' ) { ?>class="session"<? $showSpan = true; $span--; } ?>><!-- 16:00 --></td>
		    	<td <? if( ( $showSpan && $span > 0 ) || $block->{ 'label' }->{ 'name' } == '16:30' ) { ?>class="session"<? $showSpan = true; $span--; } ?>><!-- 16:30 --></td>
			<td <? if( ( $showSpan && $span > 0 ) || $block->{ 'label' }->{ 'name' } == '17:00' ) { ?>class="session"<? $showSpan = true; $span--; } ?>><!-- 17:00 --></td>
		    	<td <? if( ( $showSpan && $span > 0 ) || $block->{ 'label' }->{ 'name' } == '17:30' ) { ?>class="session"<? $showSpan = true; $span--; } ?>><!-- 17:30 --></td>
			<td <? if( ( $showSpan && $span > 0 ) || $block->{ 'label' }->{ 'name' } == '18:00' ) { ?>class="session"<? $showSpan = true; $span--; } ?>><!-- 18:00 --></td>
		    	<td <? if( ( $showSpan && $span > 0 ) || $block->{ 'label' }->{ 'name' } == '18:30' ) { ?>class="session"<? $showSpan = true; $span--; } ?>><!-- 18:30 --></td>
		    </tr>
		    <? } ?>
		</table>

	    <? } ?>
	    </article>

	<? } ?>
	</section>

    </body>
</html>

