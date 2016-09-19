
function resizeend(target) {
	if (new Date() - rtime < delta) {
		setTimeout(resizeend(target), delta);
	} else {
		timeout = false;

		var height = $('#trashbox').height();

		if (height > 700) {
			$(target).css('height', height);
		}

	}
}

if ($.browser.mobile) {

	var rtime;
	var timeout = false;
	var delta = 200;
	$(window).resize(function() {
		rtime = new Date();
		if (timeout === false) {
			timeout = true;
			setTimeout(resizeend(target), delta);
		}
	});

}