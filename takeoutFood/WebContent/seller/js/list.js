$(function() {
	$(".inner").hover(function() {
		$(this).css("border", "1px solid red");
	}, function() {
		$(this).css("border", "1px solid #f5c14c");
	});
});