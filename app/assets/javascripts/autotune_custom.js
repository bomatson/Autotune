$(document).ready(function() {
	$('#iWantTo div.action').hover( function() {
		$(this).find('span.highlight').stop().animate({ opacity: .2 }, 200);
		console.log('hover');
	}, function() {
		$(this).find('span.highlight').stop().animate({ opacity: 0 }, 100);
	});
});