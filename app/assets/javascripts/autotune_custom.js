$(document).ready(function() {

	$('#iWantTo div.action').hover( function() {
		$(this).find('span.highlight').stop().animate({ opacity: .2 }, 200);
		console.log('hover');
	}, function() {
		$(this).find('span.highlight').stop().animate({ opacity: 0 }, 100);
	});

	function showButtons() {
		$('#iWantTo').animate({ marginTop: '0', opacity: 1 }, 200, function() {
			$('#iWantTo div.row .action:first').animate({ marginTop: '0', opacity: 1}, 200 );
			setTimeout( function() { $('#iWantTo div.row .action').eq(1).animate({ marginTop: '0', opacity: 1}, 200 ); }, 30 );
			setTimeout( function() { $('#iWantTo div.row .action').eq(2).animate({ marginTop: '0', opacity: 1}, 200 ); }, 60 );
			setTimeout( function() { $('#iWantTo div.row .action').eq(3).animate({ marginTop: '0', opacity: 1}, 200 ); }, 90 );
			setTimeout( function() { $('#iWantTo div.row .action').eq(4).animate({ marginTop: '0', opacity: 1}, 200 ); }, 120 );
			setTimeout( function() { $('#iWantTo div.row .action').eq(5).animate({ marginTop: '0', opacity: 1}, 200 ); }, 150 );
		});
	}
	
	function showTweetForm() {
		$('#iWantTo').animate({ marginTop: '50px', opacity: 0}, 100);
		$('#tweetThis').animate({ marginTop: '90px', opacity: 1 }, 200, function() {
			$('#tweetThis #tweetThisForm').animate({ marginTop: '30px', opacity: 1}, 200, function() {
				$('#tweetThisForm input').animate({ marginTop: '0', opacity: 1}, 200)
			});
		});
	}
	
	function showPlaylist() {
		$('#tweetThis').animate({ marginTop: '100px', opacity: 0}, 100);
		$('#musicPlayer').animate({ marginTop: '60px', opacity: 1 }, 200, function() {
			$('#musicPlayer #playerBackground').animate({ marginTop: '120px', opacity: 1}, 200 )
		});
	}
	
	showButtons();
	
	$('#button_1').click( function() { showButtons(); } );
	$('#button_2').click( function() { showTweetForm(); } );
	$('#button_3').click( function() { showPlaylist(); } );
	
});

