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

<html>
    <head>
        <title>Schedule</title>
	
	<style>
	    table td {
		border: solid black 1px;
		padding: 2px;
		margin: 2px;
		width: 160px;
	    }

	    table td.timeslot {
		width: 35px;
		vertical-align: top;
	    }

	    span.title {
		display: block;
		font-size: 14px;
		font-weight: bold;
		padding-bottom: 5px;
	    }

	    span.speaker {
		display: block;
		font-size: 12px;
   		margin-left: 10px;
	    }

	</style>
    </head>

    <body>
	<? foreach( $event->{ 'days' } as $day ) { ?>
	<div>
	    <h2>Schedule for: <? echo date( 'Y-m-d', strtotime( substr( $day->{ 'date' }, 0, 10 ) ) ) ?></h2>
	    <?
	        $schedules = $day->{ 'schedules' };
	        if( count( $schedules ) > 0 ) {
	    ?>
	    <table>
		<?
		    $blockIndex = 0;
		    foreach( $schedules[0]->{ 'blocks' } as $block ) {
		?>
		<tr>
		    <td class="timeslot">
		   	<?
			    if( null != $block->{ 'label' } ) {    
			?>
			<? echo $block->{ 'label' }->{ 'name' } ?>
		   	<?
			    }
			?>
		    </td>
		    <td class="session">
		   	<?
			    if( null != $block->{ 'session' } ) {    
			?>
			<span class="title"><? echo $block->{ 'session' }->{ 'name' } ?></span>
		   	<?
				foreach( $block->{ 'session' }->{ 'speakers' } as $speaker ) {
			?>
			<span class="speaker"><? echo $speaker->{ 'name' } ?></span>
			<?
			    	}
			    }
			?>
		    </td>
		    <?
			for( $scheduleIndex = 1; $scheduleIndex < count( $schedules ); $scheduleIndex++ ) {
			    $ajacentBlock = $schedules[ $scheduleIndex ]->{ 'blocks' }[ $blockIndex ];
		    ?>
		    <td class="session">
		   	<?
			    if( null != $ajacentBlock->{ 'session' } ) {    
			?>
			<span class="title"><? echo $ajacentBlock->{ 'session' }->{ 'name' } ?></span>
			<?
			    	foreach( $ajacentBlock->{ 'session' }->{ 'speakers' } as $ajacentBlockSpeaker ) {
			?>
			<span class="speaker"><? echo $ajacentBlockSpeaker->{ 'name' } ?></span>
			<?
			    	}
			    }
			?>
		    </td>
		    <?
			}
		    ?>
		</tr>
		<?
		    	$blockIndex++;
		    }
		?>
            </table>
	    <? } ?>
	</div>
	<? } ?>

    </body>
</html>

